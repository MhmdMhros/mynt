import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class YearlyCalendar extends StatelessWidget {
  final Map<int, List<int>> highlightedDays; // Month -> Highlighted days

  const YearlyCalendar({super.key, required this.highlightedDays});

  @override
  Widget build(BuildContext context) {
    final int currentYear = DateTime.now().year;

    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(), // Smooth scrolling
      itemCount: 12,
      itemBuilder: (context, index) {
        final DateTime firstDayOfMonth = DateTime(currentYear, index + 1, 1);
        final DateTime lastDayOfMonth = DateTime(currentYear, index + 2, 0);

        return Padding(
          padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
          child: Container(
            width: double.infinity, // Make it responsive
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 5.r,
                  spreadRadius: 2.r,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  _monthName(index + 1),
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TableCalendar(
                  firstDay: firstDayOfMonth,
                  lastDay: lastDayOfMonth,
                  focusedDay: firstDayOfMonth,
                  calendarFormat: CalendarFormat.month,
                  headerVisible: false,
                  daysOfWeekVisible: true,
                  rowHeight: 28.h,
                  calendarStyle: CalendarStyle(
                    defaultTextStyle: TextStyle(fontSize: 12.sp),
                    todayDecoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.4),
                      shape: BoxShape.circle,
                    ),
                  ),
                  calendarBuilders: CalendarBuilders(
                    defaultBuilder: (context, date, _) {
                      final bool isHighlighted =
                          highlightedDays[date.month]?.contains(date.day) ??
                              false;

                      return Container(
                        width: 24.w,
                        height: 24.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: isHighlighted
                              ? const Color(0xFFE7EEEF)
                              : Colors.transparent,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          '${date.day}',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  /// Returns month name from month number
  String _monthName(int month) {
    const List<String> months = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December"
    ];
    return months[month - 1];
  }
}
