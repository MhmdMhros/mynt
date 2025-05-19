// ignore_for_file: unused_local_variable, prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynt/core/resources/colors_manager.dart';
import 'package:mynt/domain/entities/booking.dart';
import 'package:mynt/presentation/pages/balances/balances_screen.dart';
import 'package:mynt/presentation/pages/bottom%20sheets/block_unit_bottom_sheet.dart';
import 'package:mynt/presentation/pages/bottom%20sheets/service_type_bottom_sheet.dart';
import 'package:mynt/presentation/pages/unit%20details/widgets/monthly_calendar_widget.dart';
import 'package:mynt/presentation/pages/units/cubit/units_cubit.dart';

class UnitDetailsScreen extends StatefulWidget {
  final Booking booking;
  const UnitDetailsScreen(this.booking, {super.key});

  @override
  State<UnitDetailsScreen> createState() => _UnitDetailsScreenState();
}

class _UnitDetailsScreenState extends State<UnitDetailsScreen> {
  int index = 0;
  void showEnterDateBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder: (context) {
        return BlockUnitBottomSheet(widget.booking.id ?? 0);
      },
    );
  }

  void showServiceTypesBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder: (context) {
        return const ServiceTypeBottomSheet();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // final List<BookedDateModel> bookedDates = [
    //   BookedDateModel(bookingId: 16, date: "2025-06-01"),
    //   BookedDateModel(bookingId: 16, date: "2025-06-02"),
    //   BookedDateModel(bookingId: 17, date: "2025-06-10"),
    //   BookedDateModel(bookingId: 17, date: "2025-06-11"),
    //   BookedDateModel(bookingId: 17, date: "2025-06-12"),
    //   BookedDateModel(bookingId: 17, date: "2025-06-13"),
    //   BookedDateModel(bookingId: 21, date: "2025-05-09"),
    //   BookedDateModel(bookingId: 21, date: "2025-05-10"),
    //   BookedDateModel(bookingId: 21, date: "2025-05-11"),
    //   BookedDateModel(bookingId: 21, date: "2025-05-12"),
    //   BookedDateModel(bookingId: 21, date: "2025-05-13"),
    //   BookedDateModel(bookingId: 23, date: "2025-05-29"),
    //   BookedDateModel(bookingId: 23, date: "2025-05-30"),
    //   BookedDateModel(bookingId: 27, date: "2025-09-01"),
    //   BookedDateModel(bookingId: 27, date: "2025-09-02"),
    //   BookedDateModel(bookingId: 27, date: "2025-09-03"),
    //   BookedDateModel(bookingId: 27, date: "2025-09-04"),
    //   BookedDateModel(bookingId: 27, date: "2025-09-05"),
    //   BookedDateModel(bookingId: 27, date: "2025-09-06"),
    //   BookedDateModel(bookingId: 27, date: "2025-09-07"),
    //   BookedDateModel(bookingId: 27, date: "2025-09-08"),
    //   BookedDateModel(bookingId: 27, date: "2025-09-09"),
    //   BookedDateModel(bookingId: 29, date: "2025-06-04"),
    //   BookedDateModel(bookingId: 29, date: "2025-06-05"),
    //   BookedDateModel(bookingId: 30, date: "2025-07-04"),
    //   BookedDateModel(bookingId: 30, date: "2025-07-05"),
    //   BookedDateModel(bookingId: 31, date: "2025-10-01"),
    //   BookedDateModel(bookingId: 31, date: "2025-10-02"),
    //   BookedDateModel(bookingId: 31, date: "2025-10-03"),
    //   BookedDateModel(bookingId: 31, date: "2025-10-04"),
    //   BookedDateModel(bookingId: 31, date: "2025-10-05"),
    //   BookedDateModel(bookingId: 31, date: "2025-10-06"),
    //   BookedDateModel(bookingId: 31, date: "2025-10-07"),
    //   BookedDateModel(bookingId: 31, date: "2025-10-08"),
    //   BookedDateModel(bookingId: 31, date: "2025-10-09"),
    // ];
    return BlocBuilder<UnitsCubit, UnitsState>(builder: (context, state) {
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
            "Unit Details",
            style: TextStyle(
              fontSize: 16.sp,
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w600,
              color: AppColors.text1,
            ),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 1. Image of the unit
                    Container(
                      width: double.infinity,
                      height: 200.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child: CachedNetworkImage(
                          imageUrl: widget.booking.gallery == null ||
                                  widget.booking.gallery!.isEmpty
                              ? ''
                              : widget.booking.gallery!.first,
                          fit: BoxFit.cover,
                          placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) => const Center(
                              child: Icon(Icons.error, color: Colors.red)),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.booking.title ?? '',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Montserrat",
                            color: AppColors.text1,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "Unit ID: ",
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Montserrat",
                                color: AppColors.text1,
                              ),
                            ),
                            Text(
                              '#${widget.booking.bookingId.toString()}',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Montserrat",
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        Icon(Icons.location_on_outlined,
                            color: AppColors.primary, size: 20.w),
                        Expanded(
                          child: Text(
                            widget.booking.projectAddress ?? '',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w500,
                              color: AppColors.text2,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Column(
                      children: [
                        _buildRow(
                            Icons.person_outline_outlined,
                            "Current Tennent",
                            widget.booking.customerName ?? ''),
                        SizedBox(height: 10.h),
                        _buildRow(
                            Icons.bookmark_border_rounded,
                            "Booking Duration",
                            widget.booking.checkin!.isEmpty
                                ? '--'
                                : '${widget.booking.checkin} - ${widget.booking.checkout}'),
                        SizedBox(height: 10.h),
                        _buildRow(
                            Icons.balance_rounded,
                            "Balance",
                            widget.booking.checkin!.isEmpty
                                ? '--'
                                : 'EGP ${widget.booking.balance ?? ''}',
                            Colors.red),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Divider(color: Colors.grey.shade300, thickness: 1),
                    SizedBox(height: 10.h),
                    // Container(
                    //   width: double.infinity,
                    //   padding: EdgeInsets.all(12.w),
                    //   decoration: BoxDecoration(
                    //     color: const Color(0xFFF0F4F5),
                    //     borderRadius: BorderRadius.circular(10.r),
                    //   ),
                    //   child: Row(
                    //     children: [
                    //       Expanded(
                    //         child: MaterialButton(
                    //           color: index == 0
                    //               ? AppColors.primary
                    //               : const Color(0xFFF0F4F5),
                    //           padding: EdgeInsets.symmetric(vertical: 12.h),
                    //           elevation: 0, // Removes any shadow
                    //           shape: RoundedRectangleBorder(
                    //             borderRadius: BorderRadius.circular(16.r),
                    //           ),
                    //           onPressed: () {
                    //             setState(() {
                    //               index = 0;
                    //             });
                    //           },
                    //           child: Text(
                    //             "Year",
                    //             style: TextStyle(
                    //               fontSize: 14.sp,
                    //               fontWeight: FontWeight.w600,
                    //               fontFamily: "Montserrat",
                    //               color: index == 0
                    //                   ? Colors.white
                    //                   : const Color(0xFF666666),
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //       SizedBox(width: 10.w),
                    //       Expanded(
                    //         child: MaterialButton(
                    //           color: index == 1
                    //               ? AppColors.primary
                    //               : const Color(0xFFF0F4F5),
                    //           padding: EdgeInsets.symmetric(vertical: 12.h),
                    //           elevation: 0, // Removes any shadow
                    //           shape: RoundedRectangleBorder(
                    //             borderRadius: BorderRadius.circular(16.r),
                    //           ),
                    //           onPressed: () {
                    //             setState(() {
                    //               index = 1;
                    //             });
                    //           },
                    //           child: Text(
                    //             "Month",
                    //             style: TextStyle(
                    //               fontSize: 14.sp,
                    //               fontWeight: FontWeight.w600,
                    //               fontFamily: "Montserrat",
                    //               color: index == 1
                    //                   ? Colors.white
                    //                   : const Color(0xFF666666),
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    SizedBox(height: 10.h),
                    SingleCalendarView(
                        highlightedDays: groupDatesByYearMonth(
                            widget.booking.bookedDates ?? [])),
                  ],
                ),
              ),
            ),
            _buildBottomButtons(context),
          ],
        ),
      );
    });
  }

  // Helper method to create rows with an icon, title, and expandable text
  Widget buildInfoRow(IconData icon, String title, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primary, size: 20.w),
          SizedBox(width: 10.w),
          Text(
            title,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              fontFamily: "Montserrat",
              color: AppColors.text1,
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                fontFamily: "Montserrat",
                color: AppColors.text2,
              ),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRow(IconData icon, String label, String value,
      [Color? valueColor]) {
    return Row(
      children: [
        Icon(icon, size: 15.sp, color: Colors.grey),
        SizedBox(width: 6.w),
        Expanded(
          child: Text(label,
              style: TextStyle(fontSize: 14.sp, fontFamily: "Montserrat")),
        ),
        SizedBox(width: 30.w),
        label == "Balance"
            ? GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BalancesScreen(
                          UnitsCubit.get(context).bookingAccountSummaryData!,
                          false,
                          widget.booking.id.toString()),
                    ),
                  );
                },
                child: Text(
                  value,
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: valueColor ?? Colors.blue,
                      fontFamily: "Montserrat",
                      decoration: TextDecoration.underline),
                ),
              )
            : Text(
                value,
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: valueColor ?? Colors.black,
                    fontFamily: "Montserrat"),
              ),
      ],
    );
  }

  Widget _buildBottomButtons(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(top: 10.h, bottom: 10.h, left: 20.w, right: 20.w),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildContainerButton(
                "Maintenance Request", Colors.white, AppColors.primary, () {
              showServiceTypesBottomSheet(context);
            }),
          ),
          SizedBox(width: 15.w), // Add spacing between buttons
          Expanded(
            child: _buildContainerButton(
                "Block Unit", AppColors.primary, Colors.white, () {
              showEnterDateBottomSheet(context);
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildContainerButton(
      String text, Color backGColor, Color textColor, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50.h,
        decoration: BoxDecoration(
          color: backGColor,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: AppColors.primary,
            width: 1.w,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 12.sp,
              color: textColor,
              fontWeight: FontWeight.w600,
              fontFamily: "Montserrat",
            ),
          ),
        ),
      ),
    );
  }

  Map<int, Map<int, List<int>>> groupDatesByYearMonth(
      List<BookedDateModel> bookedDates) {
    final Map<int, Map<int, List<int>>> grouped = {};

    for (var dateModel in bookedDates) {
      if (dateModel.date != null) {
        DateTime parsed = DateTime.parse(dateModel.date!);
        grouped.putIfAbsent(parsed.year, () => {});
        grouped[parsed.year]!.putIfAbsent(parsed.month, () => []);
        grouped[parsed.year]![parsed.month]!.add(parsed.day);
      }
    }

    return grouped;
  }
}
