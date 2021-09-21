import "package:flutter/material.dart";

class JoinEmail2 extends StatefulWidget {
  const JoinEmail2({Key? key}) : super(key: key);

  @override
  _JoinEmail2State createState() => _JoinEmail2State();
}

class _JoinEmail2State extends State<JoinEmail2> {
  late TextEditingController email;

  @override
  void initState() {
    email = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Scaffold(
            appBar: AppBar(
              title: Center(child: Text(
                  "이메일로 가입",
                  style: TextStyle(color:Colors.black),
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
                                padding: EdgeInsets.all(20),
                                child: Container(
                                    child: Column(
                                        children: [
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text("이메일"),
                                          ),
                                          Padding(padding: EdgeInsets.all(5)),
                                          TextField(
                                            decoration: InputDecoration(
                                                hintText: "이메일을 입력해주세요.",
                                                suffixIcon: IconButton(
                                                    onPressed: () {
                                                      email.clear();
                                                    },
                                                    icon: Icon(Icons.cancel, color: Colors.grey)
                                                )
                                            ),
                                            controller: email,
                                          ),
                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: OutlineButton(
                                              child: Text(
                                                  "인증하기",
                                                  style: TextStyle(
                                                      color: Color(0xff6D00B0)
                                                  )
                                              ),
                                              color: Colors.white,
                                              borderSide: BorderSide(color: Color(0xff6D00B0), width: 1),
                                              onPressed: () => { },
                                            ),
                                          ),
                                        ]
                                    )
                                )
                            ),
                          ])
                      )
                  )
              )
          );
        }
    );
  }
}