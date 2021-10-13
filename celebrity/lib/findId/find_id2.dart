import 'package:celebrity/login/login.dart';
import "package:flutter/material.dart";

class FindId2 extends StatefulWidget {
  const FindId2({Key? key}) : super(key: key);

  @override
  _FindId2State createState() => _FindId2State();
}

class _FindId2State extends State<FindId2> {
  late Map<String, dynamic> data;
  String email = "";

  @override
  void initState() {
    data = {};
    email = "";
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.black,
            icon: Icon(Icons.arrow_back_ios_sharp),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Builder(
            builder: (context) => SingleChildScrollView(
                child: Center(
                    child: Column(children: [
                      Container(
                          margin: EdgeInsets.all(16),
                          child: Column(children: [
                            Container(
                              margin: EdgeInsets.only(top: 48, bottom: 40),
                                child: Column(children: [
                                  Text(
                                    "가입하신 아이디는 " + email + " 이에요💛"
                                  ),
                                ])
                            ),
                            Row(children: [
                              Expanded(
                                child: Container(
                                  child: RaisedButton(
                                      child: const Text("로그인하러 가기",
                                          style: TextStyle(
                                            color: Colors.white,
                                          )),
                                      color: const Color(0xff6D00B0),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      onPressed: () => {
                                        setState(() {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => Login()),
                                          );
                                        })
                                      }
                                  ),
                                ),
                              )
                            ]),
                          ])
                      )
                    ])
                )
            )
        )
    );
  }
}