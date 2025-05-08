import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mynt/app/constants.dart';
import 'package:mynt/di.dart';

import 'app_api.dart';

@module
abstract class InjectableAppServiceClientModule {
  @lazySingleton
  AppServiceClient get appServiceClient =>
      AppServiceClient(getIt<Dio>(), baseUrl: Constants.baseUrl);
}
