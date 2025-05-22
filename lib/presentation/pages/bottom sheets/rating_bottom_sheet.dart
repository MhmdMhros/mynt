// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynt/app/functions.dart';
import 'package:mynt/core/resources/colors_manager.dart';
import 'package:mynt/presentation/pages/bottom%20sheets/success_request_bottom_sheet.dart';
import 'package:mynt/presentation/pages/tickets/cubit/tickets_cubit.dart';

class RatingBottomSheet extends StatefulWidget {
  final int ticketId;
  const RatingBottomSheet(this.ticketId, {super.key});

  @override
  State<RatingBottomSheet> createState() => _RatingBottomSheetState();
}

class _RatingBottomSheetState extends State<RatingBottomSheet> {
  int? selectedRate;
  TextEditingController feedbackController = TextEditingController();
  void showSuccessRequestBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder: (context) {
        return const SuccessRequestBottomSheet(
            'Your rate has been submitted successfully.');
      },
    );

    // Delay navigation by 4 seconds
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TicketsCubit, TicketsState>(builder: (context, state) {
      return ClipRRect(
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(16.r)), // Rounded top corners
        child: Container(
          color: Colors.white, // Background color
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            children: [
              Column(mainAxisSize: MainAxisSize.min, children: [
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Comment',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.text1,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    TextField(
                      controller: feedbackController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Write your comment here...',
                        hintStyle:
                            TextStyle(fontSize: 14.sp, color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: BorderSide.none, // Removes border color
                        ),
                      ),
                      style: TextStyle(fontSize: 14.sp),
                      maxLines: 3,
                    ),
                  ],
                ),
                SizedBox(height: 16.h),

                buildBottomButtons(context),
              ]),
              Positioned(
                right: 0,
                child: Container(
                  width: 30.w, // Adjust width
                  height: 30.h, // Adjust height
                  decoration: BoxDecoration(
                    color: const Color(0xFFF2F2F2),
                    borderRadius:
                        BorderRadius.circular(8.r), // Add border radius
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.close,
                        size: 16, color: Color(0xFFA6A6A6)),
                    padding: EdgeInsets.zero, // Remove default padding
                    onPressed: () {
                      Navigator.pop(context); // Dismiss Bottom Sheet
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
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
          Expanded(
            child: _buildButton("Decline", Colors.white, AppColors.primary, () {
              Navigator.pop(context); // Close BottomSheet
            }),
          ),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            child:
                _buildButton("Send", AppColors.primary, Colors.white, () async {
              if (selectedRate == null ||
                  feedbackController.text.trim().isEmpty) {
                showToast('Please provide both a score and a comment',
                    ToastType.error);
                return;
              }
              // Call cubit
              final success = await TicketsCubit.get(context).createReview(
                ticketId: widget.ticketId.toString(),
                comment: feedbackController.text.trim(),
                score: selectedRate.toString(),
              );
              if (success) {
                showSuccessRequestBottomSheet(context);
                Navigator.pop(context);
              }
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(
      String text, Color backGColor, Color textColor, VoidCallback onPressed) {
    return SizedBox(
      width: 155.w, // Set fixed width
      height: 50.h, // Set fixed height
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backGColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r), // Apply rounded corners
            side: BorderSide(
              color: AppColors.primary,
              width: 1.w, // Apply border width
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 14.sp, // Apply ScreenUtil
            color: textColor,
            fontWeight: FontWeight.w600,
            fontFamily: "Montserrat", // Apply Font Family
          ),
        ),
      ),
    );
  }
}
