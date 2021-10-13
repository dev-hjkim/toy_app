import 'package:celebrity/login/login.dart';
import 'package:celebrity/utils/http_util.dart';
import "package:flutter/material.dart";

class FindPw2 extends StatefulWidget {
  const FindPw2({Key? key}) : super(key: key);

  @override
  _FindPw2State createState() => _FindPw2State();
}

class _FindPw2State extends State<FindPw2> {
  late TextEditingController password;
  late TextEditingController passwordRe;

  late HttpUtil httpUtil;
  late Map<String, dynamic> data;

  bool passwordValid = false;
  bool passwordReValid = false;
  bool _passwordVisible = false;
  bool _passwordReVisible = false;

  late FocusNode passwordFocusNode;
  late FocusNode passwordReFocusNode;

  String message = "";
  String messageRe = "";


  @override
  void initState() {
    password = TextEditingController();
    passwordRe = TextEditingController();

    httpUtil = HttpUtil();
    data = {};

    passwordValid = false;
    passwordReValid = false;
    _passwordVisible = false;
    _passwordReVisible = false;

    passwordFocusNode = new FocusNode();
    passwordFocusNode.addListener(() {
      if (!passwordFocusNode.hasFocus) {
        setState(() {
          passwordValid = RegExp(
              r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?~^<>,.-_&+=])[A-Za-z\d$@$!%*#?~^<>,.-_&+=]{10,40}$'
          ).hasMatch(password.text);
          if (!passwordValid) {
            message = "영문+숫자+특수기호 10글자 이상이어야 해요🙌";
          } else {
            message = "안전해요✨";
          }
        });
      }
    });

    passwordReFocusNode = new FocusNode();
    passwordReFocusNode.addListener(() {
      if (!passwordReFocusNode.hasFocus) {
        setState(() {
          passwordReValid = (password.text == passwordRe.text);
          if (!passwordReValid) {
            messageRe = "앗! 다르게 입력하신 것 같아요👋";
          } else {
            messageRe = "";
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
                                        focusNode: passwordFocusNode,
                                        obscureText: !_passwordVisible,
                                        decoration: InputDecoration(
                                          hintText: "새로운 비밀번호를 입력해주세요",
                                          suffixIcon: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  _passwordVisible = !_passwordVisible;
                                                });
                                              },
                                              icon: Icon(
                                                _passwordVisible
                                                    ? Icons.visibility
                                                    : Icons.visibility_off,
                                              )
                                          ),
                                        ),
                                        controller: password,
                                      ),
                                    ])
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    margin: EdgeInsets.only(top: 8.44, bottom: 12.56),
                                    child: Text(message,
                                          style: TextStyle(color: Color(0xff6D00B0))),
                                  ),
                                ),
                                Container(
                                  color: Color(0xffF4F4F4),
                                  child: Column(children: [
                                    TextField(
                                      focusNode: passwordReFocusNode,
                                      obscureText: !_passwordReVisible,
                                      decoration: InputDecoration(
                                          hintText: "비밀번호를 확인해주세요",
                                          suffixIcon: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  _passwordReVisible = !_passwordReVisible;
                                                });
                                              },
                                              icon: Icon(
                                                _passwordReVisible
                                                    ? Icons.visibility
                                                    : Icons.visibility_off,
                                              )
                                          )
                                      ),
                                      controller: passwordRe,
                                    ),
                                  ])
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    margin: EdgeInsets.only(top: 8.44, bottom: 12.56),
                                    child: Text(messageRe,
                                        style: TextStyle(color: Color(0xff6D00B0))),
                                  ),
                                ),
                                Row(children: [
                                  Expanded(
                                    child: Container(
                                      child: RaisedButton(
                                        child: const Text("변경완료",
                                            style: TextStyle(
                                              color: Colors.white,
                                            )),
                                        color: (passwordValid && passwordReValid)
                                            ? const Color(0xff6D00B0)
                                            : const Color(0xffC192DE),
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
    });
  }

  Future modPw(id, pwd) async {
    data = await httpUtil.modPw(id, pwd);
    setState(() {
      data = data;
    });
  }
}
