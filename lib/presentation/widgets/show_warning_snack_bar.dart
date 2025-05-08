import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynt/core/resources/colors_manager.dart';
import 'package:mynt/core/resources/strings_manager.dart';
import '../../../../app/constants.dart';
import 'my_text.dart';

void showWarningSnackBar(BuildContext context, String text) {
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
        color: AppColors.amber,
      ),
    ),
    icon: Container(
        width: 52.w,
        constraints: BoxConstraints(minHeight: 65.h),
        decoration: BoxDecoration(
          color: AppColors.amber,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8.r),
            bottomLeft: Radius.circular(8.r),
          ),
        ),
        padding: EdgeInsets.all(10.r),
        child: Icon(
          Icons.info_outline,
          size: 22.r,
          color: Colors.white,
        )),
  ).show(context);
}
