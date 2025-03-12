import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynt/core/constants/app_colors.dart';
import 'package:mynt/presentation/pages/bottom%20sheets/compound_bottom_sheet.dart';
import 'package:mynt/presentation/pages/bottom%20sheets/dr_service_type_bottom_sheet.dart';
import 'package:mynt/presentation/pages/bottom%20sheets/unit_number_bottom_sheet.dart';

class RequestServiceScreen extends StatefulWidget {
  const RequestServiceScreen({super.key});

  @override
  State<RequestServiceScreen> createState() => _RequestServiceScreenState();
}

class _RequestServiceScreenState extends State<RequestServiceScreen> {
  String? selectServiceType;
  String? selectedCompound;
  String? selectedUnitNumber;

  /// Show the Service Type Bottom Sheet
  void showServiceTypeBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder: (context) {
        return DRServiceTypeBottomSheet(
          onSubmit: (text) {
            setState(() {
              selectServiceType = text;
            });
          },
        );
      },
    );
  }

  /// Show the Compound Selection Bottom Sheet
  void showCompoundBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder: (context) {
        return CompoundBottomSheet(
          onSubmit: (text) {
            setState(() {
              selectedCompound = text;
            });
          },
        );
      },
    );
  }

  /// Show the Unit Number Selection Bottom Sheet
  void showUnitNumBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder: (context) {
        return UnitNumberBottomSheet(
          onSubmit: (text) {
            setState(() {
              selectedUnitNumber = text;
            });
          },
        );
      },
    );
  }

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
          "Request Service",
          style: TextStyle(
            fontSize: 16.sp,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w600,
            color: AppColors.text1,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildDropdownField(
                      title: "Compound",
                      hint: "Choose Compound",
                      selectedValue: selectedCompound,
                      onTap: () => showCompoundBottomSheet(context),
                    ),
                    SizedBox(height: 15.h),
                    _buildDropdownField(
                      title: "Unit number",
                      hint: "Choose Unit Number",
                      selectedValue: selectedUnitNumber,
                      onTap: () => showUnitNumBottomSheet(context),
                    ),
                    SizedBox(height: 15.h),
                    _buildDropdownField(
                      title: "Service type",
                      hint: "Choose Service Type",
                      selectedValue: selectServiceType,
                      onTap: () => showServiceTypeBottomSheet(context),
                    ),
                    SizedBox(height: 15.h),
                    _buildTextField(
                        "Description", "Write your comment here..."),
                  ],
                ),
              ),
            ),
            _buildSubmitButton(),
          ],
        ),
      ),
    );
  }

  /// **Custom Dropdown Field that Opens Bottom Sheet**
  Widget _buildDropdownField({
    required String title,
    required String hint,
    required String? selectedValue,
    required VoidCallback onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            fontFamily: "Montserrat",
            color: AppColors.text1,
          ),
        ),
        SizedBox(height: 10.h),
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selectedValue ?? hint,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Montserrat",
                    color:
                        selectedValue != null ? AppColors.primary : Colors.grey,
                  ),
                ),
                const Icon(
                  Icons.keyboard_arrow_down,
                  size: 30,
                  color: AppColors.text1,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// **Text Field**
  Widget _buildTextField(String title, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14.sp,
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
              borderSide: BorderSide.none,
            ),
          ),
          style: TextStyle(fontSize: 14.sp),
          maxLines: 3,
        ),
      ],
    );
  }

  /// **Submit Button**
  Widget _buildSubmitButton() {
    return SizedBox(
      width: double.infinity,
      height: 50.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        onPressed: () {
          // Handle button action
        },
        child: Text(
          "Submit Request",
          style: TextStyle(
            fontSize: 16.sp,
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontFamily: "Montserrat",
          ),
        ),
      ),
    );
  }
}
