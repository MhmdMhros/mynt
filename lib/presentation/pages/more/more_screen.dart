import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynt/core/constants/app_colors.dart';
import 'package:mynt/presentation/pages/more/widgets/more_widget.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          'More',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            fontFamily: "Montserrat", // Applied font family
            color: AppColors.text1,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            MoreWidget(
              icon: Icons.person_outline,
              title: 'My Profile',
              onTap: () {},
            ),
            SizedBox(height: 16.h),
            MoreWidget(
              icon: Icons.house_outlined,
              title: 'Request Service',
              onTap: () {},
            ),
            SizedBox(height: 16.h),
            MoreWidget(
              icon: Icons.phone_outlined,
              title: 'Contact Us',
              onTap: () {},
            ),
            SizedBox(height: 16.h),
            MoreWidget(
              icon: Icons.info_outline,
              title: 'About Us',
              onTap: () {},
            ),
            SizedBox(height: 16.h),
            MoreWidget(
              icon: Icons.lock_outline,
              title: 'Privacy and security',
              onTap: () {},
            ),
            SizedBox(height: 24.h),
            GestureDetector(
              onTap: () {},
              child: Row(
                children: [
                  Container(
                    width: 40.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: AppColors.iconsBack,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: Icon(
                      Icons.logout,
                      size: 24.sp,
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Text(
                    'Logout',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Montserrat", // Applied font family
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
