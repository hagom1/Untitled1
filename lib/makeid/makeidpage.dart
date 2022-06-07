import 'package:flutter/material.dart';
import 'package:untitled1/login/loginpage.dart';
import '../makeid/makeid.dart';
import '../makeid/makepw.dart';
import '../makeid/makepwchk.dart';
import '../makeid/makenickname.dart';

class MAKEID extends StatefulWidget {
  const MAKEID({Key? key}) : super(key: key);

  @override
  State<MAKEID> createState() => _MAKEIDState();
}

class _MAKEIDState extends State<MAKEID> {
  var _makeidTEC = TextEditingController();
  var _makepasswordTEC = TextEditingController();
  var _makepwcheckTEC = TextEditingController();
  var _makenameTEC = TextEditingController();

//회원가입 페이지
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(50, 150, 60, 100),
        child: Column(
          children: [
            Text('회원가입',
                style: TextStyle(fontSize: 25)),
            MAKEIDtf(tec: _makeidTEC),
            MAKEPWtf(tec: _makepasswordTEC),
            MAKEPWCHKtf(tec: _makepwcheckTEC),
            MAKENNtf(tec: _makenameTEC),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left:125,top: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      // postdata(User(_makeidTEC.text, _makepasswordTEC.text, _makenameTEC.text));
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context)=>loginpage())
                      );
                    },
                    child: Text('가입'),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      primary: Colors.deepPurple[400],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );

  }
}
