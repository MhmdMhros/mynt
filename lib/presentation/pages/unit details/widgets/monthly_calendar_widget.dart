import 'package:flutter/material.dart';
import 'package:mynt/core/resources/colors_manager.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SingleCalendarView extends StatefulWidget {
  final Map<int, Map<int, List<int>>> highlightedDays;

  const SingleCalendarView({super.key, required this.highlightedDays});

  @override
  State<SingleCalendarView> createState() => _SingleCalendarViewState();
}

class _SingleCalendarViewState extends State<SingleCalendarView> {
  DateTime? _focusedDay;
  DateTime? _firstDay;
  DateTime? _lastDay;

  @override
  void initState() {
    super.initState();

    final months = <DateTime>[];

    widget.highlightedDays.forEach((year, monthMap) {
      monthMap.forEach((month, _) {
        months.add(DateTime(year, month));
      });
    });

    months.sort((a, b) => a.compareTo(b));

    if (months.isNotEmpty) {
      _firstDay = DateTime(months.first.year, months.first.month, 1);
      _lastDay = DateTime(months.last.year, months.last.month + 1, 0);
      _focusedDay = _firstDay;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_firstDay == null || _lastDay == null || _focusedDay == null) {
      return Container();
    }

    return TableCalendar(
      firstDay: _firstDay!,
      lastDay: _lastDay!,
      focusedDay: _focusedDay!,
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
              widget.highlightedDays[year]?[month]?.contains(day) ?? false;

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
              '${date.day}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: const Color(0xFF0B3A41),
                fontSize: 14.sp,
              ),
            ),
          );
        },
      ),
      onPageChanged: (focusedDay) {
        setState(() {
          _focusedDay = focusedDay;
        });
      },
    );
  }
}
