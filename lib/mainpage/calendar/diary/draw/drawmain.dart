import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/mainpage/calendar/diary/draw/screens/drawing_page/drawing_page.dart';
import 'package:untitled1/mainpage/calendar/diary/draw/screens/drawing_page/local_utils/DrawingProvider.dart';

class Drawpage extends StatelessWidget {
  const Drawpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DrawingProvider(),
      child: Drawingpage(),
    );
  }
}
