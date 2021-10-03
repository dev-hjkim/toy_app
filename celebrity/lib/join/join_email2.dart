import "package:flutter/material.dart";
import "../utils/http_util.dart";

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
  bool _hasEmailError = false;

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
            _hasEmailError = true;
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
                title: Center(
                    child: Text("이메일로 가입할 수 있어요!",
                        style: TextStyle(color: Colors.black),
                        textAlign: TextAlign.center)
                ),
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
                            Padding(
                                padding: EdgeInsets.all(16),
                                child: Container(
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
                                                errorText: _hasEmailError
                                                    ? "유효한 이메일 번호가 아닙니다."
                                                    : "",
                                              ),
                                              controller: email,
                                            ),
                                          ])
                                      ),
                                      Padding(padding: EdgeInsets.all(8.44)),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(data["message"] ?? "",
                                            style: TextStyle(color: Color(0xff6D00B0))),
                                      ),
                                      Visibility(
                                        visible: showCode,
                                        child: Container(
                                            color: Color(0xffF4F4F4),
                                            child: Column(children: [
                                              TextField(
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
                                          child: RaisedButton(
                                            child: Text("다음",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                )),
                                            color: btnActive
                                                ? Color(0xff6D00B0)
                                                : Color(0xffC192DE),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10.0),
                                            ),
                                            onPressed: () => {
                                              setState(() {
                                                sendMail(email.text);
                                              })
                                            },
                                          ),
                                        )
                                      ]),
                                    ])
                                )
                            ),
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
    });
  }
}
