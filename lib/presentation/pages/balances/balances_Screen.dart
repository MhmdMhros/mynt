import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynt/core/resources/colors_manager.dart';
import 'package:mynt/domain/entities/account_summary_data.dart';
import 'package:mynt/presentation/pages/balances/account_summary_details_screen.dart';

class BalancesScreen extends StatelessWidget {
  final AccountSummaryData accountSummaryData;
  const BalancesScreen(this.accountSummaryData, {super.key});

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
          "Net Balance",
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
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Search...",
                prefixIcon: Icon(
                  Icons.search,
                  color: AppColors.text1,
                  size: 24.sp,
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Row(
                children: [
                  Icon(Icons.filter_list,
                      color: AppColors.primary, size: 24.sp),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: "Filter",
                        items: ["Filter", "Pending", "Completed", "Failed"]
                            .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(
                                    e,
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.text1,
                                    ),
                                  ),
                                ))
                            .toList(),
                        onChanged: (value) {},
                        icon: Icon(Icons.keyboard_arrow_down_outlined,
                            color: AppColors.text1, size: 30.sp),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),

            // Header Row
            Container(
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
              decoration: BoxDecoration(
                color: const Color(0xFFF0F4F5),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Row(
                children: [
                  _buildHeaderCell("Id", flex: 1),
                  _buildHeaderCell("Unit Number", flex: 2),
                  _buildHeaderCell("Balance", flex: 2),
                  _buildHeaderCell("More", flex: 1),
                ],
              ),
            ),
            SizedBox(height: 10.h),

            // Data List
            Expanded(
              child: ListView.separated(
                itemCount: accountSummaryData.accountSummary.length,
                separatorBuilder: (_, __) => SizedBox(height: 8.h),
                itemBuilder: (context, index) {
                  final item = accountSummaryData.accountSummary[index];
                  return Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Row(
                      children: [
                        _buildDataCell(item.id.toString(), flex: 1),
                        _buildDataCell(item.propertyNumber ?? '', flex: 2),
                        _buildDataCell(
                          "${item.balance ?? '0'} EGP",
                          flex: 2,
                          color: double.tryParse(item.balance ?? '0') != null &&
                                  double.parse(item.balance!) > 0
                              ? const Color(0xFF007D8B)
                              : const Color(0xFFDD6D5C),
                        ),
                        Expanded(
                          flex: 1,
                          child: IconButton(
                            icon: Icon(Icons.arrow_forward_ios,
                                color: AppColors.primary, size: 16.w),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      AccountSummaryDetailsScreen(
                                    accountSummary: item,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 10.h),
            Column(
              children: [
                _buildDownloadButton(
                    "Download PDF", Colors.white, AppColors.primary),
                SizedBox(height: 10.h),
                _buildDownloadButton(
                    "Download XLSX", AppColors.primary, Colors.white),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderCell(String text, {int flex = 1}) {
    return Expanded(
      flex: flex,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14.sp,
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w600,
          color: AppColors.text1,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _buildDataCell(String text, {int flex = 1, Color? color}) {
    return Expanded(
      flex: flex,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12.sp,
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w500,
          color: color ?? Colors.black,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _buildDownloadButton(String text, Color textColor, Color backColor) {
    return SizedBox(
      height: 60.h,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: backColor,
          padding: EdgeInsets.symmetric(vertical: 12.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
            side: const BorderSide(
              color: AppColors.primary,
              width: 1,
            ),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16.sp,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
