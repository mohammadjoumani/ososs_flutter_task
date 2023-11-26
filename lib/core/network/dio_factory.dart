import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:ososs_flutter_task/core/app/constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../utils/resource/langauge_manager.dart';
import 'constants_api.dart';

const String APPLICATION_JSON = "application/json";
const String CONTENT_TYPE = "content-type";
const String ACCEPT = "accept";
const String AUTHORIZATION = "Authorization";
const String PAYERNAME = "payername";
const String DEFAULT_LANGUAGE = "language";

class DioFactory {
  DioFactory();

  Future<Dio> getDio() async {
    Dio dio = Dio();

    Map<String, String> headers = {
      CONTENT_TYPE: APPLICATION_JSON,
      ACCEPT: APPLICATION_JSON,
      // AUTHORIZATION: token != null ? 'Bearer $token' : "",
      DEFAULT_LANGUAGE: ARABIC
    };

    dio.options = BaseOptions(
      baseUrl: ConstantsApi.baseUrl,
      headers: headers,
      receiveTimeout: const Duration(milliseconds: Constants.apiTimeOut),
      sendTimeout: const Duration(milliseconds: Constants.apiTimeOut),
    );

    if (!kReleaseMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          error: true,
        ),
      );
    }

    return dio;
  }
}
