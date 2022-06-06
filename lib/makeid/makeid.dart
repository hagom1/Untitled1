import 'package:flutter/material.dart';
import '../util/constants.dart';

class MAKEIDtf extends StatelessWidget {
  const MAKEIDtf({Key? key, required this.tec,}) : super(key: key);

  final tec;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: tec,
      decoration: InputDecoration(
          icon: Icon(
            Icons.mail,
            color: kPrimaryColor,
          ),
          hintText: "이메일",
          border: InputBorder.none),
    );
  }
}
