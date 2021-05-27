import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simple_calendar/intro/intro_slider_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: Main(),
    );
  }
}

class Main extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (context) {
        return IntroSliderScreen();
      }),
    );
  }
}

// https://levelup.gitconnected.com/firebase-authentication-and-keeping-users-logged-in-with-provider-in-flutter-f1c66cdb1bc7
// https://dribbble.com/shots/14340649-Task-Management-App-Design
// https://medium.com/flutter-community/flutter-scalable-folder-files-structure-8f860faafebd
// https://www.refactord.com/guides/riverpod-state-management-explained
