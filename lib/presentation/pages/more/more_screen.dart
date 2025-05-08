import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynt/core/resources/colors_manager.dart';
import 'package:mynt/presentation/pages/about%20us/about_us_screen.dart';
import 'package:mynt/presentation/pages/bottom%20sheets/log_out_bottom_sheet.dart';
import 'package:mynt/presentation/pages/contact%20us/contact_us_screen.dart';
import 'package:mynt/presentation/pages/more/widgets/more_widget.dart';
import 'package:mynt/presentation/pages/my%20profile/my_profile_screen.dart';
import 'package:mynt/presentation/pages/privacy%20and%20security/privacy_security_screen.dart';
import 'package:mynt/presentation/pages/request%20service/request_service_screen.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});
  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder: (context) {
        return const LogOutBottomSheet();
      },
    );
  }

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
            fontFamily: "Montserrat",
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
              onTap: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const MyProfileScreen(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      ); // Uses a smoother transition
                    },
                  ),
                );
              },
            ),
            SizedBox(height: 16.h),
            MoreWidget(
              icon: Icons.house_outlined,
              title: 'Request Service',
              onTap: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const RequestServiceScreen(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      ); // Uses a smoother transition
                    },
                  ),
                );
              },
            ),
            SizedBox(height: 16.h),
            MoreWidget(
              icon: Icons.phone_outlined,
              title: 'Contact Us',
              onTap: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const ContactUsScreen(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      ); // Uses a smoother transition
                    },
                  ),
                );
              },
            ),
            SizedBox(height: 16.h),
            MoreWidget(
              icon: Icons.info_outline,
              title: 'About Us',
              onTap: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const AboutUsScreen(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      ); // Uses a smoother transition
                    },
                  ),
                );
              },
            ),
            SizedBox(height: 16.h),
            MoreWidget(
              icon: Icons.lock_outline,
              title: 'Privacy and security',
              onTap: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const PrivacySecurityScreen(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      ); // Uses a smoother transition
                    },
                  ),
                );
              },
            ),
            SizedBox(height: 24.h),
            GestureDetector(
              onTap: () {
                showBottomSheet(context);
              },
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
