import 'package:flutter/material.dart';

class HomeNavigation extends StatelessWidget {
  const HomeNavigation({
    Key? key,
    required this.currentIndex,
  }) : super(key: key);

  final ValueNotifier<int> currentIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex.value,
      onTap: (index) => currentIndex.value = index,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          label: 'Calendar',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat_outlined),
          label: 'Chat',
        ),
      ],
    );
  }
}
