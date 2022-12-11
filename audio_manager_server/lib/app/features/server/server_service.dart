import 'dart:async';
import 'dart:io';

import 'package:audio_manager_utils/audio_manager_utils.dart';
import 'package:flutter/material.dart' hide Route;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jaguar/jaguar.dart';
import 'package:logging/logging.dart';

final serverServiceProvider = Provider<ServerService>((ref) => JaguarServerServiceImpl());

abstract class ServerService {
  late NetworkInfo networkInfo;

  void init(NetworkInfo networkInfo);
  bool get isRunning;

  Future<void> start();

  Future<void> stop();

  Route get(
    String path,
    RouteHandler callback, {
    ContentType? contentType,
  });

  Route post(
    String path,
    RouteHandler callback, {
    ContentType? contentType,
  });

  Route put(
    String path,
    RouteHandler callback, {
    ContentType? contentType,
  });

  Route delete(
    String path,
    RouteHandler callback, {
    ContentType? contentType,
  });

  Route ws(String path, WsOnConnect onConnect);
}

class JaguarServerServiceImpl extends ServerService {
  late Jaguar server;

  @override
  bool isRunning = false;

  JaguarServerServiceImpl();
  void _printLog(LogRecord record) {
    final level = record.level;
    final recordMessege = record.message;
    final error = record.error;
    final stack = record.stackTrace;
    final name = record.loggerName;

    final isError = level.value.between(1000, 1300);
    final isWarning = level.value == 900;
    final isNormal = level.value.between(0, 900);

    final output =
        "[$name] $recordMessege${error != null ? '\n$error' : ''}${stack != null ? '\n$stack' : ''}";
    var messege = "";
    if (isError) {
      messege = '🛑 \x1B[31m$output\x1B[0m ';
    }
    if (isWarning) {
      messege = '⚠️ \x1B[33m$output\x1B[0m ⚠️';
    }
    if (isNormal) {
      messege = '\x1B[34m ℹ️ $output ℹ️ \x1B[0m';
    }

    debugPrint(messege);
  }

  @override
  void init(NetworkInfo networkInfo) {
    this.networkInfo = networkInfo;
    networkInfo.whenOrNull(
      connected: (wifiIpAddress, wifiName) {
        server = Jaguar(address: wifiIpAddress, port: 3000);
        server.log.onRecord.listen(_printLog);
      },
    );
  }

  @override
  Future<void> start() async {
    await server.serve(logRequests: true);
    isRunning = true;
  }

  @override
  Future<void> stop() async {
    await server.close();
    isRunning = false;
  }

  Future<FutureOr> _requestHandler(
    Context ctx,
    RouteHandler callback,
  ) async {
    try {
      final request = await callback(ctx);
      return request;
    } catch (e, s) {
      if (e is ParamNotFoundEx || e is InvalidParamEx) {
        return Response.json({'error': e.toString()}, statusCode: 400);
      }
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      return Response.json({'error': 'An unexpected error occured'}, statusCode: 400);
    }
  }

  @override
  Route get(
    String path,
    RouteHandler callback, {
    ContentType? contentType,
  }) =>
      server.get(path, (ctx) async {
        ctx.response.headers.contentType = contentType ?? ContentType.json;
        return _requestHandler(ctx, callback);
      });

  @override
  Route post(
    String path,
    RouteHandler callback, {
    ContentType? contentType,
  }) =>
      server.postJson(path, (ctx) async {
        ctx.response.headers.contentType = contentType ?? ContentType.json;
        return _requestHandler(ctx, callback);
      });

  @override
  Route put(
    String path,
    RouteHandler callback, {
    ContentType? contentType,
  }) =>
      server.putJson(path, (ctx) async {
        ctx.response.headers.contentType = contentType ?? ContentType.json;
        return _requestHandler(ctx, callback);
      });

  @override
  Route delete(
    String path,
    RouteHandler callback, {
    ContentType? contentType,
  }) =>
      server.deleteJson(path, (ctx) async {
        ctx.response.headers.contentType = contentType ?? ContentType.json;
        return _requestHandler(ctx, callback);
      });

  @override
  Route ws(String path, WsOnConnect onConnect) => server.wsStream(path, onConnect);
}

enum ParamType { path, query, body }

class ParamNotFoundEx implements Exception {
  final String paramName;
  final ParamType type;
  ParamNotFoundEx(this.paramName, this.type);
  @override
  String toString() => 'The required param from ${type.name} [$paramName] not found';
}

class InvalidParamEx<T> implements Exception {
  final String paramName;
  final ParamType type;
  final dynamic value;
  InvalidParamEx(this.paramName, this.type, this.value);
  @override
  String toString() =>
      'Expected param from ${type.name} [$paramName] to be of type ${T.toString()} but got ${value.runtimeType} instead';
}

extension RequestBodyExtended on Context {
  Future<Map<String, dynamic>> get bodyJson async {
    final body = await bodyAsJson();
    return Map<String, dynamic>.from(body);
  }

  Future<T> getBodyParam<T>(String paramName) async {
    final body = await bodyJson;
    final value = body[paramName];
    if (value == null) {
      throw ParamNotFoundEx(paramName, ParamType.body);
    }
    try {
      return value as T;
    } on TypeError catch (_) {
      throw InvalidParamEx<T>(paramName, ParamType.body, value);
    }
  }

  T getQueryParam<T>(String paramName) {
    final value = query[paramName];
    if (value == null) {
      throw ParamNotFoundEx(paramName, ParamType.query);
    }
    try {
      return value as T;
    } on TypeError catch (_) {
      throw InvalidParamEx<T>(paramName, ParamType.body, value);
    }
  }

  T getPathParam<T>(String paramName) {
    final value = pathParams[paramName];
    if (value == null) {
      throw ParamNotFoundEx(paramName, ParamType.path);
    }
    try {
      return value as T;
    } on TypeError catch (_) {
      throw InvalidParamEx<T>(paramName, ParamType.body, value);
    }
  }
}
