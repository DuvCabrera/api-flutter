import 'package:flutter/material.dart';
import 'package:http_interceptor/http/interceptor_contract.dart';
import 'package:http_interceptor/http_interceptor.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    debugPrint('Request');
    debugPrint('Url: ${data.url.toString()}');
    debugPrint('Headers: ${data.headers.toString()}');
    debugPrint('Body: ${data.body.toString()}');
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    debugPrint('Response');
    debugPrint('Status: ${data.statusCode.toString()}');
    debugPrint('Headers: ${data.headers.toString()}');
    debugPrint('Body: ${data.body.toString()}');
    return data;
  }
}