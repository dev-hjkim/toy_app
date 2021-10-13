import 'package:celebrity/utils/http_util.dart';
import "package:flutter/material.dart";

import 'find_id2.dart';

class FindId1 extends StatefulWidget {
  const FindId1({Key? key}) : super(key: key);

  @override
  _FindId1State createState() => _FindId1State();
}

class _FindId1State extends State<FindId1> {
  late TextEditingController phone;

  late HttpUtil httpUtil;
  late Map<String, dynamic> data;

  bool phoneValid = false;

  late FocusNode phoneFocusNode;

  @override
  void initState() {
    phone = TextEditingController();
    httpUtil = HttpUtil();
    data = {};

    phoneValid = false;

    phoneFocusNode = new FocusNode();
    phoneFocusNode.addListener(() {
      if (!phoneFocusNode.hasFocus) {
        setState(() {
          phoneValid = RegExp(
              r"^01[0-9]{8,9}"
          ).hasMatch(phone.text);
          if (!phoneValid) {
            phoneValid = false;
          } else {
            phoneValid = true;
          }
        });
      }
    });

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
                                color: Color(0xffF4F4F4),
                                child: Column(children: [
                                  TextField(
                                    focusNode: phoneFocusNode,
                                    decoration: InputDecoration(
                                      hintText: "연락처를 입력해주시겠어요?",
                                      suffixIcon: IconButton(
                                          onPressed: () {
                                            phone.clear();
                                          },
                                          icon: Icon(Icons.cancel, color: Colors.grey)
                                      ),
                                    ),
                                    controller: phone,
                                  ),
                                ])
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                margin: EdgeInsets.only(top: 8.44, bottom: 12.56),
                                child: Text(data["message"] ?? "",
                                    style: TextStyle(color: Color(0xff6D00B0))),
                              ),
                            ),
                            Row(children: [
                              Expanded(
                                child: Container(
                                  child: RaisedButton(
                                      child: const Text("아이디 찾기",
                                          style: TextStyle(
                                            color: Colors.white,
                                          )),
                                      color: (phoneValid)
                                          ? const Color(0xff6D00B0)
                                          : const Color(0xffC192DE),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      onPressed: () => {
                                        setState(() {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => FindId2()),
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

  Future findId(phone) async {
    data = await httpUtil.findId(phone);
    setState(() {
      data = data;
    });
  }
}