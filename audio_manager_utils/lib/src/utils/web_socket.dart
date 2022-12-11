import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../audio_manager_utils.dart';

part 'web_socket.g.dart';

// final webSocketHelperProvider = Provider.family<WebSocketHelper, String>(WebSocketHelper.new);

@Riverpod(keepAlive: true)
WebSocketHelper webSocketHelper(Ref ref, String path) => WebSocketHelper(ref, path);

class WebSocketHelper {
  final String path;
  final String? ip;
  WebSocket? _socket;
  WebSocket? get socket => _socket;

  WebSocketHelper(Ref ref, this.path) : ip = ref.watch(envControllerProvider).ip;

  static String connectedResponse = jsonEncode({'message': 'connected'});

  static final Map<String, WebSocketHelper> _sockets = {};

  static void closeAll() {
    _sockets.forEach((key, value) => value.disconnect());
  }

  final streamController = StreamController<String>.broadcast();
  StreamSubscription? _subscription;

  Future<void> connect() async {
    _socket = await WebSocket.connect('ws://$ip:3000/$path');
    _sockets[path] = this;
    _subscription = _socket?.listen((event) {
      if (path == 'connect') {
        if (event != connectedResponse) {
          throw AppException('Failed to connect to server');
        } else {
          logInfo('connected to server');
        }
      } else {
        if (!streamController.isClosed) {
          streamController.add(event);
        }
      }
    });
  }

  Stream<dynamic> onData() {
    return streamController.stream;
  }

  Future<void> disconnect() async {
    await _socket?.close();
    _subscription?.cancel();
    streamController.close();
    _socket = null;
  }

  // Stream<T> connect<T>(T Function(dynamic) mapper) async* {
  //   _socket = await WebSocket.connect('ws://192.168.0.196:3000/$path');
  //   _socket.listen((event) {
  //     print(event);
  //   });
  //   yield* onData(mapper);
  // }

}
