import 'package:flutter/material.dart';
import '../login/loginpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static final ValueNotifier<ThemeMode> themeNotifier=ValueNotifier(ThemeMode.light);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (_, ThemeMode currentMode, __){
          return MaterialApp(
            title: '설정',
            debugShowCheckedModeBanner: false,
            darkTheme: ThemeData.dark(),
            themeMode: currentMode,
            home: loginpage(),
          );
        }
    );
  }
}
