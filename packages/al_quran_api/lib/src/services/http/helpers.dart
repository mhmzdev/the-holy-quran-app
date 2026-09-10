part of 'api.dart';

/// Represents a function that makes an HTTP call
typedef DioCall<T> = Future<Response<T>> Function(String path, {Object? data});

/// Represents the body and status code of a HTTP response that failed
typedef HttpFailure = ({Map<String, dynamic> body, int? statusCode});

/// We have written extenion on [BaseApi] which is a parent class so it means
/// if we have any class that extends [BaseApi] then we can use these methods
/// on that class as well.
extension ApiMethods on BaseApi {
  /// GET with a small retry loop for HTTP 429 (api.alquran.cloud rate-limits
  /// at ~12 requests/second and answers with `Retry-After: 1`).
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
    int maxRetries = 3,
  }) async {
    var attempt = 0;
    while (true) {
      try {
        return await instance.get(
          path,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress,
        );
      } on DioException catch (e) {
        final tooMany = e.response?.statusCode == 429;
        if (!tooMany || attempt >= maxRetries) rethrow;
        attempt++;
        final retryAfter =
            int.tryParse(e.response?.headers.value('retry-after') ?? '') ?? 1;
        await Future<void>.delayed(Duration(seconds: retryAfter * attempt));
      }
    }
  }

  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) {
    return instance.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }

  Future<Response<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) {
    return instance.put(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }

  Future<Response<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) {
    return instance.delete(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
  }
}
