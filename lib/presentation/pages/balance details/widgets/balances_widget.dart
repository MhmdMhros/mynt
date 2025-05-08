import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BalancesWidget extends StatelessWidget {
  const BalancesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildBalanceRow("PM Fees", "1,220.0 EGP"),
            _buildBalanceRow("Air Conditioning Maintenance", "1,220.0 EGP"),
            _buildBalanceRow("Air Conditioning Maintenance", "1,220.0 EGP"),
            Divider(thickness: 1, height: 0, color: Colors.grey[200]),
            _buildBalanceRow("Net Balance", "1,220.0 EGP", isNetBalance: true),
          ],
        ),
      ),
    );
  }

  Widget _buildBalanceRow(String title, String amount,
      {bool isNetBalance = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 14.sp,
                fontWeight: isNetBalance ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              fontFamily: "Montserrat",
              fontSize: 14.sp,
              fontWeight: isNetBalance ? FontWeight.bold : FontWeight.w600,
              color: isNetBalance ? const Color(0xFF007D8B) : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
