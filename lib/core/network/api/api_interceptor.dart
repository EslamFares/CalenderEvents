import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // options.headers['Accept-Language'] = "en";
    // options.headers['token'] = "232131ws4165e1d32e1";
    super.onRequest(options, handler);
  }
}
