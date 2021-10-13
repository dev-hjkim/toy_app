import "package:flutter/material.dart";
import "../utils/http_util.dart";
import 'join_email4.dart';

class JoinEmail3 extends StatefulWidget {
  const JoinEmail3({Key? key}) : super(key: key);

  @override
  _JoinEmail3State createState() => _JoinEmail3State();
}

class _JoinEmail3State extends State<JoinEmail3> {
  late TextEditingController nickname;
  late TextEditingController phone;

  late HttpUtil httpUtil;
  late Map<String, dynamic> data;

  bool nicknameValid = false;
  bool phoneValid = false;

  late FocusNode nicknameFocusNode;
  late FocusNode phoneFocusNode;

  @override
  void initState() {
    nickname = TextEditingController();
    phone = TextEditingController();
    httpUtil = HttpUtil();
    data = {};
    nicknameValid = false;
    phoneValid = false;

    nicknameFocusNode = new FocusNode();
    nicknameFocusNode.addListener(() {
      nicknameValid = nickname.text.length <= 8;
      if (!nicknameFocusNode.hasFocus) {
        if (nicknameValid) {
          dupCheck(nickname.text);
        } else {
          setState(() {
            data["message"] = "8글자까지 입력할 수 있어요💡";
            nicknameValid = false;
          });
        }
      } else {
        setState(() {
          if (nicknameValid) {
            data["message"] = "나중에 언제든 바꿀 수 있어요!";
            nicknameValid = true;
          } else {
            data["message"] = "8글자까지 입력할 수 있어요💡";
            nicknameValid = false;
          }
        });
      }
    });

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
                                        focusNode: nicknameFocusNode,
                                        decoration: InputDecoration(
                                          hintText: "다른 분들이 셀럽님을 뭐라고 불러야 하나요?",
                                          suffixIcon: IconButton(
                                              onPressed: () {
                                                nickname.clear();
                                                },
                                              icon: Icon(Icons.cancel, color: Colors.grey)
                                          ),
                                        ),
                                        controller: nickname,
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
                                      height: 40,
                                      child: RaisedButton(
                                        child: const Text("다음",
                                            style: TextStyle(
                                              color: Colors.white,
                                            )),
                                        color: (nicknameValid && phoneValid)
                                            ? const Color(0xff6D00B0)
                                            : const Color(0xffC192DE),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                        onPressed: () => {
                                          setState(() {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => JoinEmail4()),
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

  Future dupCheck(nickname) async {
    data = await httpUtil.validateNickname(nickname);
    setState(() {
      data = data;
      nicknameValid = !data["success"];
    });
  }
}
