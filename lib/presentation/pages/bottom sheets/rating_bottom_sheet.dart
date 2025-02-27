import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynt/core/constants/app_colors.dart';

class RatingBottomSheet extends StatefulWidget {
  final Function(int?, String) onSubmit; // Callback to pass data back

  const RatingBottomSheet({super.key, required this.onSubmit});

  @override
  State<RatingBottomSheet> createState() => _RatingBottomSheetState();
}

class _RatingBottomSheetState extends State<RatingBottomSheet> {
  int? selectedRate; // Store selected rate
  TextEditingController feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(
          top: Radius.circular(16.r)), // Rounded top corners
      child: Container(
        color: Colors.white, // Background color
        padding: const EdgeInsets.all(16.0),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          // ⭐ 1. Star Rating Selection
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              return Padding(
                padding: EdgeInsets.only(right: 4.w, left: 4.w),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedRate = index + 1;
                    });
                  },
                  child: Icon(
                    index < (selectedRate ?? 0)
                        ? Icons.star // Filled Star
                        : Icons.star_border, // Outlined Star
                    color: const Color(0xFFFFC107), // Star color
                    size: 40.sp,
                  ),
                ),
              );
            }),
          ),
          SizedBox(height: 16.h),

          // 2. Centered Text
          Text(
            'How was your experience with the service?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat',
              color: AppColors.text1,
            ),
          ),
          SizedBox(height: 16.h),

          // 3. Column with Text and TextField
          _buildTextField("Comment", "Write your comment here..."),
          SizedBox(height: 16.h),

          buildBottomButtons(context),
        ]),
      ),
    );
  }

  Widget _buildTextField(String title, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.text1,
          ),
        ),
        SizedBox(height: 10.h),
        TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: hint,
            hintStyle: TextStyle(fontSize: 14.sp, color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide.none, // Removes border color
            ),
          ),
          style: TextStyle(fontSize: 16.sp),
          maxLines: 3,
        ),
      ],
    );
  }

  Widget buildBottomButtons(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: 15.h, horizontal: 10.w), // Apply ScreenUtil
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildButton("Decline", Colors.white, AppColors.primary, () {
            Navigator.pop(context); // Close BottomSheet
          }),
          _buildButton("Accept", AppColors.primary, Colors.white, () {
            widget.onSubmit(selectedRate, feedbackController.text);
            Navigator.pop(context);
          }),
        ],
      ),
    );
  }

  Widget _buildButton(
      String text, Color backGColor, Color textColor, VoidCallback onPressed) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backGColor,
        padding: EdgeInsets.symmetric(
            horizontal: 50.w, vertical: 12.h), // Apply ScreenUtil
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r), // Apply ScreenUtil
          side: BorderSide(
            color: AppColors.primary,
            width: 1.w, // Apply ScreenUtil
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16.sp, // Apply ScreenUtil
          color: textColor,
          fontFamily: "Montserrat", // Apply Font Family
        ),
      ),
    );
  }
}
