import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynt/core/constants/app_colors.dart';

class RequestServiceScreen extends StatelessWidget {
  const RequestServiceScreen({super.key});

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
            fontSize: 18.sp,
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
              child: Column(
                children: [
                  _buildDropdownField("Compound", "Choose Compound",
                      ["Hi", "Hello", "Welcome"]),
                  SizedBox(height: 15.h),
                  _buildDropdownField("Unit number", "Choose Unit Number",
                      ["Hi", "Hello", "Welcome"]),
                  SizedBox(height: 15.h),
                  _buildDropdownField("Service type", "Choose Service Type",
                      ["Hi", "Hello", "Welcome"]),
                  SizedBox(height: 15.h),
                  _buildTextField("Description", "Write your comment here..."),
                ],
              ),
            ),
            _buildSubmitButton(),
          ],
        ),
      ),
    );
  }

  /// Builds a dropdown field with a title and hint
  Widget _buildDropdownField(String title, String hint, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            fontFamily: "Montserrat",
            color: AppColors.text1,
          ),
        ),
        SizedBox(height: 10.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: DropdownButtonFormField<String>(
            decoration: const InputDecoration(border: InputBorder.none),
            items: items.map((String item) {
              return DropdownMenuItem(value: item, child: Text(item));
            }).toList(),
            onChanged: (value) {},
            hint: Text(hint,
                style: TextStyle(fontSize: 14.sp, color: Colors.grey)),
            icon: const Icon(Icons.keyboard_arrow_down,
                size: 30, color: AppColors.text1), // Custom arrow icon
            style: TextStyle(
                fontSize: 16.sp,
                color: AppColors.text1,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }

  /// Builds a text field with a title and hint
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

  /// Builds the submit button
  Widget _buildSubmitButton() {
    return SizedBox(
      width: double.infinity,
      height: 50.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
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
