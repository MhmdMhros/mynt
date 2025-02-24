import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynt/core/constants/app_colors.dart';

class MoreWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function onTap;

  const MoreWidget({
    super.key, required this.icon, required this.title, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
            color: AppColors.iconsBack,
            borderRadius: BorderRadius.circular(4.r),
          ),
          child: Icon(
            icon,
            size: 24.sp,
            color: AppColors.primary,
          ),
        ),
        SizedBox(width: 16.w),
        Text(
          title,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
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
                size: 24.sp,
                color: AppColors.primary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
