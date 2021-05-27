import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: TableCalendar(
        locale: 'ja_JP',
        firstDay: DateTime.utc(2010, 10, 16),
        lastDay: DateTime.utc(2030, 3, 14),
        focusedDay: DateTime.now(),
      ),
    );
  }
}
