import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookedUnitWidget extends StatelessWidget {
  const BookedUnitWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildBookedUnitRow("Monto Galala Studio", "3,500"),
          SizedBox(height: 8.h),
          Row(
            children: [
              Text(
                "Unit ID: ",
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 16.sp,
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "403840394",
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 16.sp,
                  color: Colors.black54,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildInfoRow("Check-in", "2/5/2025"),
                _buildInfoRow("Check-out", "7/9/2025"),
                _buildInfoRow("Current Tenant", "Hesham Adel"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBookedUnitRow(String title, String price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              fontFamily: "Montserrat",
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
        Row(
          children: [
            Text(
              "EGP ",
              style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 15.sp,
                  color: const Color(0xFF007D8B),
                  fontWeight: FontWeight.w500),
            ),
            Text(
              price,
              style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 14.sp,
                  color: const Color(0xFF007D8B),
                  fontWeight: FontWeight.bold),
            ),
            Text(
              " / night",
              style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 14.sp,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontFamily: "Montserrat",
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 16.sp,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
