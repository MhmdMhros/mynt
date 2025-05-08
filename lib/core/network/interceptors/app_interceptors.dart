import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynt/core/user_secure_storage.dart';
import 'package:mynt/di.dart';
import 'package:mynt/presentation/pages/sign%20in/sign_in_screen.dart';
import 'package:mynt/presentation/widgets/my_text.dart';

import '../../../core/resources/strings_manager.dart';
import '../../resources/app_context.dart';

class AppInterceptors extends Interceptor {
  final Dio client;
  // final AuthLocalDataSource authLocalDataSource;
  AppInterceptors({required this.client});

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers[HttpHeaders.acceptHeader] = ContentType.json;

    String? userAccessToken =
        await getIt<UserSecureStorage>().getUserAccessToken();

    if (userAccessToken != null) {
      options.headers[HttpHeaders.authorizationHeader] =
          AppStrings.bearer + userAccessToken;
    }
    super.onRequest(options, handler);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    debugPrint(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    if (err.response?.statusCode == 401) {
      await showDialogForLoginAgain();
    }
    super.onError(err, handler);
  }

  Future<void> showDialogForLoginAgain() async {
    final context = AppContext.context;
    showAdaptiveDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog.adaptive(
        title: MyText(
          AppStrings.sessionExpired,
          textStyle: TextStyleEnum.poppinsBold,
          fontSize: 18.sp,
        ),
        content: MyText(
          AppStrings.pleaseLoginAgain,
          textStyle: TextStyleEnum.poppinsMedium,
          fontSize: 15.sp,
        ),
        actions: [
          TextButton(
            onPressed: () async {
              getIt<UserSecureStorage>().deleteUserInfo().then(
                    (value) => Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => const SignInScreen()),
                      (Route<dynamic> route) => false,
                    ),
                  );
            },
            child: MyText(
              AppStrings.ok,
              textStyle: TextStyleEnum.poppinsBold,
              fontSize: 18.sp,
            ),
          ),
        ],
      ),
    );
  }
}
