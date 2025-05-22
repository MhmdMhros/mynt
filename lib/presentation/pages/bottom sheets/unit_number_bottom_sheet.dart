import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynt/core/resources/colors_manager.dart';
import 'package:mynt/presentation/pages/request%20service/cubit/request_service_cubit.dart';

class UnitNumberBottomSheet extends StatefulWidget {
  final Function(String?, String?) onSubmit;

  const UnitNumberBottomSheet({super.key, required this.onSubmit});

  @override
  // ignore: library_private_types_in_public_api
  _UnitNumberBottomSheetState createState() => _UnitNumberBottomSheetState();
}

class _UnitNumberBottomSheetState extends State<UnitNumberBottomSheet> {
  String? _selectedUnitNumber;

  // final List<String> _unitNumbers = [
  //   "23",
  //   "41",
  //   "67",
  //   "3",
  // ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequestServiceCubit, RequestServiceState>(
        builder: (context, state) {
      var cubit = RequestServiceCubit.get(context);
      final bookingIds = cubit.requestServiceData?.bookingIds ?? [];
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
                        "Unit Id",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
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
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: bookingIds
                        .map((booking) => _buildUnitNumItem(
                            booking.id.toString(), booking.title ?? ''))
                        .toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  /// **Service Item Widget**
  Widget _buildUnitNumItem(String unitNum, String unitTitle) {
    bool isSelected = _selectedUnitNumber == unitNum;

    return GestureDetector(
      onTap: () {
        setState(() {
          widget.onSubmit(unitNum, unitTitle);
          Navigator.pop(context);
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 6.h),
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : AppColors.background,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: Colors.grey.shade100,
            width: 1.w,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                unitTitle,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: isSelected ? AppColors.primary : Colors.black,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Radio<String>(
              value: unitNum,
              groupValue: _selectedUnitNumber,
              activeColor: AppColors.primary,
              onChanged: (String? value) {
                setState(() {
                  _selectedUnitNumber = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
