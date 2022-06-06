import 'package:flutter/material.dart';
import 'package:untitled1/login/loginpage.dart';

void logout(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          // 알림창 라운드 처리
            borderRadius: BorderRadius.circular(8.0)),
        title: Text("알림"),
        content: Text("로그아웃 하시겠습니까?"),
        actions: <Widget>[
          new FlatButton(
            child: Text("예"),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => loginpage()),
              );
            },
          ),
          new FlatButton(
            child: Text('아니오'),
            onPressed: () {
              Navigator.pop(context); //알림창 끄기
            },
          )
        ],
      );
    },
  );
}