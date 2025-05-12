import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynt/presentation/pages/notifications/cubit/notifications_cubit.dart';

class NotificationWidget extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String description;
  final String timeAgo;
  final VoidCallback onDelete;

  const NotificationWidget({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.timeAgo,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationsCubit, NotificationsState>(
        builder: (context, state) {
      return Container(
        padding: EdgeInsets.all(10.w),
        margin: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                width: 40.w,
                height: 40.h,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  width: 50.w,
                  height: 50.h,
                  color: Colors.grey[300], // Placeholder color
                  child: const Center(
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                ),
                errorWidget: (context, url, error) => Container(
                  width: 50.w,
                  height: 50.h,
                  color: Colors.grey[300], // Background for error case
                  child: const Icon(Icons.error, color: Colors.red),
                ),
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Stack(
                alignment:
                    Alignment.topRight, // Aligns delete icon to top-right
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              style: TextStyle(
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w600,
                                fontSize: 12.sp,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              description,
                              style: TextStyle(
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w600,
                                color: Colors.grey,
                                fontSize: 12.sp,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              timeAgo,
                              style: TextStyle(
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w600,
                                color: Colors.grey,
                                fontSize: 10.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    right: 0.w,
                    top: 0.h,
                    child: Container(
                      width: 24.w,
                      height: 24.h,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF9EBEC),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Center(
                        child: IconButton(
                          icon: Icon(
                            Icons.delete_outline_rounded,
                            color: Colors.red,
                            size: 15.w,
                          ),
                          onPressed: onDelete,
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
