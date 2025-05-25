// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynt/app/functions.dart';
import 'package:mynt/core/resources/colors_manager.dart';
import 'package:mynt/presentation/pages/bottom%20sheets/success_request_bottom_sheet.dart';
import 'package:mynt/presentation/pages/units/cubit/units_cubit.dart';

class BlockUnitBottomSheet extends StatefulWidget {
  final int unitId;
  const BlockUnitBottomSheet(this.unitId, {super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BlockUnitBottomSheetState createState() => _BlockUnitBottomSheetState();
}

class _BlockUnitBottomSheetState extends State<BlockUnitBottomSheet> {
  TextEditingController checkInController = TextEditingController();
  TextEditingController checkOutController = TextEditingController();
  void showSuccessRequestBottomSheet(BuildContext context, String message) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder: (context) {
        return SuccessRequestBottomSheet(message);
      },
    );

    // Delay navigation by 4 seconds
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pop(context);
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UnitsCubit, UnitsState>(builder: (context, state) {
      return ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
        child: Container(
          color: AppColors.background,
          padding: EdgeInsets.all(16.r),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        "Enter Dates",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 30.w,
                    height: 30.h,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF2F2F2),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.close,
                          size: 16, color: Color(0xFFA6A6A6)),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Divider(
                height: 1.h,
                color: Colors.grey[200],
              ),
              SizedBox(height: 5.h),
              Column(mainAxisSize: MainAxisSize.min, children: [
                _buildTextField("Check-in", "Enter check-in date",
                    Icons.calendar_month_outlined, context, checkInController),
                SizedBox(height: 16.h),
                _buildTextField("Check-out", "Enter Check-out date",
                    Icons.calendar_month_outlined, context, checkOutController),
                SizedBox(height: 16.h),
                buildBottomButtons(context),
              ]),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildTextField(String title, String hint, IconData suffixIcon,
      BuildContext context, TextEditingController controller) {
    Future<void> selectDate() async {
      DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
      );

      if (pickedDate != null) {
        controller.text =
            "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}";
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            fontFamily: 'Montserrat',
            color: AppColors.text1,
          ),
        ),
        SizedBox(height: 10.h),
        GestureDetector(
          onTap: selectDate, // Open date picker when tapping the text field
          child: Container(
            height: 50.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.r)),
              color: Colors.white,
            ),
            child: TextField(
              controller: controller,
              readOnly: true, // Prevent manual input
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.grey,
                  fontFamily: 'Montserrat',
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: IconButton(
                  icon: Icon(suffixIcon, color: Colors.grey),
                  onPressed:
                      selectDate, // Open date picker when tapping the icon
                ),
              ),
              style: TextStyle(
                fontSize: 14.sp,
                fontFamily: 'Montserrat',
              ),
            ),
          ),
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
          Expanded(
            child: _buildButton("Decline", Colors.white, AppColors.primary, () {
              Navigator.pop(context);
            }),
          ),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            child:
                _buildButton("Send", AppColors.primary, Colors.white, () async {
              if (checkInController.text.isEmpty ||
                  checkOutController.text.isEmpty) {
                showToast('Please provide both a check in and check out.',
                    ToastType.error);
                return;
              } else {
                final result = await UnitsCubit.get(context).createRestriction(
                  propertyId: widget.unitId.toString(),
                  dateFrom: checkInController.text,
                  dateTo: checkOutController.text,
                );
                if (result['isSuccess']) {
                  showSuccessRequestBottomSheet(context, result['message']);
                } else {
                  showToast(result['message'], ToastType.error);
                  Navigator.pop(context);
                }
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
      width: 155.w,
      height: 50.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backGColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
            side: BorderSide(
              color: AppColors.primary,
              width: 1.w,
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 14.sp,
            color: textColor,
            fontWeight: FontWeight.w600,
            fontFamily: "Montserrat",
          ),
        ),
      ),
    );
  }
}
