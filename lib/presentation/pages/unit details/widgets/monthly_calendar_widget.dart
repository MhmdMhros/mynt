import 'package:flutter/material.dart';
import 'package:mynt/core/resources/colors_manager.dart';
import 'package:mynt/domain/entities/calender_data.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SingleCalendarView extends StatelessWidget {
  final CalendarData calendarData;

  const SingleCalendarView({
    super.key,
    required this.calendarData,
  });

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: calendarData.firstDay,
      lastDay: calendarData.lastDay,
      focusedDay: calendarData.focusedDay,
      calendarFormat: CalendarFormat.month,
      headerStyle: const HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
      ),
      calendarStyle: const CalendarStyle(
        todayDecoration: BoxDecoration(
          color: AppColors.primary,
          shape: BoxShape.circle,
        ),
      ),
      calendarBuilders: CalendarBuilders(
        defaultBuilder: (context, date, _) {
          final year = date.year;
          final month = date.month;
          final day = date.day;

          final isHighlighted =
              calendarData.grouped[year]?[month]?.contains(day) ?? false;

          return Container(
            width: 40.w,
            height: 40.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isHighlighted
                  ? const Color.fromARGB(255, 129, 195, 204)
                  : Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: Text(
              '$day',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: const Color(0xFF0B3A41),
                fontSize: 14.sp,
              ),
            ),
          );
        },
      ),
    );
  }
}
