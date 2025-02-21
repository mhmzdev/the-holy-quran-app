import 'package:dio/dio.dart';

part 'urls.dart';
part 'helpers.dart';

sealed class BaseApi {
  late final Dio _instance;
  Dio get instance => _instance;

  BaseApi({
    required String baseUrl,
    Map<String, dynamic>? headers,
    Duration connectTimeout = const Duration(seconds: 30),
    Duration receiveTimeout = const Duration(seconds: 30),
  }) {
    final options = BaseOptions(
      contentType: 'application/json',
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
      baseUrl: baseUrl,
      headers: headers,
    );

    _instance = Dio(options);
  }
}

/// [Api] is the main class for all API requests.
/// Just in case we need more API services with different base URLs or
/// headers etc. we can create a new class that extends [BaseApi].
///
/// Anything that applies to [BaseApi] will effect its child classes
/// e.g. we've some extensions over [BaseApi] in [helpers.dart]
class Api extends BaseApi {
  static final Api _ins = Api._();
  static Api get ins => _ins;

  Api._() : super(baseUrl: URLs.base);
}
