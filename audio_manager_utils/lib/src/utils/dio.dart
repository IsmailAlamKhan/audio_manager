import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../env/env.dart';
import 'utils.dart';

final dioProvider = Provider<DioClient>(DioClient.new);

class DioClient {
  final _dio = Dio();
  final String? ip;
  DioClient(Ref ref) : ip = ref.watch(envControllerProvider).ip {
    _dio.options.baseUrl = 'http://$ip:3000';
  }

  Future<Response<T>> _makeRequest<T>(Future<Response<T>> request, bool swallowError) async {
    try {
      return await request;
    } catch (e, s) {
      final exception = e;
      Exception error;

      if (exception is DioError) {
        final e = AppDioException(exception);
        logError('Error occured when making an http request', error: e);
        error = e;
      } else {
        final e = AppException('Unknown error occured when making an http request');
        logError(
          'Error occured when making an http request',
          error: e,
          stackTrace: s,
        );

        error = e;
      }

      if (swallowError) {
        error = SwallowedError(error);
      }
      throw Error.throwWithStackTrace(error, s);
    }
  }

  Future<Response<T>> get<T>(
    String url, {
    Map<String, dynamic>? queryParams,
    Options? options,
    ProgressCallback? onReceiveProgress,
  }) =>
      _makeRequest<T>(
        _dio.get<T>(
          url,
          queryParameters: queryParams,
          options: options,
          onReceiveProgress: onReceiveProgress,
        ),
        false,
      );

  Future<Response<T>> post<T>(
    String url, {
    Map<String, dynamic>? queryParams,
    Options? options,
    required dynamic data,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    CancelToken? cancelToken,
    bool swallowError = false,
  }) =>
      _makeRequest<T>(
        _dio.post<T>(
          url,
          queryParameters: queryParams,
          data: data,
          options: options,
          onReceiveProgress: onReceiveProgress,
          onSendProgress: onSendProgress,
          cancelToken: cancelToken,
        ),
        swallowError,
      );

  Future<Response<T>> put<T>(
    String url, {
    Map<String, dynamic>? queryParams,
    Options? options,
    required dynamic data,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    bool swallowError = false,
  }) =>
      _makeRequest<T>(
        _dio.put<T>(
          url,
          queryParameters: queryParams,
          data: data,
          options: options,
          onReceiveProgress: onReceiveProgress,
          onSendProgress: onSendProgress,
        ),
        swallowError,
      );

  Future<Response<T>> delete<T>(
    String url, {
    Map<String, dynamic>? queryParams,
    Options? options,
    dynamic data,
    bool swallowError = false,
  }) =>
      _makeRequest<T>(
        _dio.delete<T>(
          url,
          queryParameters: queryParams,
          data: data,
          options: options,
        ),
        swallowError,
      );

  Future<Response> download(
    String url,
    String path, {
    Map<String, dynamic>? queryParams,
    Options? options,
    dynamic data,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) =>
      _makeRequest(
        _dio.download(
          url,
          path,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress,
          queryParameters: queryParams,
          data: data,
          options: options,
        ),
        false,
      );
}
