import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';

class CalendarMemo extends HookWidget {
  final ValueNotifier<DateTime> _selectedDate;
  final DateFormat formatter = DateFormat('yyyy-MM-dd');

  CalendarMemo(this._selectedDate);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(formatter.format(_selectedDate.value)),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              '完了',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: TextField(
        maxLines: 50,
      ),
    );
  }
}
