import "package:flutter/material.dart";
import "../utils/http_util.dart";

class JoinEmail4 extends StatefulWidget {
  const JoinEmail4({Key? key}) : super(key: key);

  @override
  _JoinEmail4State createState() => _JoinEmail4State();
}

class _JoinEmail4State extends State<JoinEmail4> {
  late TextEditingController gender;
  late TextEditingController birthDt;

  late HttpUtil httpUtil;
  late Map<String, dynamic> data;

  bool btnActive = false;

  late FocusNode birthDtFocusNode;

  @override
  void initState() {
    gender = TextEditingController();
    birthDt = TextEditingController();
    httpUtil = HttpUtil();
    data = {};
    btnActive = false;


    birthDtFocusNode = new FocusNode();
    birthDtFocusNode.addListener(() {
      if (birthDtFocusNode.hasFocus) {

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
                                        decoration: InputDecoration(
                                          hintText: "성별을 선택해주세요",
                                          suffixIcon: IconButton(
                                              onPressed: () {
                                                showModalBottomSheet(
                                                    context: context,
                                                    isScrollControlled: false,
                                                    builder: (context) {
                                                      print(MediaQuery.of(context).viewInsets.bottom);
                                                      return SingleChildScrollView(
                                                          child: Container(
                                                            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                                                            child: Column(children: [
                                                              Text("성별"),
                                                              Row(children: [
                                                                RaisedButton(
                                                                    child: const Text("남성",
                                                                        style: TextStyle(
                                                                          color: Color(0xff494846),
                                                                        )
                                                                    ),
                                                                    color: Colors.white,
                                                                    shape: RoundedRectangleBorder(
                                                                      borderRadius: BorderRadius.circular(16),
                                                                    ),
                                                                    onPressed: () => {
                                                                      setState(() {
                                                                        gender.text = "남성";
                                                                        // Navigator.push(
                                                                        //   context,
                                                                        //   MaterialPageRoute(builder: (context) => JoinEmail4()),
                                                                        // );
                                                                      })
                                                                    }
                                                                ),
                                                              ])
                                                            ]),
                                                          )
                                                      );
                                                    }
                                                );
                                              },
                                              icon: Icon(Icons.expand_more, color: Colors.grey)
                                          ),
                                        ),
                                        controller: gender,
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
                                      focusNode: birthDtFocusNode,
                                      decoration: InputDecoration(
                                          hintText: "연락처를 입력해주세요('-'제외)",
                                          suffixIcon: IconButton(
                                              onPressed: () {
                                                birthDt.clear();
                                                },
                                              icon: Icon(Icons.cancel, color: Colors.grey)
                                          )
                                      ),
                                      controller: birthDt,
                                    ),
                                  ])
                                ),
                                Row(children: [
                                  Expanded(
                                    child: Container(
                                      child: RaisedButton(
                                        child: const Text("다음",
                                            style: TextStyle(
                                              color: Colors.white,
                                            )),
                                        color: btnActive
                                            ? const Color(0xff6D00B0)
                                            : const Color(0xffC192DE),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                        onPressed: () => {
                                          setState(() {
                                            // Navigator.push(
                                            //   context,
                                            //   MaterialPageRoute(builder: (context) => JoinEmail4()),
                                            // );
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
}
