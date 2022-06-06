import 'package:flutter/material.dart';
import '../util/constants.dart';

class IDtf extends StatelessWidget {
  const IDtf({Key? key, required this.tec,}) : super(key: key);

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
          hintText: "Email",
          border: InputBorder.none),
    );
  }
}
