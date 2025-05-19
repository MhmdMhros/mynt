// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynt/core/common/pagination/build_paged_list_view.dart';
import 'package:mynt/core/resources/colors_manager.dart';
import 'package:mynt/domain/entities/booking.dart';
import 'package:mynt/presentation/pages/unit%20details/unit_details_screen.dart';
import 'package:mynt/presentation/pages/units/cubit/units_cubit.dart';

class UnitsScreen extends StatefulWidget {
  const UnitsScreen({super.key});

  @override
  State<UnitsScreen> createState() => _UnitsScreenState();
}

class _UnitsScreenState extends State<UnitsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UnitsCubit, UnitsState>(builder: (context, state) {
      var cubit = UnitsCubit.get(context);
      return Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: const Text(""),
          elevation: 0,
          title: Text(
            "Units",
            style: TextStyle(
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
              color: AppColors.text1,
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Total Units ${cubit.total}",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w600,
                    color: AppColors.text1,
                  ),
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              Expanded(
                child: BuildPagedListView(
                  pagingController: cubit.pagingController,
                  fetchData: (page, limit) => cubit.getUnits(page, limit),
                  disposeController: false,
                  buildItem: (item, index) {
                    final unit = item as Booking;
                    return Padding(
                      padding: EdgeInsets.only(bottom: 16.h),
                      child: _buildUnitContainer(unit),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildUnitContainer(Booking unit) {
    return InkWell(
      onTap: () async {
        await UnitsCubit.get(context)
            .fetchBookingAccountSummary(unit.id.toString());
        if (!context.mounted) return;
        Navigator.of(context).push(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                UnitDetailsScreen(unit),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              ); // Uses a smoother transition
            },
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 24.r,
                  backgroundImage: CachedNetworkImageProvider(
                      unit.gallery == null || unit.gallery!.isEmpty
                          ? ''
                          : unit.gallery!.first),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              unit.title ?? '',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.sp,
                                fontFamily: "Montserrat",
                              ),
                            ),
                          ),
                          SizedBox(width: 8.w),
                          if (unit.bookedDates!.isNotEmpty)
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.w, vertical: 5.h),
                              decoration: BoxDecoration(
                                color: const Color(0xFFE9F9FB),
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Text(
                                'RENTED',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: const Color(0xFF0F525B),
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Montserrat",
                                ),
                              ),
                            ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Unit ID: ",
                            style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 10.sp,
                              fontFamily: "Montserrat",
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            '#${unit.bookingId.toString()}',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Montserrat",
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            _buildRow(
                Icons.bookmark_border_rounded,
                "Booking Duration    ",
                unit.checkin!.isEmpty
                    ? '--'
                    : '${unit.checkin} - ${unit.checkout}'),
            SizedBox(height: 10.h),
            _buildRow(
                Icons.balance_rounded,
                "Balance      ",
                unit.checkin!.isEmpty ? '--' : 'EGP ${unit.balance ?? ''}',
                Colors.red),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(IconData icon, String label, String value,
      [Color? valueColor]) {
    return Row(
      children: [
        Icon(icon, size: 15.sp, color: Colors.grey),
        SizedBox(width: 8.w),
        Expanded(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12.sp,
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 12.sp,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w600,
            color: valueColor ?? Colors.black,
          ),
        ),
      ],
    );
  }
}
