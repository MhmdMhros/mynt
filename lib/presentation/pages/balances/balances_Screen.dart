import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynt/core/constants/app_colors.dart';

class BalancesScreen extends StatelessWidget {
  const BalancesScreen({super.key});

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
          "Net Balance",
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
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search TextField
            TextField(
              decoration: InputDecoration(
                hintText: "Search...",
                prefixIcon: Icon(
                  Icons.search,
                  color: AppColors.text1,
                  size: 24.sp,
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 10.h),

            // Dropdown Filter
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Row(
                children: [
                  // Prefix Icon
                  Icon(Icons.filter_list,
                      color: AppColors.primary, size: 24.sp),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: "Filter",
                        items: ["Filter", "Pending", "Completed", "Failed"]
                            .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(
                                    e,
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.text1,
                                    ),
                                  ),
                                ))
                            .toList(),
                        onChanged: (value) {},
                        // Custom Suffix Icon
                        icon: Icon(Icons.keyboard_arrow_down_outlined,
                            color: AppColors.text1, size: 30.sp),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),

            // Container with Row (4 texts)
            Container(
              padding: EdgeInsets.only(top: 10.h, bottom: 10.h, left: 10.w),
              decoration: BoxDecoration(
                color: const Color(0xFFF0F4F5),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.r),
                    bottomLeft: Radius.circular(10.r)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Unit ID", style: _headerStyle()),
                  Padding(
                    padding: EdgeInsets.only(right: 15.w),
                    child: Text("Check in/out", style: _headerStyle()),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.w),
                    child: Text("Net", style: _headerStyle()),
                  ),
                  Text("More", style: _headerStyle()),
                ],
              ),
            ),
            SizedBox(height: 10.h),

            // List of widgets (each is a row)
            Expanded(
              child: ListView.separated(
                itemCount: 9, // Example data count
                separatorBuilder: (_, __) => SizedBox(height: 10.h),
                itemBuilder: (context, index) {
                  return _buildBalanceRow(
                    unitId: "12225",
                    checkInOut: "2/5/2023 - 19/7/2023",
                    net: -4150.0,
                  );
                },
              ),
            ),
            // Download Buttons
            Column(
              children: [
                _buildDownloadButton(
                    "Download PDF", Colors.white, AppColors.primary),
                SizedBox(height: 10.h),
                _buildDownloadButton(
                    "Download XLSX", AppColors.primary, Colors.white),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Widget for list item row
  Widget _buildBalanceRow({
    required String unitId,
    required String checkInOut,
    required double net,
  }) {
    return Container(
      padding: EdgeInsets.all(10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 5.w, left: 5.w),
            child: Text(unitId,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                )),
          ),
          Text(checkInOut,
              style: TextStyle(
                fontSize: 13.sp,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w500,
                color: Colors.black,
              )),
          Text(
            "${net}EGP",
            style: TextStyle(
              fontSize: 13.sp,
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w600,
              color:
                  net > 0 ? const Color(0xFF007D8B) : const Color(0xFFDD6D5C),
            ),
          ),
          const Icon(Icons.arrow_forward_ios,
              color: AppColors.primary, size: 16),
        ],
      ),
    );
  }

  // Widget for download buttons
  Widget _buildDownloadButton(String text, Color textColor, Color backColor) {
    return SizedBox(
      height: 60.h,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: backColor,
          padding: EdgeInsets.symmetric(vertical: 12.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
            side: const BorderSide(
              color:
                  AppColors.primary, // Change this to your desired border color
              width: 1, // Change this to your desired border width
            ),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16.sp,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
        ),
      ),
    );
  }

  // Styles for text widgets
  TextStyle _headerStyle() => TextStyle(
        fontSize: 14.sp,
        fontFamily: "Montserrat",
        fontWeight: FontWeight.w600,
        color: AppColors.text1,
      );

  TextStyle _textStyle() => TextStyle(
        fontSize: 13.sp,
        fontFamily: "Montserrat",
        fontWeight: FontWeight.w600,
        color: AppColors.primary,
      );
}
