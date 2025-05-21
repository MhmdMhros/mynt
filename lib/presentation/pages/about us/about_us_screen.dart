import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mynt/core/resources/colors_manager.dart';

class AboutUsScreen extends StatelessWidget {
  final String aboutUsContentText;
  const AboutUsScreen(this.aboutUsContentText, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 30.w),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: AppColors.text1),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        title: Text(
          "About Us",
          style: TextStyle(
            fontSize: 16.sp,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w600,
            color: AppColors.text1,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: SvgPicture.asset(
                "assets/images/mynt.svg",
                width: 140.w,
                height: 140.h,
              ),
            ),
            SizedBox(height: 30.h),
            Text(
              aboutUsContentText,
              style: TextStyle(
                fontSize: 15.sp,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w500,
                color: AppColors.text1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
