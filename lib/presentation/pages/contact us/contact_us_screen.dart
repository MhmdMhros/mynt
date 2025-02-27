import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mynt/core/constants/app_colors.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

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
          "Contact Us",
          style: TextStyle(
            fontSize: 18.sp,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w600,
            color: AppColors.text1,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // SVG Image
            SvgPicture.asset(
              "assets/images/contact_us.svg",
              width: 120.w,
              height: 122.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildContactItem(Icons.phone, "Phone"),
                SizedBox(
                  width: 5.w,
                ),
                _buildContactItem(Icons.email, "Email"),
                SizedBox(
                  width: 5.w,
                ),
                _buildContactItem(Icons.location_on, "Location"),
                SizedBox(
                  width: 5.w,
                ),
                _buildContactItem(Icons.support_agent, "Support"),
              ],
            ),
            buildTextField("Description", "Write your comment here..."),
          ],
        ),
      ),
    );
  }

  Widget _buildContactItem(IconData icon, String label) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
      decoration: BoxDecoration(
        color: Colors.white, // Background color
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          Icon(icon, size: 40.r, color: AppColors.text1),
          SizedBox(height: 8.h),
          Text(
            label,
            style: TextStyle(
              fontSize: 14.sp,
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w500,
              color: AppColors.text1,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextField(String title, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            fontFamily: "Montserrat",
            color: AppColors.text1,
          ),
        ),
        SizedBox(height: 10.h),
        TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: hint,
            hintStyle: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey,
              fontFamily: "Montserrat",
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide.none, // Removes border color
            ),
          ),
          style: TextStyle(
            fontSize: 16.sp,
            fontFamily: "Montserrat",
          ),
          maxLines: 3,
        ),
      ],
    );
  }
}
