import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_drawing_board/flutter_drawing_board.dart';
import 'package:untitled1/util/constants.dart';

class drawingpage extends StatefulWidget {
  const drawingpage({Key? key}) : super(key: key);

  @override
  State<drawingpage> createState() => _drawingpageState();
}

class _drawingpageState extends State<drawingpage> {

  final DrawingController _drawingController = DrawingController();

  //그림을 그린 이미지 값 변환 함수
  void _getImageData() async {
    final Uint8List? data = (await _drawingController.getImageData())?.buffer.asUint8List();
    final String dataSt = new String.fromCharCodes(data!);
    print(data);

    showDialog<void>(
        context: context,
        builder: (BuildContext c)=>
            AlertDialog(
              content: Text('그림을 저장합니다.'),
              actions: [
                TextButton(
                  child: Text('예'),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context,dataSt);
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
          //체크 아이콘 누르면 _getImageData 함수 실행
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
              child: DrawingBoard(// 드로잉 보드
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
