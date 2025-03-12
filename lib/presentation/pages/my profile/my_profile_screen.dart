import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:mynt/core/constants/app_colors.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

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
          "My Profile",
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
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Circular User Image with Camera Icon
              Stack(
                children: [
                  ClipOval(
                    child: CachedNetworkImage(
                      imageUrl:
                          "https://s3-alpha-sig.figma.com/img/5f8b/1e3c/e7b3657f2652263b0ef7a745a66e0f2a?Expires=1742774400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=G7iTfjPpl79oCwQ~4SV4vXG8Nm7RWpAwsaWYNrMIoHdcbWFit3azy-zf2l8588OyZFXvWnwRBKZtBgh3tnt9GHAT~Qzp0Wgsbd3DKeQv0Ntn1bLaWTQv~1EEWG94i8F3v1ra9huJw2~UVtTBJIr7BLBIDU1Zt5sfosNI7ggpgD0uM5ZYYFSV8ehLgSUj-r9K5ouq7T8dLQn16LqJK4txA3yYDBqSKoM6cojXC~BBDsP1tagVTDGK~OH~TLHMvNpu22g1YN89YS3xp5-VshSrYBfa~Q7C7mVF5Oy7yij~MZqadYUsMxwZ1dFvXhCU5NXpjlkywe5JDOLeI2ob2Nc5CQ__", // Replace with actual URL
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(
                              color: AppColors.text1),
                      errorWidget: (context, url, error) => Icon(Icons.person,
                          size: 60.r, color: AppColors.text1),
                      width: 120.r,
                      height: 120.r,
                      fit: BoxFit.cover,
                    ),
                  ),
                  // Camera Icon for Changing Profile Picture
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.all(6.r),
                        decoration: const BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 4,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.camera_alt,
                          size: 20.r,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h), // Space between image and text fields
              // Profile Information Widgets
              _buildInfoWidget("Name", "Ali Ahmed", Icons.person),
              _buildInfoWidget("Email", "ali@gmail.com", Icons.email),
              _buildInfoWidget("Phone Number", "+201016654289", Icons.phone),
              _buildInfoWidget("Gender", "Male", Icons.male),
              _buildInfoWidget("Birthday", "20/7/1980", Icons.calendar_today),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoWidget(String label, String initialValue, IconData icon) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14.sp,
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w600,
              color: AppColors.text1,
            ),
          ),
          SizedBox(height: 8.h),
          TextFormField(
            initialValue: initialValue,
            style: TextStyle(
              fontFamily: "Montserrat",
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              prefixIcon: Icon(
                icon,
                color: AppColors.text1,
                size: 20.sp,
              ),
              hintText: label,
              hintStyle: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
