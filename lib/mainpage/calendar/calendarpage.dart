
import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled1/login/loginpage.dart';
import 'package:untitled1/mainpage/calendar/diary/diarypage.dart';
import 'package:untitled1/util/logout.dart';
import 'package:untitled1/util/settingpage.dart';

import 'event.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../util/constants.dart';
import 'diary/draw2/drawingpage2.dart';

class calendarpage extends StatefulWidget {
  const calendarpage({Key? key,this.imgdata,this.diarytt,this.diarytxt}) : super(key: key);
  final String? imgdata;
  final String? diarytt;
  final String? diarytxt;

  @override
  State<calendarpage> createState() => _calendarpageState();
}

class _calendarpageState extends State<calendarpage> {


  Uint8List convertStringToUint8List(String str) {
    final List<int> codeUnits = str.codeUnits;
    final Uint8List unit8List = Uint8List.fromList(codeUnits);
    return unit8List;
  }

  final List<String> diarytitle = <String>[];
  final List<String> diarytext = <String>[];
  // final List<String> diaryimg =<String>[];

  late String diarytitle2;
  late String diarytext2;
  // late String diaryimg2;


  void addDiaryToList(){
    setState(() {
      diarytitle.insert(0,diarytitle2);
      diarytext.insert(0,diarytext2);
      // diaryimg.insert(0,diaryimg2);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Uint8List imgdata8list = convertStringToUint8List(diaryimg2);
    return Scaffold(
      drawer: Drawer(
        // 메뉴바
        backgroundColor: Colors.indigo[100],
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                child: Text('메뉴',style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 30)),
              decoration: BoxDecoration(
                color: Colors.indigo[300],
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20)
                )
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.deepPurple[900],
              ),
              title: Text('설정'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => settingpage()),
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.power_settings_new,
                color: Colors.deepPurple[900],
              ),
              title: Text('로그아웃'),
              onTap: () {
                logout(context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 10,
        title: Text('일기장'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.check),
              onPressed: () {
                addDiaryToList();
              })
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: diarytitle.length,
                itemBuilder: (BuildContext context,int index){
                  return ListTile(
                    title: Text(diarytitle[index]),
                    subtitle: Text(diarytext[index]),
                    // leading: Image.memory(imgdata8list,fit: BoxFit.fill,),
                  );
                },
              )
            )],
        ),
      ),
      ),
      floatingActionButton: FloatingActionButton.extended(
      onPressed: () async {
        final value = await Get.to(() => diarypage());
        setState((){
          // diaryimg2 = value[0];
          diarytitle2 = value[1];
          diarytext2 = value[2];
        });
        // print(diaryimg2);
        print(diarytitle2);
        print(diarytext2);
      },
      label: const Text('작성'),
      icon: const Icon(Icons.create),
      backgroundColor: Colors.deepPurple[800],
    ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      );
  }
}
