import 'package:dio/dio.dart';

class BaseNetworkResponse {
  int httpCode;
  Response? response;

  BaseNetworkResponse({
    required this.httpCode,
    required this.response,
  });

  bool isSuccess() => (httpCode >= 200 && httpCode <= 299) ? true : false;
}
