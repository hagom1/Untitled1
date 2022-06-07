import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_drawing_board/flutter_drawing_board.dart';
import 'package:untitled1/mainpage/calendar/diary/diarypage.dart';
import 'package:untitled1/util/constants.dart';

import '../../calendarpage.dart';

class drawingpage extends StatefulWidget {
  const drawingpage({Key? key}) : super(key: key);

  @override
  State<drawingpage> createState() => _drawingpageState();
}

class _drawingpageState extends State<drawingpage> {
  final DrawingController _drawingController = DrawingController();

  void _getImageData() async {
    final Uint8List? data = (await _drawingController.getImageData())?.buffer.asUint8List();
    final String dataSt = new String.fromCharCodes(data!);

    showDialog<void>(
        context: context,
        builder: (BuildContext c)=>
            AlertDialog(
              content: Text('그림을 저장합니다.'),
              actions: [
                TextButton(
                  child: Text('예'),
                  onPressed: () async{
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                    await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => diarypage(imgdata: dataSt,)),
                    );

                  },
                )
              ],
            )

    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('그림'),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.check),
              onPressed: () {
                _getImageData();
              })
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: DrawingBoard(// 드로잉 보드 패키지
                controller: _drawingController,
                background:
                Container(width: 400, height: 400, color: Colors.orange[50]),
                showDefaultActions: true,
                showDefaultTools: true,
              ))
        ],
      ),
    );
  }
}
