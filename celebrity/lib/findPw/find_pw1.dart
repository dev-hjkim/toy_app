import 'package:celebrity/utils/http_util.dart';
import "package:flutter/material.dart";

import 'find_pw2.dart';

class FindPw1 extends StatefulWidget {
  const FindPw1({Key? key}) : super(key: key);

  @override
  _FindPw1State createState() => _FindPw1State();
}

class _FindPw1State extends State<FindPw1> {
  late TextEditingController id;
  late TextEditingController phone;

  late HttpUtil httpUtil;
  late Map<String, dynamic> data;


  bool idValid = false;
  bool phoneValid = false;

  late FocusNode idFocusNode;
  late FocusNode phoneFocusNode;

  @override
  void initState() {
    id = TextEditingController();
    phone = TextEditingController();
    httpUtil = HttpUtil();
    data = {};

    idValid = false;
    phoneValid = false;

    idFocusNode = new FocusNode();
    idFocusNode.addListener(() {
      setState(() {
        idValid = id.text.length >= 1;
      });
    });

    phoneFocusNode = new FocusNode();
    phoneFocusNode.addListener(() {
      setState(() {
        phoneValid = phone.text.length >= 1;
      });
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
                                  focusNode: idFocusNode,
                                  decoration: InputDecoration(
                                    hintText: "이메일을 입력해주세요",
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          id.clear();
                                        },
                                        icon: Icon(Icons.cancel, color: Colors.grey)
                                    ),
                                  ),
                                  controller: id,
                                ),
                              ])
                          ),
                          Container(
                              margin: EdgeInsets.only(bottom: 35),
                              color: Color(0xffF4F4F4),
                              child: Column(children: [
                                TextField(
                                  focusNode: phoneFocusNode,
                                  decoration: InputDecoration(
                                      hintText: "연락처를 입력해주세요('-'제외)",
                                      suffixIcon: IconButton(
                                          onPressed: () {
                                            phone.clear();
                                          },
                                          icon: Icon(Icons.cancel, color: Colors.grey)
                                      )
                                  ),
                                  controller: phone,
                                ),
                              ])
                          ),
                          Row(children: [
                            Expanded(
                              child: Container(
                                child: RaisedButton(
                                    child: const Text("다음",
                                        style: TextStyle(
                                          color: Colors.white,
                                        )),
                                    color: (idValid && phoneValid)
                                        ? const Color(0xff6D00B0)
                                        : const Color(0xffC192DE),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    onPressed: () => {
                                      setState(() {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => FindPw2()),
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

  Future findPw(id, phone) async {
    data = await httpUtil.findPw(id, phone);
    setState(() {
      data = data;
    });
  }
}