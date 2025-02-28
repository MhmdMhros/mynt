import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynt/core/constants/app_colors.dart';
import 'package:mynt/presentation/pages/bottom%20sheets/enter_date_bottom_sheet.dart';
import 'package:mynt/presentation/pages/bottom%20sheets/service_type_bottom_sheet.dart';
import 'package:mynt/presentation/pages/unit%20details/monthly_calendar_widget.dart';
import 'package:mynt/presentation/pages/unit%20details/yearly_calender_widget.dart';

class UnitDetailsScreen extends StatefulWidget {
  const UnitDetailsScreen({super.key});

  @override
  State<UnitDetailsScreen> createState() => _UnitDetailsScreenState();
}

class _UnitDetailsScreenState extends State<UnitDetailsScreen> {
  int index = 0;
  void showEnterDateBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder: (context) {
        return const EnterDateBottomSheet();
      },
    );
  }

  void showServiceTypesBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder: (context) {
        return const ServiceTypeBottomSheet();
      },
    );
  }

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
          "Unit Details",
          style: TextStyle(
            fontSize: 18.sp,
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
              padding: EdgeInsets.all(20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 1. Image of the unit
                  Container(
                    width: double.infinity,
                    height: 200.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: CachedNetworkImage(
                        imageUrl:
                            'https://letsenhance.io/static/73136da51c245e80edc6ccfe44888a99/1015f/MainBefore.jpg', // Replace with real image URL
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => const Center(
                            child: Icon(Icons.error, color: Colors.red)),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Monte Galala studio",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Montserrat",
                          color: AppColors.text1,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "Unit ID: ",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Montserrat",
                              color: AppColors.text1,
                            ),
                          ),
                          Text(
                            "4212234566",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Montserrat",
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined,
                          color: AppColors.primary, size: 20.w),
                      Expanded(
                        child: Text(
                          "Mount Aj Jalala, Suez, Egypt",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w500,
                            color: AppColors.text2,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Column(
                    children: [
                      _buildRow(Icons.person_outline_outlined,
                          "Current Tennent", "Hesham Adel"),
                      SizedBox(height: 10.h),
                      _buildRow(Icons.bookmark_border_rounded,
                          "Booking Duration", "07/1/2025 - 30/3/2025"),
                      SizedBox(height: 10.h),
                      _buildRow(Icons.balance_rounded, "January Balance",
                          "-3,500 EGP", Colors.red),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Divider(color: Colors.grey.shade300, thickness: 1),
                  SizedBox(height: 10.h),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF0F4F5),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: MaterialButton(
                            color: index == 0
                                ? AppColors.primary
                                : const Color(0xFFF0F4F5),
                            padding: EdgeInsets.symmetric(vertical: 12.h),
                            elevation: 0, // Removes any shadow
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                            onPressed: () {
                              setState(() {
                                index = 0;
                              });
                            },
                            child: Text(
                              "Year",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Montserrat",
                                color: index == 0
                                    ? Colors.white
                                    : const Color(0xFF666666),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: MaterialButton(
                            color: index == 1
                                ? AppColors.primary
                                : const Color(0xFFF0F4F5),
                            padding: EdgeInsets.symmetric(vertical: 12.h),
                            elevation: 0, // Removes any shadow
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                            onPressed: () {
                              setState(() {
                                index = 1;
                              });
                            },
                            child: Text(
                              "Month",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Montserrat",
                                color: index == 1
                                    ? Colors.white
                                    : const Color(0xFF666666),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  index == 0
                      ? Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "2025",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Montserrat",
                                    color: AppColors.primary,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      : const MonthlyCalendar(
                          highlightedDays: {
                            1: [
                              5,
                              6,
                              7,
                              8,
                              9,
                              10,
                              12,
                              15
                            ], // Highlight days in January
                            2: [
                              3,
                              8,
                              9,
                              10,
                              11,
                              20
                            ], // Highlight days in February
                            6: [1, 15, 30], // Highlight days in June
                            12: [25, 31], // Highlight days in December
                          },
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

  // Helper method to create rows with an icon, title, and expandable text
  Widget buildInfoRow(IconData icon, String title, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primary, size: 20.w),
          SizedBox(width: 10.w),
          Text(
            title,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              fontFamily: "Montserrat",
              color: AppColors.text1,
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                fontFamily: "Montserrat",
                color: AppColors.text2,
              ),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRow(IconData icon, String label, String value,
      [Color? valueColor]) {
    return Row(
      children: [
        Icon(icon, size: 18.sp, color: Colors.grey),
        SizedBox(width: 6.w),
        Text(label,
            style: TextStyle(fontSize: 12.sp, fontFamily: "Montserrat")),
        SizedBox(width: 30.w),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: valueColor ?? Colors.black,
                fontFamily: "Montserrat"),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomButtons(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(top: 10.h, bottom: 10.h, left: 20.w, right: 20.w),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildContainerButton(
                "Maintenance Request", Colors.white, AppColors.primary, () {
              showServiceTypesBottomSheet(context);
            }),
          ),
          SizedBox(width: 15.w), // Add spacing between buttons
          Expanded(
            child: _buildContainerButton(
                "Block Unit", AppColors.primary, Colors.white, () {
              showEnterDateBottomSheet(context);
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildContainerButton(
      String text, Color backGColor, Color textColor, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50.h,
        decoration: BoxDecoration(
          color: backGColor,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: AppColors.primary,
            width: 1.w,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 12.sp,
              color: textColor,
              fontWeight: FontWeight.w600,
              fontFamily: "Montserrat",
            ),
          ),
        ),
      ),
    );
  }
}
