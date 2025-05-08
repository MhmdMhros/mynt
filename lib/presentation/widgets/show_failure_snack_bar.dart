import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynt/app/constants.dart';
import 'package:mynt/core/resources/colors_manager.dart';
import 'package:mynt/core/resources/strings_manager.dart';
import 'my_text.dart';
import 'package:another_flushbar/flushbar.dart';

void showFailureSnackBar(BuildContext context, String text) {
  final GlobalKey flushBarKey = GlobalKey();

  Flushbar(
    key: flushBarKey,
    backgroundColor: Colors.white,
    borderRadius: BorderRadius.circular(8.r),
    padding: EdgeInsets.only(right: 10.w),
    message: text,
    messageColor: Colors.black,
    positionOffset: 20,
    duration: Constants.snackBarDuration,
    margin: EdgeInsets.symmetric(horizontal: 20.w),
    mainButton: InkWell(
      onTap: () {
        (flushBarKey.currentWidget as Flushbar).dismiss();
      },
      child: MyText(
        AppStrings.dismiss,
        textStyle: TextStyleEnum.poppinsRegualr,
        fontSize: 14.sp,
        color: AppColors.red,
      ),
    ),
    icon: Container(
        width: 52.w,
        constraints: BoxConstraints(minHeight: 65.h),
        decoration: BoxDecoration(
          color: AppColors.red,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8.r),
            bottomLeft: Radius.circular(8.r),
          ),
        ),
        padding: EdgeInsets.all(10.r),
        child: Container(
          height: 18.r,
          width: 18.r,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              width: 1,
              color: Colors.white,
            ),
          ),
          child: Icon(
            Icons.close,
            size: 18.r,
            color: Colors.white,
          ),
        )),
  ).show(context);
}
