import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:simple_calendar/calendar/calendar_memo.dart';
import 'package:simple_calendar/calendar/calendar_widget.dart';

import 'home_navigation.dart';

class HomeScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int> currentIndex = useState(0);
    final ValueNotifier<List<Map<DateTime, String>>> memoList = useState([]);
    final ValueNotifier<DateTime> _selectedDay = useState(DateTime.now());

    return Scaffold(
      bottomNavigationBar: HomeNavigation(currentIndex: currentIndex),
      body: currentIndex.value == 0
          ? CalendarWidget(_selectedDay)
          : Container(
              color: Colors.green,
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final memo = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CalendarMemo(_selectedDay),
            ),
          );
          if (memo != null) {
            memoList.value.add(memo);
          }
        },
        child: Icon(Icons.create),
      ),
    );
  }
}
