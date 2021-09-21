import "package:flutter/material.dart";

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController email;
  late TextEditingController password;

  @override
  void initState() {
    email = TextEditingController();
    password = TextEditingController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(
            "로그인",
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
      body: Column(
        children: [
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
                        Padding(padding: EdgeInsets.all(15)),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text("비밀번호"),
                        ),
                        Padding(padding: EdgeInsets.all(5)),
                        TextField(
                          decoration: InputDecoration(
                              hintText: "비밀번호를 입력해주세요.",
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    password.clear();
                                  },
                                  icon: Icon(Icons.visibility)
                              )
                          ),
                          controller: password,
                        ),
                        Padding(padding: EdgeInsets.all(15)),
                        Row(
                          children: [
                            Expanded(
                              child: OutlineButton(
                                child: Text(
                                    "로그인",
                                    style: TextStyle(
                                        color: Color(0xff6D00B0)
                                    )
                                ),
                                color: Colors.white,
                                borderSide: BorderSide(color: Color(0xff6D00B0), width: 1),
                                onPressed: () => { },
                              ),
                            )
                          ]
                        )
                      ]
                  )
              )
          ),
        ],
      )
    );
  }
}