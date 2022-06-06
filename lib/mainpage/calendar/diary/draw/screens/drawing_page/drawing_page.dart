import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/mainpage/calendar/diary/draw/screens/drawing_page/local_utils/DrawingProvider.dart';
import 'package:untitled1/util/constants.dart';
import '../../models/Dot_Info.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

class Drawingpage extends StatefulWidget {
  const Drawingpage({Key? key}) : super(key: key);

  @override
  State<Drawingpage> createState() => _DrawingpageState();
}

class _DrawingpageState extends State<Drawingpage> {
  ImagePicker imagePicker = new ImagePicker();
  GlobalKey<ScaffoldState> gKey = GlobalKey<ScaffoldState>();
  GlobalKey scr = new GlobalKey();


  @override
  Widget build(BuildContext context) {
    var p = Provider.of<DrawingProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('그림판'),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.check),
              onPressed: () {

              })
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                    Positioned.fill(
                    child: CustomPaint(
                      painter: DrawingPainter(p.lines),
                    )),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  //처음 눌렀을 때의 값 전달.
                  onPanStart: (s){
                    if(p.eraseMode){
                      p.erase(s.localPosition);
                    }else{
                      p.drawStart(s.localPosition);
                    }
                  },
                  //누른 후, 움직일 때의 값들을 계속 전달.
                  onPanUpdate: (s){
                    if(p.eraseMode){
                      p.erase(s.localPosition);
                    }else{
                      p.drawing(s.localPosition);
                    }
                  },
                  child: Container(),

                )
              ],
            ),
          ),
          Container(
            color: kPrimaryColor,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 10,bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _colorWidghet(Colors.black),
                      _colorWidghet(Colors.red),
                      _colorWidghet(Colors.yellow),
                      _colorWidghet(Colors.green),
                      _colorWidghet(Colors.blue),
                      _colorWidghet(Colors.white),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child:Padding(
                        padding: EdgeInsets.only(left: 10,right: 5),
                        child: Slider(
                          value: p.size, onChanged: (size){
                            p.changeSize = size;
                        },
                          min: 3,
                          max: 15,
                        activeColor: Colors.indigo[900],
                        inactiveColor: Colors.indigo[900],
                        ),
                      ),
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: (){
                        p.changeEraseMode();
                      },
                      child:Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text('지우개',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: p.eraseMode?FontWeight.bold:FontWeight.w300
                        ),),
                    ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget _colorWidghet(Color color){
    var p = Provider.of<DrawingProvider>(context);
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
        onTap: (){
          p.changeColor = color;
        },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          border: p.color==color?Border.all(color: Colors.white,width: 3):null,
        ),
      ),
    );
  }
}

class DrawingPainter extends CustomPainter{
  DrawingPainter(this.lines);
  final List<List<DotInfo>> lines;

  @override
  void paint(Canvas canvas, Size size){
    for(var oneLine in lines){
      Color? color;
      double? size;
      var l = <Offset>[];
      var p = Path();
      for(var oneDot in oneLine){
        color ??= oneDot.color;
        size ??= oneDot.size;
        l.add(oneDot.offset);
      }
      p.addPolygon(l, false);
      canvas.drawPath(p,
          Paint()..color=color!..strokeWidth=
              size!..strokeCap=StrokeCap.round..style=
              PaintingStyle.stroke);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate){
    return true;
  }
}