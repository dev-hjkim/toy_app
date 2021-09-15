import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Celebrity",
      home: Scaffold(
        body: Builder(
          builder: (context) => SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(40),
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
                    padding: EdgeInsets.all(20),
                    child: RaisedButton(
                      child: const Text(
                        "이메일로 가입하기",
                        style: TextStyle(
                          color: Colors.white
                        )
                      ),
                      color: Color(0xff6D00B0),
                      onPressed: () => {},
                    )
                  ),
                  const Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "로그인",
                      style: TextStyle(
                        color: Color(0xff6D00B0),
                      ),
                    )
                  ),
                  const Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                          "아이디 찾기 | 비밀번호 찾기"
                      )
                  ),
                ])
              )
            )
          )
        )
      )
    );
  }

}