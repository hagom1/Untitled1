import 'package:flutter/material.dart';
import '../util/constants.dart';


class PWtf extends StatelessWidget {
  const PWtf({Key? key, required this.tec,}) : super(key: key);

  final tec;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: true,
      controller: tec,
      decoration: InputDecoration(
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          hintText: "Password",
          border: InputBorder.none),
    );
  }
}