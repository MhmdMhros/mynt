import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mynt/app/functions.dart';
import 'package:mynt/core/resources/colors_manager.dart';

class ContactUsScreen extends StatelessWidget {
  final String phoneNumber;
  final String email;
  final String facebookUrl;
  final String twitterUrl;
  final String youtubeUrl;
  final String instagramUrl;
  final String tiktokUrl;
  const ContactUsScreen(this.phoneNumber, this.email, this.facebookUrl,
      this.twitterUrl, this.youtubeUrl, this.instagramUrl, this.tiktokUrl,
      {super.key});

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
            fontSize: 16.sp,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w600,
            color: AppColors.text1,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 50.h),
            // SVG Image
            SvgPicture.asset(
              "assets/images/contact_us.svg",
              width: 120.w,
              height: 122.h,
            ),
            SizedBox(height: 50.h),
            SingleChildScrollView(
              child: Wrap(
                spacing: 10.w,
                runSpacing: 15.h,
                alignment: WrapAlignment.center,
                children: [
                  SizedBox(
                    width: 100.w,
                    child: InkWell(
                      onTap: () async => await callNumber(phoneNumber),
                      child: _buildContactItem(FontAwesomeIcons.phone, "Phone"),
                    ),
                  ),
                  SizedBox(
                    width: 100.w,
                    child: InkWell(
                      onTap: () async => await launchEmail(
                          toEmail: email, body: '', subject: ''),
                      child: _buildContactItem(
                          FontAwesomeIcons.solidEnvelope, "Email"),
                    ),
                  ),
                  SizedBox(
                    width: 100.w,
                    child: InkWell(
                      onTap: () async => await launchURL(
                          url: facebookUrl, isSocialMedia: true),
                      child: _buildContactItem(
                          FontAwesomeIcons.facebook, "Facebook"),
                    ),
                  ),
                  // SizedBox(
                  //   width: 100.w,
                  //   child: InkWell(
                  //     onTap: () async =>
                  //         await launchURL(url: twitterUrl, isSocialMedia: true),
                  //     child: _buildContactItem(
                  //         FontAwesomeIcons.twitter, "Twitter"),
                  //   ),
                  // ),
                  // SizedBox(
                  //   width: 100.w,
                  //   child: InkWell(
                  //     onTap: () async =>
                  //         await launchURL(url: youtubeUrl, isSocialMedia: true),
                  //     child: _buildContactItem(
                  //         FontAwesomeIcons.youtube, "Youtube"),
                  //   ),
                  // ),
                  SizedBox(
                    width: 100.w,
                    child: InkWell(
                      onTap: () async => await launchURL(
                          url: instagramUrl, isSocialMedia: true),
                      child: _buildContactItem(
                          FontAwesomeIcons.instagram, "Instagram"),
                    ),
                  ),
                  SizedBox(
                    width: 100.w,
                    child: InkWell(
                      onTap: () async =>
                          await launchURL(url: tiktokUrl, isSocialMedia: true),
                      child:
                          _buildContactItem(FontAwesomeIcons.tiktok, "Tiktok"),
                    ),
                  ),
                ],
              ),
            ),
            // buildTextField("Description", "Write your comment here..."),
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
          Icon(icon, size: 25.r, color: AppColors.text1),
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
            fontSize: 14.sp,
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
            fontSize: 14.sp,
            fontFamily: "Montserrat",
          ),
          maxLines: 3,
        ),
      ],
    );
  }
}
