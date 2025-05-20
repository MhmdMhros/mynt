import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mynt/app/constants.dart';
import 'package:mynt/core/network/interceptors/app_interceptors.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String contentType = "content-type";
const String applicationJson = "application/json";
const String accept = "accept";
const String authorization = "authorization";
const String defaultLanguage = "language";

@module
abstract class InjectableDioModule {
  @lazySingleton
  Dio get dio => DioFactory().getDio();
}

class DioFactory {
  Dio getDio() {
    Dio dio = Dio();
    Map<String, String> headers = {
      contentType: applicationJson,
      accept: applicationJson,
    };
    dio.options = BaseOptions(
      baseUrl: Constants.baseUrl,
      receiveTimeout: Constants.apiTimeOut,
      sendTimeout: Constants.apiTimeOut,
      connectTimeout: Constants.apiTimeOut,
      headers: headers,
      followRedirects: true,
    );
    if (true) {
      dio.interceptors.addAll([
        AppInterceptors(client: dio),
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
        ),
      ]);
    }
    print(
        "===============================================================================");
    print(dio.interceptors[1]);
    return dio;
  }
}
