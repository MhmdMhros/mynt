class CalendarData {
  final Map<int, Map<int, List<int>>> grouped;
  final DateTime firstDay;
  final DateTime lastDay;
  final DateTime focusedDay;

  CalendarData({
    required this.grouped,
    required this.firstDay,
    required this.lastDay,
    required this.focusedDay,
  });
}
