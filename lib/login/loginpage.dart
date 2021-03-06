import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled1/mainpage/calendar/calendarpage.dart';
import 'package:untitled1/mainpage/calendar/diary/draw2/drawingpage2.dart';
import 'package:untitled1/makeid/makeidpage.dart';
import '../login/loginid.dart';
import '../login/loginpw.dart';

//로그인 페이지
class loginpage extends StatefulWidget {
  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  var _idTEC = TextEditingController();
  var _pwTEC = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/IMG_0010.jpg")
            )
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: EdgeInsets.all(50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Login",
                    style: TextStyle(fontSize: 24),
                  ),
                  IDtf(tec: _idTEC), //id 입력 텍스트 컨트롤러
                  PWtf(tec: _pwTEC), // pw 입력 텍스트 컨트롤러
                  //로그인 버튼
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 123),
                        //로그인 버튼
                        child: ElevatedButton(
                          onPressed: () { // 메인 페이지로 이동
                            Get.off(calendarpage());
                          },
                          child: Text("Login"),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            primary: Colors.deepPurple[400],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 35),
                        //회원가입 버튼
                        child: TextButton(
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MAKEID()),
                            );
                          },
                          child: Text('회원가입'),
                          style: ElevatedButton.styleFrom(
                            onPrimary: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
        ),
      ),
    );
  }
}