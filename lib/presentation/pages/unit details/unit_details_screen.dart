// ignore_for_file: unused_local_variable, prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynt/core/resources/colors_manager.dart';
import 'package:mynt/domain/entities/booking.dart';
import 'package:mynt/domain/entities/calender_data.dart';
import 'package:mynt/presentation/pages/balances/balances_screen.dart';
import 'package:mynt/presentation/pages/bottom%20sheets/block_unit_bottom_sheet.dart';
import 'package:mynt/presentation/pages/bottom%20sheets/service_type_bottom_sheet.dart';
import 'package:mynt/presentation/pages/request%20service/request_service_screen.dart';
import 'package:mynt/presentation/pages/unit%20details/widgets/monthly_calendar_widget.dart';
import 'package:mynt/presentation/pages/units/cubit/units_cubit.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class UnitDetailsScreen extends StatefulWidget {
  final int bookingId;
  const UnitDetailsScreen(this.bookingId, {super.key});

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
        return BlockUnitBottomSheet(
            UnitsCubit.get(context).bookingDetails.id ?? 0);
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
  void initState() {
    super.initState();
    UnitsCubit.get(context).getBookingDetails(widget.bookingId.toString());
  }

  @override
  Widget build(BuildContext context) {
    // final List<BookedDateModel> bookedDates = [
    //   BookedDateModel(bookingId: 16, date: "2025-06-01", bookingPlatform: 1),
    //   BookedDateModel(bookingId: 16, date: "2025-04-01", bookingPlatform: 1),
    //   BookedDateModel(bookingId: 16, date: "2026-04-02", bookingPlatform: 2),
    //   BookedDateModel(bookingId: 16, date: "2025-06-02", bookingPlatform: 1),
    //   BookedDateModel(bookingId: 17, date: "2025-06-10", bookingPlatform: 2),
    //   BookedDateModel(bookingId: 17, date: "2025-06-11", bookingPlatform: 1),
    //   BookedDateModel(bookingId: 17, date: "2025-06-12", bookingPlatform: 1),
    //   BookedDateModel(bookingId: 17, date: "2025-06-13", bookingPlatform: 2),
    //   BookedDateModel(bookingId: 21, date: "2025-05-09", bookingPlatform: 1),
    //   BookedDateModel(bookingId: 21, date: "2025-05-10", bookingPlatform: 1),
    //   BookedDateModel(bookingId: 21, date: "2025-05-11", bookingPlatform: 1),
    //   BookedDateModel(bookingId: 21, date: "2025-05-12", bookingPlatform: 1),
    //   BookedDateModel(bookingId: 21, date: "2025-05-13", bookingPlatform: 1),
    //   BookedDateModel(bookingId: 23, date: "2025-05-29", bookingPlatform: 1),
    //   BookedDateModel(bookingId: 23, date: "2025-05-30", bookingPlatform: 2),
    //   BookedDateModel(bookingId: 27, date: "2025-09-01", bookingPlatform: 2),
    //   BookedDateModel(bookingId: 27, date: "2025-09-02", bookingPlatform: 2),
    //   BookedDateModel(bookingId: 27, date: "2025-09-03", bookingPlatform: 1),
    //   BookedDateModel(bookingId: 27, date: "2025-09-04", bookingPlatform: 1),
    //   BookedDateModel(bookingId: 27, date: "2025-09-05", bookingPlatform: 2),
    //   BookedDateModel(bookingId: 27, date: "2025-09-06", bookingPlatform: 1),
    //   BookedDateModel(bookingId: 27, date: "2025-09-07", bookingPlatform: 1),
    //   BookedDateModel(bookingId: 27, date: "2025-09-08", bookingPlatform: 2),
    //   BookedDateModel(bookingId: 27, date: "2025-09-09", bookingPlatform: 1),
    //   BookedDateModel(bookingId: 29, date: "2025-06-04", bookingPlatform: 1),
    //   BookedDateModel(bookingId: 29, date: "2025-06-05", bookingPlatform: 1),
    //   BookedDateModel(bookingId: 30, date: "2025-07-04", bookingPlatform: 2),
    //   BookedDateModel(bookingId: 30, date: "2025-07-05", bookingPlatform: 1),
    //   BookedDateModel(bookingId: 31, date: "2025-10-01", bookingPlatform: 2),
    //   BookedDateModel(bookingId: 31, date: "2025-10-02", bookingPlatform: 1),
    //   BookedDateModel(bookingId: 31, date: "2025-10-03", bookingPlatform: 1),
    //   BookedDateModel(bookingId: 31, date: "2025-10-04", bookingPlatform: 1),
    //   BookedDateModel(bookingId: 31, date: "2025-10-05", bookingPlatform: 1),
    //   BookedDateModel(bookingId: 31, date: "2025-10-06", bookingPlatform: 1),
    //   BookedDateModel(bookingId: 31, date: "2025-10-07", bookingPlatform: 1),
    //   BookedDateModel(bookingId: 31, date: "2025-10-08", bookingPlatform: 1),
    //   BookedDateModel(bookingId: 31, date: "2025-10-09", bookingPlatform: 1),
    // ];

    return BlocBuilder<UnitsCubit, UnitsState>(builder: (context, state) {
      var cubit = UnitsCubit.get(context);
      return Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Padding(
            padding: EdgeInsets.only(left: 30.w),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: AppColors.text1),
              onPressed: () {
                cubit.clearBookingData();
                Navigator.pop(context);
              },
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
                    _buildNewAds(),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Title
                        Expanded(
                          child: Text(
                            cubit.bookingDetails.title ?? '',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Montserrat",
                              color: AppColors.text1,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),

                        // Unit Number
                        Row(
                          children: [
                            Text(
                              "Unit Number: ",
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Montserrat",
                                color: AppColors.text1,
                              ),
                            ),
                            Text(
                              '#${cubit.bookingDetails.propertyNumber ?? ''}',
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
                            cubit.bookingDetails.projectAddress ?? '',
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
                            cubit.bookingDetails.customerName ?? ''),
                        SizedBox(height: 10.h),
                        _buildRow(
                            Icons.bookmark_border_rounded,
                            "Booking Duration",
                            cubit.bookingDetails.checkin!.isEmpty
                                ? '--'
                                : '${cubit.bookingDetails.checkin} - ${cubit.bookingDetails.checkout}'),
                        SizedBox(height: 10.h),
                        _buildRow(
                            Icons.balance_rounded,
                            "Balance",
                            cubit.bookingDetails.checkin!.isEmpty
                                ? '--'
                                : 'EGP ${cubit.bookingDetails.balance ?? ''}',
                            Colors.red),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Divider(color: Colors.grey.shade300, thickness: 1),
                    SizedBox(height: 10.h),
                    SingleCalendarView(
                        calendarData: groupDatesWithCalendarData(
                            cubit.bookingDetails.bookedDates ?? [])),
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
                  final data =
                      UnitsCubit.get(context).bookingAccountSummaryData;

                  if (data != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BalancesScreen(
                          data,
                          false,
                          UnitsCubit.get(context).bookingDetails.id.toString(),
                        ),
                      ),
                    );
                  } else {}
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
              Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      RequestServiceScreen(
                          UnitsCubit.get(context).bookingDetails.id!.toString(),
                          UnitsCubit.get(context).bookingDetails.title ?? ''),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                ),
              );
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

  CalendarData groupDatesWithCalendarData(List<BookedDateModel> bookedDates) {
    final Map<int, Map<int, Map<int, int>>> grouped =
        {}; // year → month → day → platform
    late DateTime firstDay;
    late DateTime lastDay;
    late DateTime focusedDay;

    if (bookedDates.isEmpty) {
      final now = DateTime.now();
      final currentYear = now.year;
      final currentMonth = now.month;

      for (int month = currentMonth; month <= 12; month++) {
        grouped.putIfAbsent(currentYear, () => {});
        grouped[currentYear]![month] = {};
      }

      firstDay = DateTime(currentYear, currentMonth, 1);
      lastDay = DateTime(currentYear, 12, 31);
      focusedDay = firstDay;
    } else {
      bookedDates.sort((a, b) {
        final aDate = DateTime.parse(a.date!);
        final bDate = DateTime.parse(b.date!);
        return aDate.compareTo(bDate);
      });

      final firstDate = DateTime.parse(bookedDates.first.date!);
      final lastDate = DateTime.parse(bookedDates.last.date!);

      final startYear = firstDate.year;
      final startMonth = firstDate.month;
      final endYear = lastDate.year;
      final endMonth = lastDate.month;

      for (int year = startYear; year <= endYear; year++) {
        final int fromMonth = (year == startYear) ? startMonth : 1;
        final int toMonth = (year == endYear) ? endMonth : 12;

        for (int month = fromMonth; month <= toMonth; month++) {
          grouped.putIfAbsent(year, () => {});
          grouped[year]![month] = {};
        }
      }

      for (var dateModel in bookedDates) {
        if (dateModel.date != null) {
          final parsed = DateTime.parse(dateModel.date!);
          grouped[parsed.year]![parsed.month]![parsed.day] =
              dateModel.bookingPlatform ?? 1;
        }
      }

      firstDay = DateTime(startYear, startMonth, 1);
      lastDay = DateTime(endYear, 12, 31);
      focusedDay = firstDay;
    }

    return CalendarData(
      grouped: grouped,
      firstDay: firstDay,
      lastDay: lastDay,
      focusedDay: focusedDay,
    );
  }

  Widget _buildNewAds() {
    final PageController pageController = PageController();

    // final List<String> images = [
    //   "https://s3-alpha-sig.figma.com/img/639c/a1b5/e3f3d145eb29b908bedb581ed0b1413a?Expires=1742774400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=SWyLvoOPvmWnuSY6iiMJLOz~b-KzYfIlZ2f5BI5EMPzNXwrhMVMjysrMJj4uMWLRz-kN393jEKL1h4ZkzN6ZhIAGBzVoIX90PywrcQqbqgAJ6VM9V6FDQzaQOXZrcxBH4krXG6mJC~zJvVYu66zIer0kaz3xrgU62JL60swRuUS3iGtsLYYCWUVJDgHs1dGZWNTZ5PVvvyXbvJd6iIhn4VVUAWxp0d9oJrgQEBkzxdcsrfZBndS1Ysv0W6OJznuO5hB~uVqx3R0Ck~uKqfht~H6RQHxanw426C5sla-IHm0iZbVfOkOvkJHiwQRHN459768lkyFEwO-2ipc3bM~GCg__",
    //   "https://s3-alpha-sig.figma.com/img/639c/a1b5/e3f3d145eb29b908bedb581ed0b1413a?Expires=1742774400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=SWyLvoOPvmWnuSY6iiMJLOz~b-KzYfIlZ2f5BI5EMPzNXwrhMVMjysrMJj4uMWLRz-kN393jEKL1h4ZkzN6ZhIAGBzVoIX90PywrcQqbqgAJ6VM9V6FDQzaQOXZrcxBH4krXG6mJC~zJvVYu66zIer0kaz3xrgU62JL60swRuUS3iGtsLYYCWUVJDgHs1dGZWNTZ5PVvvyXbvJd6iIhn4VVUAWxp0d9oJrgQEBkzxdcsrfZBndS1Ysv0W6OJznuO5hB~uVqx3R0Ck~uKqfht~H6RQHxanw426C5sla-IHm0iZbVfOkOvkJHiwQRHN459768lkyFEwO-2ipc3bM~GCg__",
    //   "https://s3-alpha-sig.figma.com/img/639c/a1b5/e3f3d145eb29b908bedb581ed0b1413a?Expires=1742774400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=SWyLvoOPvmWnuSY6iiMJLOz~b-KzYfIlZ2f5BI5EMPzNXwrhMVMjysrMJj4uMWLRz-kN393jEKL1h4ZkzN6ZhIAGBzVoIX90PywrcQqbqgAJ6VM9V6FDQzaQOXZrcxBH4krXG6mJC~zJvVYu66zIer0kaz3xrgU62JL60swRuUS3iGtsLYYCWUVJDgHs1dGZWNTZ5PVvvyXbvJd6iIhn4VVUAWxp0d9oJrgQEBkzxdcsrfZBndS1Ysv0W6OJznuO5hB~uVqx3R0Ck~uKqfht~H6RQHxanw426C5sla-IHm0iZbVfOkOvkJHiwQRHN459768lkyFEwO-2ipc3bM~GCg__",
    // ];

    return Column(
      children: [
        Container(
          height: 160.h,
          decoration: BoxDecoration(
            color: const Color(0xFFF0F4F5),
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 5)],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: PageView.builder(
              controller: pageController,
              itemCount:
                  UnitsCubit.get(context).bookingDetails.gallery?.length ?? 0,
              itemBuilder: (context, index) {
                return CachedNetworkImage(
                  imageUrl: UnitsCubit.get(context)
                          .bookingDetails
                          .gallery
                          ?.elementAt(index)
                          .m ??
                      '',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  placeholder: (context, url) => Container(
                    color: Colors.grey[300],
                    child: const Center(child: CircularProgressIndicator()),
                  ),
                  errorWidget: (context, url, error) => Container(
                    color: Colors.grey[300],
                    child: Center(
                      child: Icon(Icons.error, color: Colors.red, size: 30.w),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        SizedBox(height: 16.h),
        SmoothPageIndicator(
          controller: pageController,
          count: UnitsCubit.get(context).bookingDetails.gallery?.length ?? 0,
          effect: JumpingDotEffect(
            dotHeight: 10.h,
            dotWidth: 10.w,
            activeDotColor:
                AppColors.primary, // Replace with AppColors.primary if defined
            dotColor: const Color.fromARGB(255, 218, 216, 216),
          ),
        ),
      ],
    );
  }
}
