import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynt/core/constants/app_colors.dart';

class ServiceTypeBottomSheet extends StatefulWidget {
  const ServiceTypeBottomSheet({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ServiceTypeBottomSheetState createState() => _ServiceTypeBottomSheetState();
}

class _ServiceTypeBottomSheetState extends State<ServiceTypeBottomSheet> {
  String? _selectedService;

  final List<String> _serviceTypes = [
    "Emergency",
    "Maintenance & Facility Request",
    "IT Service",
    "Security Request",
    "Construction Request",
    "Community Access",
    "Pet's Registration",
    "Financial Request",
  ]; // Example service types

  @override
  Widget build(BuildContext context) {
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
                      "Service Type",
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
            SizedBox(height: 5.h),
            Divider(height: 1.h, color: Colors.grey[200]),
            SizedBox(height: 5.h),

            /// **Scrollable Service List**
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: _serviceTypes
                      .map((service) => _buildServiceItem(service))
                      .toList(),
                ),
              ),
            ),
            buildBottomButtons(context),
          ],
        ),
      ),
    );
  }

  /// **Service Item Widget**
  Widget _buildServiceItem(String service) {
    bool isSelected = _selectedService == service;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedService = service;
        });
      },
      child: Container(
        height: 50.h,
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
                service,
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
              value: service,
              groupValue: _selectedService,
              activeColor: AppColors.primary,
              onChanged: (String? value) {
                setState(() {
                  _selectedService = value;
                });
              },
            ),
          ],
        ),
      ),
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
            child: _buildButton("Send", AppColors.primary, Colors.white, () {
              Navigator.pop(context);
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
