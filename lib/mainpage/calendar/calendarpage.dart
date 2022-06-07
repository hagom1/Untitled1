import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled1/mainpage/calendar/diary/diarypage.dart';
import 'package:untitled1/mainpage/calendar/diary/viewdiarypage.dart';
import 'package:untitled1/util/logout.dart';
import 'package:untitled1/util/settingpage.dart';
import 'package:flutter/material.dart';
import '../../util/constants.dart';

class calendarpage extends StatefulWidget {
  const calendarpage({Key? key}) : super(key: key);
  @override
  State<calendarpage> createState() => _calendarpageState();
}

class _calendarpageState extends State<calendarpage> {


  Uint8List convertStringToUint8List(String str) {
    final List<int> codeUnits = str.codeUnits;
    final Uint8List unit8List = Uint8List.fromList(codeUnits);
    return unit8List;
  }

  final List<String?> diarytitle = <String>[];
  final List<String?> diarytext = <String>[];
  final List<String> diaryimg =<String>[];

  late String? diarytitle2;
  late String? diarytext2;
  late String imgdata3;
  void initState(){
    imgdata3='';
    super.initState();
  }
  void addDiaryToList(){
    setState(() {
      diarytitle.insert(0,diarytitle2);
      diarytext.insert(0,diarytext2);
      diaryimg.insert(0,imgdata3);
    });
  }

  @override
  Widget build(BuildContext context) {
    Uint8List imgdata8list = convertStringToUint8List(imgdata3);
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
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              Container(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: diarytitle.length,
                  itemBuilder: (BuildContext context,int index){
                    return Card(
                      color: kPrimaryColor,
                      elevation: 5,
                      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => viewdiarypage(viewtitle: diarytitle[index],viewtext: diarytext[index],)),
                          );
                        },
                        child:SingleChildScrollView (
                          scrollDirection: Axis.horizontal,
                          child:Row(
                          children: [
                            Image.memory(
                              imgdata8list,
                              width: 150,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 20,
                                  width: 180,
                                  margin: const EdgeInsets.fromLTRB(20.0, 10.0, 0.0, 20.0),
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    diarytitle[index]!,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 180,
                                  margin: const EdgeInsets.fromLTRB(20.0, 5.0, 0.0, 20.0),
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    diarytext[index]!,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),)
                      ),
                    );
                  },
                ),
              )
            ],
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
          imgdata3=value[0];
        });
        addDiaryToList();
        if(value != null) {
          // print(diaryimg2);
          print(diarytitle2);
          print(diarytext2);
        }
      },
      label: const Text('작성'),
      icon: const Icon(Icons.create),
      backgroundColor: Colors.deepPurple[800],
    ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      );
  }
}
