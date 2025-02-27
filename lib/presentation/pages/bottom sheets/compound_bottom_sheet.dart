import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynt/core/constants/app_colors.dart';

class CompoundBottomSheet extends StatefulWidget {
  final Function(String?) onSubmit;

  const CompoundBottomSheet({super.key, required this.onSubmit});

  @override
  // ignore: library_private_types_in_public_api
  _CompoundBottomSheetState createState() => _CompoundBottomSheetState();
}

class _CompoundBottomSheetState extends State<CompoundBottomSheet> {
  String? _selectedCompound;

  final List<String> _compoundTypes = [
    "Festival Living",
    "Aura",
    "90 Ninety",
    "Mivida",
  ];

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
                      "Compound",
                      style: TextStyle(
                        fontSize: 18.sp,
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
                  children: _compoundTypes
                      .map((compound) => _buildCompoundItem(compound))
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// **Service Item Widget**
  Widget _buildCompoundItem(String compound) {
    bool isSelected = _selectedCompound == compound;

    return GestureDetector(
      onTap: () {
        setState(() {
          widget.onSubmit(compound);
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
                compound,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: isSelected ? AppColors.primary : Colors.black,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Radio<String>(
              value: compound,
              groupValue: _selectedCompound,
              activeColor: AppColors.primary,
              onChanged: (String? value) {
                setState(() {
                  _selectedCompound = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
