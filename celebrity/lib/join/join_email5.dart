import "package:flutter/material.dart";
import "../utils/http_util.dart";
import 'join_email4.dart';

class JoinEmail5 extends StatefulWidget {
  const JoinEmail5({Key? key}) : super(key: key);

  @override
  _JoinEmail5State createState() => _JoinEmail5State();
}

class _JoinEmail5State extends State<JoinEmail5> {
  late TextEditingController password;
  late TextEditingController passwordRe;

  bool passwordValid = false;
  bool passwordReValid = false;
  bool _passwordVisible = false;
  bool _passwordReVisible = false;

  late FocusNode passwordFocusNode;
  late FocusNode passwordReFocusNode;

  String message = "";
  String messageRe = "";

  bool _ischeckedAll = false;

  late List<bool> _checked_box;

  @override
  void initState() {
    password = TextEditingController();
    passwordRe = TextEditingController();
    passwordValid = false;
    passwordReValid = false;
    _passwordVisible = false;
    _passwordReVisible = false;

    _ischeckedAll = false;

    passwordFocusNode = new FocusNode();
    passwordFocusNode.addListener(() {
      if (!passwordFocusNode.hasFocus) {
        setState(() {
          passwordValid = RegExp(
              r"^01[0-9]{8,9}"
          ).hasMatch(password.text);
          if (!passwordValid || password.text.length < 10) {
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
                                          hintText: "비밀번호를 입력해주세요!",
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
                                    child: Text(message ?? "",
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
                                          hintText: "비밀번호를 확인해주세요!",
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
                                    child: Text(messageRe ?? "",
                                        style: TextStyle(color: Color(0xff6D00B0))),
                                  ),
                                ),
                                Row(children: [
                                  Expanded(
                                    child: Container(
                                      child: RaisedButton(
                                        child: const Text("다음",
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
                                          showModalBottomSheet(
                                            context: context,
                                            isScrollControlled: false,
                                            builder: (context) {
                                              return SingleChildScrollView(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.only(
                                                      topLeft: Radius.circular(10),
                                                      topRight: Radius.circular(10),
                                                    )
                                                  ),
                                                  height: 332,
                                                  padding: EdgeInsets.only(
                                                      top: 48,
                                                      bottom: MediaQuery.of(context).viewInsets.bottom,
                                                      left: 16, right: 16
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        height: 40,
                                                        color: Color(0xffF4F4F4),
                                                        child: Row(
                                                          children: [
                                                            Checkbox(
                                                                value: _ischeckedAll,
                                                                onChanged: (value) {
                                                                  setState(() {
                                                                    _ischeckedAll = value!;
                                                                  });
                                                                }
                                                            ),
                                                            Padding(
                                                              padding: EdgeInsets.only(left: 9),
                                                              child: Text("전체동의",
                                                                style: TextStyle(
                                                                  color: Color(0xff6A00AB),
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        )
                                                      )
                                                    ]
                                                  )
                                                )
                                              );
                                            }
                                          )
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
}
