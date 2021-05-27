import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends HookWidget {
  final ValueNotifier<DateTime> _selectedDay;

  CalendarWidget(this._selectedDay);

  final ValueNotifier<DateTime> _focusedDay = useState(DateTime.now());
  final ValueNotifier<CalendarFormat> _calendarFormat =
      useState(CalendarFormat.month);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: TableCalendar(
        locale: 'ja_JP',
        firstDay: DateTime.utc(2010, 10, 16),
        lastDay: DateTime.utc(2030, 3, 14),
        focusedDay: _focusedDay.value,
        calendarFormat: _calendarFormat.value,
        onFormatChanged: (format) => _calendarFormat.value = format,
        selectedDayPredicate: (day) => isSameDay(_selectedDay.value, day),
        onDaySelected: (selectedDay, focusedDay) {
          if (!isSameDay(_selectedDay.value, selectedDay)) {
            _selectedDay.value = selectedDay;
            _focusedDay.value = focusedDay;
          }
        },
      ),
    );
  }
}
