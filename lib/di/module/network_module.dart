import 'package:farmacare/data/network/constants/endpoints.dart';
import 'package:farmacare/data/sharedpref/shared_preference_helper.dart';
import 'package:dio/dio.dart';

abstract class NetworkModule {
  /// A singleton dio provider.
  ///
  /// Calling it multiple times will return the same instance.
  static Dio provideDio(SharedPreferenceHelper sharedPrefHelper) {
    final dio = Dio();
    Duration? connectTimeout = Duration(seconds: Endpoints.connectionTimeout);
    Duration? receiveTimeout = Duration(seconds: Endpoints.receiveTimeout);

    dio
      ..options.baseUrl = Endpoints.baseUrl
      ..options.connectTimeout = connectTimeout
      ..options.receiveTimeout = receiveTimeout
      ..options.headers = {'Content-Type': 'application/json; charset=utf-8'}
      ..interceptors.add(LogInterceptor(
        request: true,
        responseBody: true,
        requestBody: true,
        requestHeader: true,
      ))
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest: (RequestOptions options,
              RequestInterceptorHandler handler) async {
            // getting token
            var token = await sharedPrefHelper.authToken;

            if (token != null) {
              options.headers.putIfAbsent('Authorization', () => token);
            } else {
              print('Auth token is null');
            }

            return handler.next(options);
          },
        ),
      );

    return dio;
  }
}
