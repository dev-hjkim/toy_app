import "package:flutter/material.dart";

class JoinEmail2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = new TextEditingController();
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
                                                      _controller.clear();
                                                    },
                                                    icon: Icon(Icons.cancel, color: Colors.grey)
                                                )
                                            ),
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