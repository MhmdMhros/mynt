import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynt/core/constants/app_colors.dart';

class MaintenanceServiceScreen extends StatelessWidget {
  const MaintenanceServiceScreen({super.key});
  @override
  Widget build(BuildContext context) {
    List<String> imageUrls = [
      "https://s3-alpha-sig.figma.com/img/ae43/08b5/aea0ab2ab3a15afc5279eef129f57706?Expires=1742774400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=PANPJZMWxnD1dfTGPVhl9FlrOauZK63HqIQP0VL3XUU-O6oEhI3Jg0TT7nWqUqYppvYaKPSd1jAu-3HR2tFlq58ecRD~3gfR~ssSfMBo~Dr5RtmmnX-O8urDziYyVwl~2y~Xk6nAfzl6u-YMvIhyyLstBdmEcv8WCGL8gwP1UpuOe3tkvATEK8vRWED7m4-Ib2qHFLjb2arPNjwsdv7VbMCOM41KuUoEn5O3AOD2OlhmTsaFDeDGlc8g-9BROmnIVmUxbhegzmFO4gUWLl3xk1DDFct2et2002D-1CeKBZpbqqbypbMHNezF3XoIEUaDdIlc14AuRaslGmc7JTjg3w__",
      "https://s3-alpha-sig.figma.com/img/ae43/08b5/aea0ab2ab3a15afc5279eef129f57706?Expires=1742774400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=PANPJZMWxnD1dfTGPVhl9FlrOauZK63HqIQP0VL3XUU-O6oEhI3Jg0TT7nWqUqYppvYaKPSd1jAu-3HR2tFlq58ecRD~3gfR~ssSfMBo~Dr5RtmmnX-O8urDziYyVwl~2y~Xk6nAfzl6u-YMvIhyyLstBdmEcv8WCGL8gwP1UpuOe3tkvATEK8vRWED7m4-Ib2qHFLjb2arPNjwsdv7VbMCOM41KuUoEn5O3AOD2OlhmTsaFDeDGlc8g-9BROmnIVmUxbhegzmFO4gUWLl3xk1DDFct2et2002D-1CeKBZpbqqbypbMHNezF3XoIEUaDdIlc14AuRaslGmc7JTjg3w__",
      "https://s3-alpha-sig.figma.com/img/ae43/08b5/aea0ab2ab3a15afc5279eef129f57706?Expires=1742774400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=PANPJZMWxnD1dfTGPVhl9FlrOauZK63HqIQP0VL3XUU-O6oEhI3Jg0TT7nWqUqYppvYaKPSd1jAu-3HR2tFlq58ecRD~3gfR~ssSfMBo~Dr5RtmmnX-O8urDziYyVwl~2y~Xk6nAfzl6u-YMvIhyyLstBdmEcv8WCGL8gwP1UpuOe3tkvATEK8vRWED7m4-Ib2qHFLjb2arPNjwsdv7VbMCOM41KuUoEn5O3AOD2OlhmTsaFDeDGlc8g-9BROmnIVmUxbhegzmFO4gUWLl3xk1DDFct2et2002D-1CeKBZpbqqbypbMHNezF3XoIEUaDdIlc14AuRaslGmc7JTjg3w__"
    ];

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
          "Maintenance Service",
          style: TextStyle(
            fontSize: 16.sp,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w600,
            color: AppColors.text1,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInfoContainer("Ticket #637893", [
                    _buildInfoRow("Type", "Maintenance"),
                    _buildInfoRow("Date", "18 Jan 2025"),
                    _buildInfoRow("Time", "3:45 PM"),
                  ]),
                  _buildInfoContainer("Unit Details", [
                    _buildInfoRow("Compound", "Festival"),
                    _buildInfoRow("Unit ID", "12225"),
                  ]),
                  SizedBox(height: 10.h),
                  Container(
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Description",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Montserrat",
                            color: Colors.black,
                          ),
                        ),
                        Divider(thickness: 1, color: Colors.grey[300]),
                        Text(
                          "The air conditioning unit in my apartment has stopped working. It is not cooling, and there is no airflow coming from the vents.",
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: "Montserrat",
                              color: Colors.black87),
                        ),
                        SizedBox(height: 10.h),
                        _buildImageRow(imageUrls),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          _buildBottomButtons(context),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String title, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              fontFamily: "Montserrat",
              color: Colors.black54,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              fontFamily: "Montserrat",
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoContainer(String title, List<Widget> children) {
    return Container(
      padding: EdgeInsets.all(16.w),
      margin: EdgeInsets.symmetric(vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              fontFamily: "Montserrat",
              color: AppColors.primary,
            ),
          ),
          Divider(thickness: 1, height: 20.h, color: Colors.grey[300]),
          ...children,
        ],
      ),
    );
  }

  Widget _buildImageRow(List<String> imageUrls) {
    return Row(
      children: imageUrls
          .map((url) => Padding(
                padding: EdgeInsets.only(right: 8.w),
                child: CachedNetworkImage(
                  imageUrl: url,
                  imageBuilder: (context, imageProvider) => Container(
                    width: 50.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => Container(
                    width: 50.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: const Icon(Icons.image, color: Colors.white),
                  ),
                  errorWidget: (context, url, error) => Container(
                    width: 50.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: const Icon(Icons.error, color: Colors.white),
                  ),
                ),
              ))
          .toList(),
    );
  }

  Widget _buildBottomButtons(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: 15.h, horizontal: 10.w), // Apply ScreenUtil
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 238, 238, 238),
            blurRadius: 5.r, // Apply ScreenUtil
            spreadRadius: 2.r, // Apply ScreenUtil
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: _buildButton("Decline", Colors.white, AppColors.primary, () {
              // Handle cancel action
            }),
          ),
          SizedBox(
            width: 14.w,
          ),
          Expanded(
            child: _buildButton("Accept", AppColors.primary, Colors.white, () {
              // Handle confirm action
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(
      String text, Color backGColor, Color textColor, VoidCallback onPressed) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backGColor,
        padding: EdgeInsets.symmetric(
            horizontal: 50.w, vertical: 16.h), // Apply ScreenUtil
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r), // Apply ScreenUtil
          side: BorderSide(
            color: AppColors.primary,
            width: 1.w, // Apply ScreenUtil
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14.sp, // Apply ScreenUtil
          color: textColor,
          fontWeight: FontWeight.w600,
          fontFamily: "Montserrat", // Apply Font Family
        ),
      ),
    );
  }
}
