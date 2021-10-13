import "package:flutter/material.dart";
import "./join_email2.dart";
import "../login/login.dart";

class JoinEmail1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Scaffold(
          backgroundColor: Color(0xff6D00B0),
            body: Builder(
                builder: (context) => SingleChildScrollView(
                    child: Padding(
                        padding: EdgeInsets.only(top: 53, left: 16, right: 16),
                        child: Center(
                            child: Column(children: [
                              const Text(
                                "fashion cookbook",
                                style: TextStyle(
                                  color: Color(0xffCEB3DE),
                                  fontSize: 15,
                                  fontFamily: 'Nunito',
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 224),
                                child: Text(
                                    "Celebrity",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 47,
                                      fontFamily: 'Nunito',
                                      fontWeight: FontWeight.w700,
                                    )
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 13),
                                child: Text(
                                    "당신, 스스로 빛을 내고 있군요.",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    )
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(top: 254),
                                  child: Row(children: [
                                    Expanded(
                                      child: Container(
                                        height: 40,
                                        child: RaisedButton(
                                            child: const Text("가입하기",
                                                style: TextStyle(
                                                  color: Color(0xff6A00AB),
                                                )),
                                            color: const Color(0xffE9E0F6),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(5),
                                            ),
                                            onPressed: () => {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => JoinEmail2()),
                                              )
                                            }
                                        ),
                                      ),
                                    )
                                  ]),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 13),
                                child: Row(children: [
                                  Expanded(
                                    child: Container(
                                      height: 40,
                                      child: RaisedButton(
                                          child: const Text("로그인",
                                              style: TextStyle(
                                                color: Color(0xffFFFFFF),
                                              )),
                                          color: const Color(0xffB586D2),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          onPressed: () => {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => Login()),
                                            )
                                          }
                                      ),
                                    ),
                                  )
                                ]),
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