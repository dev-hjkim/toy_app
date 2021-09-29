import "package:flutter/material.dart";

class JoinEmail extends StatefulWidget {
  const JoinEmail({Key? key}) : super(key: key);

  @override
  _JoinEmailState createState() => _JoinEmailState();
}

class _JoinEmailState extends State<JoinEmail> {
  late TextEditingController email;
  late TextEditingController code;

  bool showCode = false;
  bool showNickname = false;

  @override
  void initState() {
    email = TextEditingController();
    code = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Scaffold(
            appBar: AppBar(
              title: Center(child: Text(
                  "이메일로 가입할 수 있어요!",
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
                                            child: RaisedButton(
                                              child: Text(
                                                  "인증하기",
                                                  style: TextStyle(
                                                      color: showCode ? Colors.white : Color(0xff6D00B0),
                                                  )
                                              ),
                                              color: showCode ? Color(0xff6D00B0) : Colors.white,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(10.0),
                                                  side: BorderSide(color: showCode ? Colors.white : Color(0xff6D00B0), width: 1)),
                                              onPressed: () => {
                                                setState(() {
                                                  showCode = true;
                                                })
                                              },
                                            ),
                                          ),
                                        ]
                                    )
                                )
                            ),
                            Visibility(
                              visible: showCode,
                              child: Padding(
                                  padding: EdgeInsets.all(20),
                                  child: Container(
                                      child: Column(
                                          children: [
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text("인증코드"),
                                            ),
                                            Padding(padding: EdgeInsets.all(5)),
                                            TextField(
                                              decoration: InputDecoration(
                                                  hintText: "인증코드를 입력해주세요.",
                                                  suffixIcon: IconButton(
                                                      onPressed: () {
                                                        code.clear();
                                                      },
                                                      icon: Icon(Icons.cancel, color: Colors.grey)
                                                  )
                                              ),
                                              controller: code,
                                            ),
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: RaisedButton(
                                                child: Text(
                                                    "인증하기",
                                                    style: TextStyle(
                                                      color: showNickname ? Colors.white : Color(0xff6D00B0),
                                                    )
                                                ),
                                                color: showNickname ? Color(0xff6D00B0) : Colors.white,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(10.0),
                                                    side: BorderSide(color: showNickname ? Colors.white : Color(0xff6D00B0), width: 1)),
                                                onPressed: () => {
                                                  setState(() {
                                                    showNickname = true;
                                                  })
                                                },
                                              ),
                                            ),
                                          ]
                                      )
                                  )
                              ),
                            )
                          ])
                      )
                  )
              )
          );
        }
    );
  }
}