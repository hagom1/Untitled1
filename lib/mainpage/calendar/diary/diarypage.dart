import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled1/mainpage/calendar/calendarpage.dart';
import 'package:untitled1/util/constants.dart';
import '../calendarpage.dart';
import 'draw2/drawingpage2.dart';

class diarypage extends StatefulWidget {
  const diarypage({Key? key,this.imgdata}) : super(key: key);
  final String? imgdata;

  @override
  State<diarypage> createState() => _diarypageState();
}

class _diarypageState extends State<diarypage> {

  TextEditingController diarytitle = TextEditingController();
  TextEditingController diarytext = TextEditingController();

  Uint8List convertStringToUint8List(String str) {
    final List<int> codeUnits = str.codeUnits;
    final Uint8List unit8List = Uint8List.fromList(codeUnits);
    return unit8List;
  }

  String _pickerDate='달력 아이콘을 눌러주세요.';

  Future<void> _openDatePicker(BuildContext context) async{
    final DateTime? d = await showDatePicker(context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime(2025));
    if(d != null){
      setState((){
        _pickerDate = "${d.year.toString()}년 ${d.month.toString()}월 ${d.day.toString()}일";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Uint8List imgdata8list = convertStringToUint8List('${widget.imgdata}');
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 25,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text(
                    _pickerDate,
                     style: TextStyle(
                       fontWeight: FontWeight.bold,
                       fontSize: 18,
                       color: kPrimaryColor
                     ),
              ),
                   IconButton(
                     icon: Icon(Icons.calendar_today_outlined,
                         color: kPrimaryColor),
                     onPressed: (){
                       _openDatePicker(context);
                     },
                   ),
                 ],
               ),
            Padding(
              padding: EdgeInsets.only(left: 20,right: 20),
              child: TextField(
                controller: diarytitle,
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
                  controller: diarytext,
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
                  maxLines: 13,
                  onTap: (){

                  },
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
      onPressed: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => calendarpage(imgdata: '${widget.imgdata}',
        //   diarytt: diarytitle.text,
        //   diarytxt: diarytext.text,)),
        // );
        Get.back(result: [widget.imgdata,diarytitle.text,diarytext.text]);
      },
      label: const Text('완료'),
      icon: const Icon(Icons.check),
      backgroundColor: kPrimaryColor,
    ),
    );
  }

}
