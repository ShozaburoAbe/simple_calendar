import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends HookWidget {
  final List<Map<DateTime, String>> _memoList;
  final ValueNotifier<DateTime> _selectedDay;

  CalendarWidget(this._selectedDay, this._memoList);

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<DateTime> _focusedDay = useState(DateTime.now());
    final ValueNotifier<CalendarFormat> _calendarFormat =
        useState(CalendarFormat.month);
    final ValueNotifier<Map<DateTime, String>> _filteredMemoList = useState({});

    return SafeArea(
      child: Column(
        children: [
          TableCalendar(
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
          Expanded(
            child: ListView(
              children: [
                for (final Map<DateTime, String> memo in _memoList)
                  // ignore: unnecessary_null_comparison
                  if (memo[_selectedDay.value] != null)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: ListTile(
                          leading: FlutterLogo(),
                          title: Text(memo[_selectedDay.value].toString()),
                        ),
                      ),
                    ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
