import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynt/core/constants/app_colors.dart';

class MoreWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function onTap;

  const MoreWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Row(
        children: [
          Container(
            width: 30.w,
            height: 30.h,
            decoration: BoxDecoration(
              color: AppColors.iconsBack,
              borderRadius: BorderRadius.circular(4.r),
            ),
            child: Icon(
              icon,
              size: 20.sp,
              color: AppColors.primary,
            ),
          ),
          SizedBox(width: 16.w),
          Text(
            title,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              fontFamily: "Montserrat", // Applied font family
              color: AppColors.text1,
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () => onTap(),
                icon: Icon(
                  Icons.arrow_forward_ios,
                  size: 20.sp,
                  color: AppColors.primary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
