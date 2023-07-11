import 'package:dio/dio.dart';

class Api {
  final client = Dio();
  final API_KEY = "RoCyGPs9ocF92neCHnGcAOMvpnLo2ol6";
  final AVIA_KEY = "getAvia";
  final BASE_URL = "https://k106555.hostde21.fornex.host/v1";
  static final Api _instance = Api._initial();

  factory Api() {
    return _instance;
  }

  Api._initial() {
    client.options =
        BaseOptions(contentType: 'application/json', baseUrl: BASE_URL);

    client.interceptors.add(InterceptorsWrapper(
      onRequest:
          (RequestOptions requestOptions, RequestInterceptorHandler handler) {
        requestOptions.queryParameters.putIfAbsent("apiKey", () => API_KEY);
        requestOptions.queryParameters.putIfAbsent("key", () => AVIA_KEY);
        handler.next(requestOptions);
      },
    ));
  }
}
