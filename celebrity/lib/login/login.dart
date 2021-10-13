import 'package:celebrity/findId/find_id1.dart';
import 'package:celebrity/findPw/find_pw1.dart';
import 'package:celebrity/utils/http_util.dart';
import "package:flutter/material.dart";

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController id;
  late TextEditingController password;

  late HttpUtil httpUtil;
  late Map<String, dynamic> data;

  late bool _passwordVisible;

  bool idValid = false;
  bool passwordValid = false;

  late FocusNode idFocusNode;
  late FocusNode passwordFocusNode;

  @override
  void initState() {
    id = TextEditingController();
    password = TextEditingController();
    httpUtil = HttpUtil();
    data = {};

    idValid = false;
    passwordValid = false;

    _passwordVisible = false;

    idFocusNode = new FocusNode();
    idFocusNode.addListener(() {
      setState(() {
        idValid = id.text.length >= 1;
      });
    });

    passwordFocusNode = new FocusNode();
    passwordFocusNode.addListener(() {
      setState(() {
        passwordValid = password.text.length >= 1;
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
                              margin: EdgeInsets.only(top: 35, bottom: 35),
                              color: Color(0xffF4F4F4),
                              child: Column(children: [
                                TextField(
                                  focusNode: passwordFocusNode,
                                  obscureText: !_passwordVisible,
                                  decoration: InputDecoration(
                                    hintText: "비밀번호를 입력해주세요",
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
                          Row(children: [
                            Expanded(
                              child: Container(
                                height: 40,
                                child: RaisedButton(
                                    child: const Text("로그인",
                                        style: TextStyle(
                                          color: Colors.white,
                                        )),
                                    color: (idValid && passwordValid)
                                        ? const Color(0xff6D00B0)
                                        : const Color(0xffC192DE),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    onPressed: () => {
                                      setState(() {
                                        // Navigator.push(
                                        //   context,
                                        //   MaterialPageRoute(builder: (context) => 메인화면()),
                                        // );
                                      })
                                    }
                                ),
                              ),
                            )
                          ]),
                          Container(
                            margin: EdgeInsets.only(top: 23),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 24),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => FindId1()),
                                      );
                                    },
                                    child: new Text("아이디 찾기"),
                                  )
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => FindPw1()),
                                    );
                                  },
                                  child: new Text("비밀번호 찾기"),
                                )
                              ],
                            )
                          )
                        ])
                    )
                  ])
              )
          )
      )
    );
  }

  Future login(id, pwd) async {
    data = await httpUtil.login(id, pwd);
    setState(() {
      data = data;
    });
  }
}