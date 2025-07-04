import 'package:dio/dio.dart';
import 'package:mynt/core/resources/strings_manager.dart';
import 'failure.dart';

class ErrorHandler implements Exception {
  late Failure failure;
  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      failure = _handleError(error);
    } else {
      failure = DataSource.defaultt.getFailure();
    }
  }
  Failure _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return DataSource.connectionTimeOut.getFailure();

      case DioExceptionType.sendTimeout:
        return DataSource.sendTimeOut.getFailure();

      case DioExceptionType.receiveTimeout:
        return DataSource.recieveTimeOut.getFailure();

      //! This needs to be checked carefully beacuse of we are fitching data not exists it will throw an ERROR
      case DioExceptionType.badResponse:
        if (error.response != null &&
            error.response?.statusCode != null &&
            error.response?.statusMessage != null) {
          return Failure(
            code: error.response!.statusCode!,
            message: error.response?.statusCode != 400
                ? 'error'
                : error.response!.data?['message'] ??
                    error.response!.statusMessage,
          );
        } else {
          return DataSource.defaultt.getFailure();
        }
      case DioExceptionType.cancel:
        return DataSource.requestCancelled.getFailure();

      case DioExceptionType.badCertificate:
        return DataSource.badCertificate.getFailure();

      case DioExceptionType.connectionError:
      case DioExceptionType.unknown:
        return DataSource.defaultt.getFailure();
    }
  }
}

/*
methodNotAllowed
*/
enum DataSource {
  requestCancelled,
  unAuthorized,
  badRequest,
  notFound,
  internalServerError,
  noInternetConnection,

  forbidden,

  connectionTimeOut,
  recieveTimeOut,
  sendTimeOut,

  cacheError,
  defaultt,
  badCertificate,
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.badRequest:
        return Failure(
            code: ResponseCode.badRequest, message: ResponseMessage.badRequest);
      case DataSource.forbidden:
        return Failure(
            code: ResponseCode.forbidden, message: ResponseMessage.forbidden);
      case DataSource.unAuthorized:
        return Failure(
            code: ResponseCode.unAuthorized,
            message: ResponseMessage.unAuthorized);
      case DataSource.internalServerError:
        return Failure(
            code: ResponseCode.internalServerError,
            message: ResponseMessage.internalServerError);
      case DataSource.connectionTimeOut:
        return Failure(
            code: ResponseCode.connectionTimeOut,
            message: ResponseMessage.connectionTimeOut);
      case DataSource.requestCancelled:
        return Failure(
            code: ResponseCode.requestCancelled,
            message: ResponseMessage.requestCancelled);
      case DataSource.recieveTimeOut:
        return Failure(
            code: ResponseCode.receiveTimeOut,
            message: ResponseMessage.receiveTimeOut);
      case DataSource.sendTimeOut:
        return Failure(
            code: ResponseCode.sendTimeOut,
            message: ResponseMessage.sendTimeOut);
      case DataSource.cacheError:
        return Failure(
            code: ResponseCode.cacheError, message: ResponseMessage.cacheError);
      case DataSource.noInternetConnection:
        return Failure(
            code: ResponseCode.noInternetConnection,
            message: ResponseMessage.noInternetConnection);
      case DataSource.notFound:
        return Failure(
            code: ResponseCode.notFound, message: ResponseMessage.notFound);
      case DataSource.badCertificate:
        return Failure(
            code: ResponseCode.badCertificate,
            message: ResponseMessage.badCertificate);
      case DataSource.defaultt:
        return Failure(
            code: ResponseCode.defaultt, message: ResponseMessage.defaultt);
    }
  }
}

class ResponseCode {
  static const int success = 200; // success with data
  static const int created = 201; // success with no data (no contect) (created)
  static const int accepted =
      202; // success with no data (no contect) (accepted)
  static const int badRequest = 400; // failure, API rejected request
  static const int unAuthorized = 401; // failure, user is't authorized
  static const int forbidden = 403; // failure, API rejected request
  static const int notFound = 404;
  static const int internalServerError = 500;

  // local status code
  static const int connectionTimeOut = -1;
  static const int requestCancelled = -2;
  static const int receiveTimeOut = -3;
  static const int sendTimeOut = -4;
  static const int cacheError = -5;
  static const int noInternetConnection = -6;
  static const int defaultt = -7;
  static const int badCertificate = -8;
}

class ResponseMessage {
  static const String success = AppStrings.success;
  static const String created = AppStrings.created;
  static const String accepted = AppStrings.accepted;
  static const String badRequest = AppStrings.badRequestError;
  static const String unAuthorized = AppStrings.unauthorizedError;
  static const String forbidden = AppStrings.forbiddenError;
  static const String internalServerError = AppStrings.internalServerError;
  static const String notFound = AppStrings.notFoundError;
  static const String badCertificate = AppStrings.badCertificate;

  // local response messages
  static const String connectionTimeOut = AppStrings.timeoutError;
  static const String requestCancelled = AppStrings.requestCancelledError;
  static const String receiveTimeOut = AppStrings.timeoutError;
  static const String sendTimeOut = AppStrings.timeoutError;
  static const String cacheError = AppStrings.cacheError;
  static const String noInternetConnection = AppStrings.noInternetError;
  static const String defaultt = AppStrings.defaultError;
}
