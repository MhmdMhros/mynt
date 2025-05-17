import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynt/app/functions.dart';
import 'package:mynt/core/resources/colors_manager.dart';
// import 'package:mynt/presentation/pages/bottom%20sheets/compound_bottom_sheet.dart';
import 'package:mynt/presentation/pages/bottom%20sheets/dr_service_type_bottom_sheet.dart';
import 'package:mynt/presentation/pages/bottom%20sheets/unit_number_bottom_sheet.dart';
import 'package:mynt/presentation/pages/request%20service/cubit/request_service_cubit.dart';

class RequestServiceScreen extends StatefulWidget {
  const RequestServiceScreen({super.key});

  @override
  State<RequestServiceScreen> createState() => _RequestServiceScreenState();
}

class _RequestServiceScreenState extends State<RequestServiceScreen> {
  final _formKey = GlobalKey<FormState>();
  final _descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    void showServiceTypeBottomSheet(BuildContext context) {
      showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
        ),
        builder: (context) {
          return DRServiceTypeBottomSheet(
            onSubmit: (id, title) {
              showToast(id ?? '', ToastType.success);
              RequestServiceCubit.get(context)
                  .updateServiceTitleId(id ?? '', title ?? '');
            },
          );
        },
      );
    }

    void showUnitNumBottomSheet(BuildContext context) {
      showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
        ),
        builder: (context) {
          return UnitNumberBottomSheet(
            onSubmit: (text) {
              showToast(text ?? '', ToastType.success);
              RequestServiceCubit.get(context).updateUnitId(text ?? '');
            },
          );
        },
      );
    }

    return BlocBuilder<RequestServiceCubit, RequestServiceState>(
        builder: (context, state) {
      final cubit = RequestServiceCubit.get(context);

      List<File> images = [];
      if (state is RequestServiceImagesUpdated) {
        images = state.images;
      }

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
        body: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: Column(
              children: [
                if (images.isNotEmpty)
                  SizedBox(
                    height: 100.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: images.length,
                      separatorBuilder: (context, index) =>
                          SizedBox(width: 10.w),
                      itemBuilder: (context, index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(8.r),
                          child: Image.file(
                            images[index],
                            width: 100.w,
                            height: 100.h,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                  ),
                ElevatedButton(
                  onPressed: () {
                    cubit.pickImages();
                  },
                  child: const Text("Pick Images"),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        _buildDropdownField(
                          title: "Unit number",
                          hint: "Choose Unit Number",
                          selectedValue:
                              cubit.unitId == '' ? null : cubit.unitId,
                          onTap: () => showUnitNumBottomSheet(context),
                        ),
                        SizedBox(height: 15.h),
                        _buildDropdownField(
                          title: "Service type",
                          hint: "Choose Service Type",
                          selectedValue: cubit.serviceTitle == ''
                              ? null
                              : cubit.serviceTitle,
                          onTap: () => showServiceTypeBottomSheet(context),
                        ),
                        SizedBox(height: 15.h),
                        _buildTextField(
                          title: 'Description',
                          hint: 'Write your comment here...',
                          controller: _descriptionController,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Description is required';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    onPressed: () async {
                      if (cubit.unitId == '') {
                        showToast(
                            'Unit id must not be empty.', ToastType.warning);
                      } else if (cubit.serviceId == '') {
                        showToast('Service type must not be empty.',
                            ToastType.warning);
                      } else if (_formKey.currentState!.validate()) {
                        await cubit.submitTicket(
                            description: _descriptionController.text);
                        _descriptionController.clear();
                      }
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
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

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
                Expanded(
                  child: Text(
                    selectedValue ?? hint,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Montserrat",
                      color: selectedValue != null
                          ? AppColors.primary
                          : Colors.grey,
                    ),
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

  Widget _buildTextField({
    required String title,
    required String hint,
    required TextEditingController controller,
    required String? Function(String?) validator,
  }) {
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
        TextFormField(
          controller: controller,
          validator: validator,
          maxLines: 3,
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
        ),
      ],
    );
  }
}
