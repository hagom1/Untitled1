import 'package:flutter/material.dart';
import 'package:untitled1/util/constants.dart';
import '../main.dart';

class settingpage extends StatefulWidget {
  const settingpage({Key? key}) : super(key: key);

  @override
  State<settingpage> createState() => _settingpageState();
}

class _settingpageState extends State<settingpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('설정'),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        elevation: 10,
      ),
      body: const Center(
          child:
          Text('다크모드 설정')
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.lightbulb),
        onPressed: (){
          MyApp.themeNotifier.value =
          MyApp.themeNotifier.value == ThemeMode.light
              ? ThemeMode.dark
              :ThemeMode.light;
        },
        backgroundColor: kPrimaryColor,
      ),
    );
  }
}
