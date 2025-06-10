import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynt/core/resources/colors_manager.dart';
import 'package:mynt/domain/entities/article.dart';

class NewsDetailsScreen extends StatelessWidget {
  final Article article;
  const NewsDetailsScreen(this.article, {super.key});

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
          "News Details",
          style: TextStyle(
            fontSize: 18.sp,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w600,
            color: AppColors.text1,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Cached Image
              ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: CachedNetworkImage(
                  imageUrl: article.image ?? '',
                  height: 200.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(color: AppColors.primary),
                  ),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.error, color: Colors.red),
                ),
              ),
              SizedBox(height: 14.h),

              // Date
              Text(
                article.publishedAt ?? '',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w500,
                  color: AppColors.text1,
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                article.title ?? '',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w600,
                  color: AppColors.text1,
                ),
              ),
              SizedBox(height: 20.h),
              Html(
                data: """
    <p style="font-family: Montserrat; font-size: ${14.sp}px; font-weight: 500; color: ${AppColors.text1.value.toRadixString(16)};">
      ${article.description ?? ''}
    </p>
  """,
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }
}
