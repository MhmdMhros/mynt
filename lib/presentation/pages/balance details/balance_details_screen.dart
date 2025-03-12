import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynt/core/constants/app_colors.dart';
import 'package:mynt/presentation/pages/balance%20details/balance_description_widget.dart';
import 'package:mynt/presentation/pages/balance%20details/balances_widget.dart';
import 'package:mynt/presentation/pages/balance%20details/booked_unit_widget.dart';

class BalanceDetailsScreen extends StatefulWidget {
  const BalanceDetailsScreen({super.key});

  @override
  State<BalanceDetailsScreen> createState() => _BalanceDetailsScreenState();
}

class _BalanceDetailsScreenState extends State<BalanceDetailsScreen> {
  int selectedIndex = 1;
  final List<String> categories = ["Balances", "Booked Unit", "Description"];

  Widget getSelectedWidget() {
    switch (selectedIndex) {
      case 0:
        return const BalancesWidget();
      case 1:
        return const BookedUnitWidget();
      case 2:
        return const BalanceDescriptionWidget();
      default:
        return const BookedUnitWidget();
    }
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
          "Details",
          style: TextStyle(
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
            color: AppColors.text1,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = 0;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 12.h, horizontal: 20.w),
                      decoration: BoxDecoration(
                        color: selectedIndex == 0
                            ? AppColors.primary
                            : AppColors.iconsBack,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Text(
                        categories[0],
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 10.sp,
                          color:
                              selectedIndex == 0 ? Colors.white : Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = 1;
                    });
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 12.h, horizontal: 20.w),
                    decoration: BoxDecoration(
                      color: selectedIndex == 1
                          ? AppColors.primary
                          : AppColors.iconsBack,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Text(
                      categories[1],
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 10.sp,
                        color: selectedIndex == 1 ? Colors.white : Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = 2;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 12.h, horizontal: 20.w),
                      decoration: BoxDecoration(
                        color: selectedIndex == 2
                            ? AppColors.primary
                            : AppColors.iconsBack,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Text(
                        categories[2],
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 10.sp,
                          color:
                              selectedIndex == 2 ? Colors.white : Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(child: getSelectedWidget()),
        ],
      ),
    );
  }
}
