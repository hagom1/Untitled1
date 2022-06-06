
import 'dart:typed_data';
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
  const calendarpage({Key? key,this.imgdata}) : super(key: key);
  final String? imgdata;

  @override
  State<calendarpage> createState() => _calendarpageState();
}

class _calendarpageState extends State<calendarpage> {
  late Map<DateTime,List<Event>> selectedEvents;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  TextEditingController diarytitle = TextEditingController();
  TextEditingController diarytext = TextEditingController();

  @override
  void initState() {
    selectedEvents = {};
    super.initState();
  }

  List<Event> calendarEvents(DateTime date) {
    return selectedEvents[date] ?? [];
  }

  @override
  void dispose(){
    diarytext.dispose();
    diarytitle.dispose();
    super.dispose();
  }

  Uint8List convertStringToUint8List(String str) {
    final List<int> codeUnits = str.codeUnits;
    final Uint8List unit8List = Uint8List.fromList(codeUnits);
    return unit8List;
  }

  @override
  Widget build(BuildContext context) {
    Uint8List imgdata8list = convertStringToUint8List('${widget.imgdata}');
    var _image = MemoryImage(imgdata8list);
    return Scaffold(
      drawer: Drawer(
        // 메뉴바
        backgroundColor: Colors.indigo[200],
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                child: Text('메뉴',style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 30)),
              decoration: BoxDecoration(
                color: Colors.indigo[400],
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
          IconButton( // 달력 이벤트
              icon: const Icon(Icons.autorenew),
              onPressed: () {

              }
              )
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
        child: Column(
          children: [
            // SizedBox(height: 20,),
            TableCalendar(
              daysOfWeekHeight: 30,
              focusedDay: focusedDay,
              firstDay: DateTime(2020),
              lastDay: DateTime(2050),
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                titleTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17
                )
                ),
              calendarBuilders: CalendarBuilders(
                dowBuilder: (context, day) {
                  switch(day.weekday){
                    case 1:
                      return Center(child: Text('월',
                      style: TextStyle(fontSize: 17,
                        fontWeight: FontWeight.bold
                      ),),);
                    case 2:
                      return Center(child: Text('화',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold
                        ),),);
                    case 3:
                      return Center(child: Text('수',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold
                        ),),);
                    case 4:
                      return Center(child: Text('목',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold
                        ),),);
                    case 5:
                      return Center(child: Text('금',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold
                        ),),);
                    case 6:
                      return Center(
                          child: Text('토',
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          )
                      );
                    case 7:
                      return Center(child: Text('일',
                        style: TextStyle(
                            fontSize: 17,
                          color: Colors.red,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      );
                  }
                },
              ),
              onDaySelected: (DateTime selectDay, DateTime focusDay) {
                setState(() {
                  selectedDay = selectDay;
                  focusedDay = focusDay;
                });
                print(focusedDay);
              },
              //날짜 선택 모션
              selectedDayPredicate: (DateTime date) {
                return isSameDay(selectedDay, date);
              },
              daysOfWeekStyle: DaysOfWeekStyle(
                weekdayStyle: TextStyle(
                  fontWeight: FontWeight.bold
                )
              ),
              eventLoader: calendarEvents,
              ),
            ...calendarEvents(selectedDay).map((Event event) => ListTile(title: Text(event.title),)),
            SizedBox(height: 5),
            Container(
              child: Row(
              //   children: [
              //     Padding(
              //       padding: const EdgeInsets.all(15.0),
              //       child: Image.memory(
              //         imgdata8list,
              //         width: 150,
              //         height: 150,
              //       ),
              //     ),
              //     Text('data')
              //   ],
              // ),

              // padding: EdgeInsets.only(left: 30),
              // width: MediaQuery.of(context).size.width,
              // height: MediaQuery.of(context).size.height*0.55,
              // decoration: BoxDecoration(
              //   color: kPrimaryColor,
              //   borderRadius: BorderRadius.only(
              //     topLeft: Radius.circular(20),
              //     topRight: Radius.circular(20)
              //   )
              // ),
            ),
            )],
        ),
      ),
      ),
      floatingActionButton: FloatingActionButton.extended(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => diarypage()),
        );
      },
      label: const Text('작성'),
      icon: const Icon(Icons.create),
      backgroundColor: Colors.deepPurple[800],
    ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      );
  }
}
