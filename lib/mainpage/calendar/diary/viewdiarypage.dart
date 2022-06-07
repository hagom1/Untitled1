import 'package:flutter/material.dart';

class viewdiarypage extends StatefulWidget {
  const viewdiarypage({Key? key,this.viewtitle,this.viewtext}) : super(key: key);

  final String? viewtitle;
  final String? viewtext;

  @override
  State<viewdiarypage> createState() => _viewdiarypageState();
}

class _viewdiarypageState extends State<viewdiarypage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 100,),
          Text('${widget.viewtitle}'),
          Text('${widget.viewtext}')
        ],
      ),
    );
  }
}
