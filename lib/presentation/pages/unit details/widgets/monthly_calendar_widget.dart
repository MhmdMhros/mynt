import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MonthlyCalendar extends StatelessWidget {
  final Map<int, List<int>> highlightedDays; // Map of month -> highlighted days

  const MonthlyCalendar({super.key, required this.highlightedDays});

  @override
  Widget build(BuildContext context) {
    final int currentYear = DateTime.now().year;

    return SingleChildScrollView(
      child: Column(
        children: List.generate(12, (index) {
          DateTime firstDayOfMonth = DateTime(currentYear, index + 1, 1);
          DateTime lastDayOfMonth = DateTime(currentYear, index + 2, 0);

          return Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${_monthName(index + 1)}.$currentYear",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  TableCalendar(
                    firstDay: firstDayOfMonth,
                    lastDay: lastDayOfMonth,
                    focusedDay: firstDayOfMonth,
                    calendarFormat: CalendarFormat.month,
                    headerVisible: false,
                    daysOfWeekVisible: true,
                    rowHeight: 35.h, // Adjust row height for better visibility
                    calendarStyle: CalendarStyle(
                      defaultTextStyle: TextStyle(
                        fontSize: 14.sp,
                      ),
                      todayDecoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.5),
                        shape: BoxShape.circle,
                      ),
                    ),
                    calendarBuilders: CalendarBuilders(
                      defaultBuilder: (context, date, _) {
                        bool isHighlighted =
                            highlightedDays[date.month]?.contains(date.day) ??
                                false;

                        return Container(
                          width: 26.w,
                          height: 26.h,
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
                              fontSize: 14.sp,
                              color: const Color(0xFF0B3A41),
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
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
