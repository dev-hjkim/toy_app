import "package:flutter/material.dart";
import "./join_email2.dart";
import "../login/login.dart";

class JoinEmail1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Scaffold(
            body: Builder(
                builder: (context) => SingleChildScrollView(
                    child: Padding(
                        padding: EdgeInsets.only(top: constraints.maxHeight/3),
                        child: Center(
                            child: Column(children: [
                              const Padding(
                                  padding: EdgeInsets.all(20),
                                  child: Text(
                                    "당신, 스스로 빛을 내고 있군요!",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                              ),
                              Padding(
                                  padding: EdgeInsets.all(0),
                                  child: RaisedButton(
                                    child: const Text(
                                        "이메일로 가입하기",
                                        style: TextStyle(
                                            color: Colors.white
                                        )
                                    ),
                                    color: Color(0xff6D00B0),
                                    onPressed: () => {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => JoinEmail2()),
                                      )
                                    },
                                  )
                              ),
                              Padding(
                                  padding: EdgeInsets.all(13.7),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => Login()),
                                      );
                                    },
                                    child: Text(
                                      "로그인",
                                      style: TextStyle(
                                        color: Color(0xff6D00B0),
                                      ),
                                    ),
                                  ),
                              ),
                              const Padding(
                                  padding: EdgeInsets.all(13),
                                  child: Text(
                                      "아이디 찾기 | 비밀번호 찾기"
                                  )
                              ),
                            ])
                        )
                    )
                )
            )
        );
      }
    );
  }
}