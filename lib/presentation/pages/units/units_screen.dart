import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynt/core/constants/app_colors.dart';

class UnitsScreen extends StatefulWidget {
  const UnitsScreen({super.key});

  @override
  State<UnitsScreen> createState() => _UnitsScreenState();
}

class _UnitsScreenState extends State<UnitsScreen> {
  final List<Map<String, String>> units = [
    {
      "title": "Monte Galala studio",
      "uid": "1220",
      "booking_duration": "07/1/2025 - 30/3/2025",
      "balance": "-3,500 EGP",
      "image":
          "https://letsenhance.io/static/73136da51c245e80edc6ccfe44888a99/1015f/MainBefore.jpg",
      "status": "Rented"
    },
    {
      "title": "Palm Hills Villa",
      "uid": "1550",
      "booking_duration": "10/2/2025 - 15/5/2025",
      "balance": "-5,200 EGP",
      "image":
          "https://letsenhance.io/static/73136da51c245e80edc6ccfe44888a99/1015f/MainBefore.jpg",
      "status": "Pending"
    },
    {
      "title": "Palm Hills Villa",
      "uid": "..",
      "booking_duration": "..",
      "balance": "..",
      "image":
          "https://letsenhance.io/static/73136da51c245e80edc6ccfe44888a99/1015f/MainBefore.jpg",
      "status": ""
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Units",
          style: TextStyle(
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w600,
            fontSize: 18.sp,
            color: AppColors.text1,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: ListView.builder(
          itemCount: units.length,
          itemBuilder: (context, index) {
            final unit = units[index];
            return Padding(
              padding: EdgeInsets.only(bottom: 16.h),
              child: _buildUnitContainer(unit),
            );
          },
        ),
      ),
    );
  }

  Widget _buildUnitContainer(Map<String, String> unit) {
    return Container(
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 30.r,
                backgroundImage: CachedNetworkImageProvider(unit["image"]!),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            unit["title"]!,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp,
                              fontFamily: "Montserrat",
                            ),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        if (unit["status"]!.isNotEmpty)
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 5.h),
                            decoration: BoxDecoration(
                              color: unit["status"]! == "Rented"
                                  ? const Color(0xFFE9F9FB)
                                  : const Color(0xFFFFF8E5),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Text(
                              unit["status"]!,
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: unit["status"]! == "Rented"
                                    ? const Color(0xFF0F525B)
                                    : const Color(0xFFCC9D00),
                                fontWeight: FontWeight.w600,
                                fontFamily: "Montserrat",
                              ),
                            ),
                          ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Unit ID: ",
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 14.sp,
                            fontFamily: "Montserrat",
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          unit["uid"]!,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Montserrat",
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          _buildRow(Icons.bookmark_border_rounded, "Booking Duration    ",
              unit["booking_duration"]!),
          SizedBox(height: 10.h),
          _buildRow(Icons.balance_rounded, "January Balance      ",
              unit["balance"]!, Colors.red),
        ],
      ),
    );
  }

  Widget _buildRow(IconData icon, String label, String value,
      [Color? valueColor]) {
    return Row(
      children: [
        Icon(icon, size: 20.sp, color: Colors.grey),
        SizedBox(width: 8.w),
        Expanded(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14.sp,
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 14.sp,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w600,
            color: valueColor ?? Colors.black,
          ),
        ),
      ],
    );
  }
}
