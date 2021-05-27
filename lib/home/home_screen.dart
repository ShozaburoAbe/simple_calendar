import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:simple_calendar/calendar/calendar_widget.dart';

import 'home_navigation.dart';

class HomeScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int> currentIndex = useState(0);

    return Scaffold(
      bottomNavigationBar: HomeNavigation(currentIndex: currentIndex),
      body: currentIndex.value == 0
          ? CalendarWidget()
          : Container(
              color: Colors.green,
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.create),
      ),
    );
  }
}
