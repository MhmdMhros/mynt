import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynt/core/resources/colors_manager.dart';

class BalanceDescriptionWidget extends StatelessWidget {
  const BalanceDescriptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> descriptions = [
      {
        "title": "airconditing maintance",
        "description":
            "Expenses for cleaning and maintenance of facilities or premises,such as cleaning air conditioners or maintaining heating systems."
      },
      {
        "title": "airconditing maintance",
        "description":
            "Expenses for cleaning and maintenance of facilities or premises,such as cleaning air conditioners or maintaining heating systems."
      },
      {
        "title": "airconditing maintance",
        "description":
            "Expenses for cleaning and maintenance of facilities or premises,such as cleaning air conditioners or maintaining heating systems."
      },
    ];

    return Padding(
      padding: EdgeInsets.all(16.w), // Responsive padding
      child: ListView.builder(
        itemCount: descriptions.length,
        itemBuilder: (context, index) {
          return _buildDescriptionContainer(
            descriptions[index]["title"]!,
            descriptions[index]["description"]!,
          );
        },
      ),
    );
  }

  Widget _buildDescriptionContainer(String title, String description) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h), // Responsive margin
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r), // Responsive border radius
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: 16.h, left: 16.w, right: 16.w, bottom: 8.h),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 14.sp, // Responsive font size
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
                fontFamily: "Montserrat",
              ),
            ),
          ),
          Divider(thickness: 1, color: Colors.grey[200]),
          Padding(
            padding: EdgeInsets.only(top: 16.h, left: 16.w, right: 16.w),
            child: Text(
              description,
              style: TextStyle(
                fontSize: 14.sp, // Responsive font size
                color: Colors.black87,
                fontFamily: "Montserrat",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
