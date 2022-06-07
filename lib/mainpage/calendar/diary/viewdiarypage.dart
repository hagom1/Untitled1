import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:untitled1/util/constants.dart';

class viewdiarypage extends StatefulWidget {
  const viewdiarypage({Key? key,this.viewtitle,this.viewtext,this.viewdate,this.viewimg}) : super(key: key);

  final String? viewtitle;
  final String? viewtext;
  final String? viewdate;
  final String? viewimg;

  @override
  State<viewdiarypage> createState() => _viewdiarypageState();
}

class _viewdiarypageState extends State<viewdiarypage> {

  Uint8List convertStringToUint8List(String str) {
    final List<int> codeUnits = str.codeUnits;
    final Uint8List unit8List = Uint8List.fromList(codeUnits);
    return unit8List;
  }

  @override
  Widget build(BuildContext context) {
    Uint8List imgdata8list = convertStringToUint8List('${widget.viewimg}');
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('${widget.viewdate} 일기',style: TextStyle(
          fontWeight: FontWeight.bold
        ),),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 13,),
              //이미지
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10, top: 1, bottom: 0),
                child: Image.memory(
                  imgdata8list,
                  height: 240,
                ),
              ),
              //일기 제목
              Padding(
                padding:EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 2),
                child: TextFormField(
                  readOnly: true,
                  initialValue: '${widget.viewtitle}',
                  decoration: InputDecoration(
                    labelStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                    labelText: '제목',
                  ),
                ),
              ),
              SizedBox(height: 10,),
              //일기 내용
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 20),
                child: TextFormField(
                  initialValue: '${widget.viewtext}',
                  readOnly: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 11,
                  onChanged: (text) {
                    print(text);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      //편집 버튼 @@@@@@@@@@@@@@@@@@@@@@@@@@ 미구현 @@@@@@@@@@@@@@@@@@@@@@
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
        },
        label: const Text('편집'),
        icon: const Icon(Icons.create),
        backgroundColor: kPrimaryColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
