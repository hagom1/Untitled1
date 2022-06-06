import 'package:flutter/material.dart';
import '../util/constants.dart';

class MAKENNtf extends StatelessWidget {
  const MAKENNtf({Key? key, required this.tec,}) : super(key: key);

  final tec;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: tec,
      decoration: InputDecoration(
          icon: Icon(
            Icons.account_circle,
            color: kPrimaryColor,
          ),
          hintText: "사용할 닉네임",
          border: InputBorder.none),
    );
  }
}
