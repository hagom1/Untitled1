import 'package:flutter/material.dart';
import '../util/constants.dart';

class MAKEPWCHKtf extends StatelessWidget {
  const MAKEPWCHKtf({Key? key, required this.tec,}) : super(key: key);

  final tec;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: tec,
      decoration: InputDecoration(
          icon: Icon(
            Icons.check,
            color: kPrimaryColor,
          ),
          hintText: "비밀번호 확인",
          border: InputBorder.none),
    );
  }
}
