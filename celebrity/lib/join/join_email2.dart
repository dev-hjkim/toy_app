import "package:flutter/material.dart";
import "../utils/http_util.dart";
import 'join_email3.dart';

class JoinEmail2 extends StatefulWidget {
  const JoinEmail2({Key? key}) : super(key: key);

  @override
  _JoinEmail2State createState() => _JoinEmail2State();
}

class _JoinEmail2State extends State<JoinEmail2> {
  late TextEditingController email;
  late TextEditingController code;

  late HttpUtil httpUtil;
  late Map<String, dynamic> data;

  bool showCode = false;
  bool btnActive = false;

  late FocusNode focusNode;
  late FocusNode codeFocusNode;

  @override
  void initState() {
    email = TextEditingController();
    code = TextEditingController();
    httpUtil = HttpUtil();
    data = {};
    showCode = false;
    btnActive = false;

    focusNode = new FocusNode();
    focusNode.addListener(() {
      if (!focusNode.hasFocus) {
        setState(() {
          bool emailValid = RegExp(
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(email.text);
          if (!emailValid) {
            btnActive = false;
            data["message"] = "올바른 이메일 형식이 아닙니다.";
          } else {
            btnActive = true;
            data["message"] = "";
          }
        });
      }
    });

    codeFocusNode = new FocusNode();
    codeFocusNode.addListener(() {
      if (!codeFocusNode.hasFocus) {
        setState(() {
          bool codeValid = code.text.length == 10;
          if (!codeValid) {
            btnActive = false;
          } else {
            btnActive = true;
          }
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Scaffold(
              appBar: AppBar(
                title: Text("이메일로 가입할 수 있어요!",
                    style: TextStyle(color: Colors.black),
                    textAlign: TextAlign.center),
                centerTitle: true,
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
                                        focusNode: focusNode,
                                        decoration: InputDecoration(
                                          hintText: "이메일을 입력해주시겠어요?",
                                          suffixIcon: IconButton(
                                              onPressed: () {
                                                email.clear();
                                                },
                                              icon: Icon(Icons.cancel, color: Colors.grey)
                                          ),
                                        ),
                                        controller: email,
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
                                Visibility(
                                  visible: showCode,
                                  child: Container(
                                      margin: EdgeInsets.only(bottom: 35),
                                      color: Color(0xffF4F4F4),
                                      child: Column(children: [
                                        TextField(
                                          focusNode: codeFocusNode,
                                          decoration: InputDecoration(
                                              hintText: "인증코드를 입력해주세요!",
                                              suffixIcon: IconButton(
                                                  onPressed: () {
                                                    code.clear();
                                                    },
                                                  icon: Icon(Icons.cancel, color: Colors.grey)
                                              )
                                          ),
                                          controller: code,
                                        ),
                                      ])
                                  ),
                                ),
                                Row(children: [
                                  Expanded(
                                    child: Container(
                                      height: 40,
                                      child: RaisedButton(
                                        child: const Text("다음",
                                            style: TextStyle(
                                              color: Colors.white,
                                            )),
                                        color: btnActive
                                            ? const Color(0xff6D00B0)
                                            : const Color(0xffC192DE),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                        onPressed: () => {
                                          setState(() {
                                            if (!showCode) {
                                              sendMail(email.text);
                                            } else {
                                              certCode(email.text, code.text);

                                              if (data["success"]) {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (context) => JoinEmail3()),
                                                );
                                              }
                                            }
                                          })
                                        },
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
    });
  }

  Future sendMail(email) async {
    data = await httpUtil.validateMail(email);
    setState(() {
      data = data;
      showCode = data["success"];
      btnActive = false;
    });
  }

  Future certCode(email, code) async {
    data = await httpUtil.validateCode(email, code);
    setState(() {
      data = data;
    });
  }
}
