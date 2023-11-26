import 'package:dio/dio.dart';
import 'package:ososs_flutter_task/core/app/app.dart';
import 'package:ososs_flutter_task/core/utils/resource/langauge_manager.dart';
import 'package:ososs_flutter_task/core/utils/resource/string_manager.dart';

import 'failure.dart';

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      // dio error so its an error from response of the API or from dio itself
      failure = _handleError(error);
    } else {
      // default error
      failure = DataSource.DEFAULT.getFailure();
    }
  }
}

Failure _handleError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return DataSource.CONNECT_TIMEOUT.getFailure();
    case DioExceptionType.sendTimeout:
      return DataSource.SEND_TIMEOUT.getFailure();
    case DioExceptionType.receiveTimeout:
      return DataSource.RECIEVE_TIMEOUT.getFailure();
    case DioExceptionType.badResponse:
      final message = error.response?.data['message'];
      return Failure(message);
    case DioExceptionType.cancel:
      return DataSource.CANCEL.getFailure();
    default:
      return DataSource.DEFAULT.getFailure();
  }
}

enum DataSource {
  SUCCESS,
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTORISED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECIEVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  DEFAULT
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    final context = navigatorKey!.currentState!.context;
    switch (this) {
      case DataSource.SUCCESS:
        return Failure(ResponseMessage.SUCCESS.tr(context));
      case DataSource.NO_CONTENT:
        return Failure(ResponseMessage.NO_CONTENT.tr(context));
      case DataSource.BAD_REQUEST:
        return Failure(ResponseMessage.BAD_REQUEST.tr(context));
      case DataSource.FORBIDDEN:
        return Failure(ResponseMessage.FORBIDDEN.tr(context));
      case DataSource.UNAUTORISED:
        return Failure(ResponseMessage.UNAUTORISED.tr(context));
      case DataSource.NOT_FOUND:
        return Failure(ResponseMessage.NOT_FOUND.tr(context));
      case DataSource.INTERNAL_SERVER_ERROR:
        return Failure(ResponseMessage.INTERNAL_SERVER_ERROR.tr(context));
      case DataSource.CONNECT_TIMEOUT:
        return Failure(ResponseMessage.CONNECT_TIMEOUT.tr(context));
      case DataSource.CANCEL:
        return Failure(ResponseMessage.CANCEL.tr(context));
      case DataSource.RECIEVE_TIMEOUT:
        return Failure(ResponseMessage.RECIEVE_TIMEOUT.tr(context));
      case DataSource.SEND_TIMEOUT:
        return Failure(ResponseMessage.SEND_TIMEOUT.tr(context));
      case DataSource.CACHE_ERROR:
        return Failure(ResponseMessage.CACHE_ERROR.tr(context));
      case DataSource.NO_INTERNET_CONNECTION:
        return Failure(ResponseMessage.NO_INTERNET_CONNECTION.tr(context));
      case DataSource.DEFAULT:
        return Failure(ResponseMessage.DEFAULT.tr(context));
    }
  }
}

class ResponseCode {
  static const int SUCCESS = 200; // success with data
  static const int NO_CONTENT = 201; // success with no data (no content)
  static const int BAD_REQUEST = 400; // failure, API rejected request
  static const int UNAUTORISED = 401; // failure, user is not authorised
  static const int FORBIDDEN = 403; //  failure, API rejected request
  static const int INTERNAL_SERVER_ERROR = 500; // failure, crash in server side
  static const int NOT_FOUND = 404; // failure, not found

  // local status code
  static const int CONNECT_TIMEOUT = -1;
  static const int CANCEL = -2;
  static const int RECIEVE_TIMEOUT = -3;
  static const int SEND_TIMEOUT = -4;
  static const int CACHE_ERROR = -5;
  static const int NO_INTERNET_CONNECTION = -6;
  static const int DEFAULT = -7;
}

class ResponseMessage {
  static const String SUCCESS = AppStrings.strSuccess; // success with data
  static const String NO_CONTENT =
      AppStrings.strNoContent; // success with no data (no content)
  static const String BAD_REQUEST =
      AppStrings.strBadRequestError; // failure, API rejected request
  static const String UNAUTORISED =
      AppStrings.strUnauthorizedError; // failure, user is not authorised
  static const String FORBIDDEN =
      AppStrings.strForbiddenError; //  failure, API rejected request
  static const String INTERNAL_SERVER_ERROR =
      AppStrings.strInternalServerError; // failure, crash in server side
  static const String NOT_FOUND =
      AppStrings.strNotFoundError; // failure, crash in server side

  // local status code
  static const String CONNECT_TIMEOUT = AppStrings.strTimeoutError;
  static const String CANCEL = AppStrings.strDefaultError;
  static const String RECIEVE_TIMEOUT = AppStrings.strTimeoutError;
  static const String SEND_TIMEOUT = AppStrings.strTimeoutError;
  static const String CACHE_ERROR = AppStrings.strCacheError;
  static const String NO_INTERNET_CONNECTION = AppStrings.strNoInternetError;
  static const String DEFAULT = AppStrings.strDefaultError;
}

class ApiInternalStatus {
  static const String SUCCESS = "200";
  static const String FAILURE = "400";
}
