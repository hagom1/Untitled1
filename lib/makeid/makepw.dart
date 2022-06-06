import 'package:flutter/material.dart';
import '../util/constants.dart';

class MAKEPWtf extends StatelessWidget {
  const MAKEPWtf({Key? key, required this.tec,}) : super(key: key);

  final tec;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: tec,
      decoration: InputDecoration(
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          hintText: "비밀번호",
          border: InputBorder.none),
    );
  }
}
