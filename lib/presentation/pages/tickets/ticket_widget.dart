import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynt/core/constants/app_colors.dart';

class TicketWidget extends StatelessWidget {
  final String ticketNum;
  final String ticketSort;
  final String date;
  final String status;

  const TicketWidget({
    super.key,
    required this.ticketNum,
    required this.ticketSort,
    required this.date,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "Ticket Num: ",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Montserrat",
                      ),
                    ),
                    Text(
                      "#$ticketNum",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Montserrat",
                      ),
                    ),
                  ],
                ),
                Text(
                  date,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey[600],
                    fontFamily: "Montserrat",
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "Ticket Sort: ",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.black87,
                        fontFamily: "Montserrat",
                      ),
                    ),
                    Text(
                      ticketSort,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Montserrat",
                      ),
                    ),
                  ],
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                  decoration: BoxDecoration(
                    color: _getStatusBackgroundColor(status),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: _getStatusTextColor(status),
                      fontWeight: FontWeight.w600,
                      fontFamily: "Montserrat",
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper functions to get colors based on status
  Color _getStatusBackgroundColor(String status) {
    switch (status) {
      case "Open":
        return const Color(0xFFE9F9FB);
      case "Pending":
        return const Color(0xFFFFF8E5);
      case "In Progress":
        return const Color(0xFFEDF8EE);
      case "Canceled":
        return const Color(0xFFF0F0F0);
      case "Rejected":
        return const Color(0xFFFFE8E5);
      default:
        return Colors.grey[200]!; // Default background color
    }
  }

  Color _getStatusTextColor(String status) {
    switch (status) {
      case "Open":
        return AppColors.primary;
      case "Pending":
        return const Color(0xFFCC9D00);
      case "In Progress":
        return const Color(0xFF328039);
      case "Canceled":
        return const Color(0xFF666666);
      case "Rejected":
        return const Color(0xFFBF4C43);
      default:
        return Colors.black; // Default text color
    }
  }
}
