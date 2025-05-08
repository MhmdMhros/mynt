import 'dart:developer';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:mime/mime.dart';
import '../../core/models/responses.dart';
import '../../core/network/error_handler.dart';
import '../../core/network/failure.dart';
import '../models/no_data.dart';
import '../services/check_internet_connection.dart';

class RepositoryHelpers {
  Future<Either<Failure, T>> callApi<T>(
    Future<HttpResponse> Function() function, {
    required int statusCode,

    /// use it when you need to return list
    T Function(List list)? convertToAppropriateList,
    Future<void> Function(T data)? onData,
  }) async {
    assert(
      (T is List && !(listOfTypesAllowed.contains(T)))
          ? (convertToAppropriateList == null ? false : true)
          : true,
      'Please provide convertToAppropriateList if you are returning list.',
    );

    if (!(await isConnected())) {
      return _retrunFailureIfNoInternetConnection<T>();
    }

    try {
      final result = await function();

      if (result.response.statusCode == statusCode) {
        if (T == NoData) {
          return right(const NoData() as T);
        }
        return _returnData(
            result,
            listOfTypesAllowed.contains(T) ? null : convertToAppropriateList,
            onData);
      } else {
        return _returnFailureIfStatusCodeIsNotSuccess<T>(result);
      }
    } catch (e) {
      // rethrow;
      log("||||||||||||||||||||ERROR FROM REPOSITORY CALLAPI||||||||||||||||||||");
      log(e.toString());
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  Left<Failure, T> _retrunFailureIfNoInternetConnection<T>() {
    return Left(Failure(
      code: ResponseCode.noInternetConnection,
      message: ResponseMessage.noInternetConnection,
    ));
  }

  Left<Failure, T> _returnFailureIfStatusCodeIsNotSuccess<T>(
      HttpResponse<dynamic> result) {
    return Left(
      Failure(
        code: result.response.statusCode ?? 0,
        message: result.response.statusMessage ?? ResponseMessage.defaultt,
      ),
    );
  }

  Future<Right<Failure, T>> _returnData<T>(
    HttpResponse<dynamic> result,
    T Function(List list)? convertToAppropriateList,
    Future<void> Function(T data)? onData,
  ) async {
    late final dynamic domainValue;
    dynamic data = result.data;
    if (data is List) {
      if (convertToAppropriateList == null) {
        return Right(data as T);
      }
      domainValue = convertToAppropriateList(data.map((element) {
        return (element as DataResponse).toDomain();
      }).toList());
    } else {
      domainValue = data.toDomain();
    }
    if (onData != null) {
      await onData(domainValue);
    }
    return Right(domainValue);
  }

  Future<Option<Failure>> uploadFile(String path, File file) async {
    try {
      final dio = Dio();
      Options options =
          Options(contentType: lookupMimeType(file.path), headers: {
        'Accept': "*/*",
        'Content-Length': await file.length(),
        'Connection': 'keep-alive',
        'User-Agent': 'ClinicPlush'
      });
      final res = await dio.put(
        path,
        data: file.openRead(),
        options: options,
      );
      log('statusCode: ${res.statusCode}');
      if (res.statusCode != 200) {
        return some(
          Failure(
            code: res.statusCode ?? 0,
            message: res.statusMessage ?? '',
          ),
        );
      } else {
        return none();
      }
    } catch (e) {
      log(e.toString());
      return some(
        Failure(
            code: ResponseCode.badCertificate, message: 'Something went wrong'),
      );
    }
  }
}

List<Type> listOfTypesAllowed = [
  List<String>,
  List<int>,
  List<bool>,
  List<double>
];
