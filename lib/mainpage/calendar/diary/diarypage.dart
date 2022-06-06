import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:untitled1/mainpage/calendar/calendarpage.dart';
import 'package:untitled1/util/constants.dart';

import 'draw2/drawingpage2.dart';


class diarypage extends StatefulWidget {
  const diarypage({Key? key,this.imgdata}) : super(key: key);
  final String? imgdata;

  @override
  State<diarypage> createState() => _diarypageState();
}

class _diarypageState extends State<diarypage> {

  Uint8List convertStringToUint8List(String str) {
    final List<int> codeUnits = str.codeUnits;
    final Uint8List unit8List = Uint8List.fromList(codeUnits);
    return unit8List;
  }

  @override
  Widget build(BuildContext context) {
    Uint8List imgdata8list = convertStringToUint8List('${widget.imgdata}');
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 50,left: 20,right: 20),
              child: TextField(
                decoration: InputDecoration(
                  labelText: '제목',
                  labelStyle: TextStyle(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: kPrimaryColor),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: kPrimaryColor)
                  ),
                  hintText: '일기 제목을 입력하세요.',
                ),
                maxLines: 2,
              ),
            ),
            SizedBox(height: 10,),
            Container(
              width: 300,
              color: kPrimaryColor,
              child: Image.memory(
                imgdata8list,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 2),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => drawingpage()),
                  );
                },
                child: Text('그림 그리기'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  primary: kPrimaryColor,
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 20,right: 20,bottom: 20),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '일기',
                    labelStyle: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                    ),
                    hintText: '일기 작성',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor)
                    )
                  ),
                  maxLines: 18,
                  onTap: (){

                  },
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
      onPressed: () {
        Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => calendarpage()),
        );
      },
      label: const Text('완료'),
      icon: const Icon(Icons.check),
      backgroundColor: kPrimaryColor,
    ),
    );
  }
}
