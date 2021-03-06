import "package:flutter/material.dart";
import "../utils/http_util.dart";
import 'package:scroll_date_picker/scroll_date_picker.dart';
import 'package:intl/intl.dart';

import 'join_email5.dart';

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

  int genderCode = 0;
  bool genderComleted = false;
  bool birthDtCompleted = false;

  late DatePickerController controller;
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    gender = TextEditingController();
    birthDt = TextEditingController();
    httpUtil = HttpUtil();
    data = {};

    controller = DatePickerController(
      initialDateTime: _selectedDate,
      minYear: 1950,
      maxYear: 2021,
    );

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
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
                                        readOnly: true,
                                        decoration: InputDecoration(
                                          hintText: "????????? ??????????????????",
                                          suffixIcon: IconButton(
                                              onPressed: () {
                                                showModalBottomSheet(
                                                    context: context,
                                                    isScrollControlled: false,
                                                    builder: (context) {
                                                      print(MediaQuery.of(context).viewInsets.bottom);
                                                      return SingleChildScrollView(
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.only(
                                                                    topLeft: Radius.circular(10),
                                                                  topRight: Radius.circular(10),
                                                                )
                                                            ),
                                                            height: 543,
                                                            padding: EdgeInsets.only(
                                                                bottom: MediaQuery.of(context).viewInsets.bottom,
                                                              top: 71
                                                            ),
                                                            child: Column(children: [
                                                              Container(
                                                                margin: EdgeInsets.only(left: 34),
                                                                child: Align(
                                                                  alignment: Alignment.centerLeft,
                                                                  child: Text("??????"),
                                                                ),
                                                              ),
                                                              Container(
                                                                margin: EdgeInsets.only(top: 27, left: 34),
                                                                child: Row(children: [
                                                                  ButtonTheme(
                                                                    minWidth: 48,
                                                                    height: 34,
                                                                    child: RaisedButton(
                                                                        child: Text("??????",
                                                                            style: TextStyle(
                                                                              color: Color(0xff494846),
                                                                            )
                                                                        ),
                                                                        color: Colors.white,
                                                                        shape: RoundedRectangleBorder(
                                                                            borderRadius: BorderRadius.circular(16),
                                                                            side: BorderSide(color: genderCode == 1 ? Color(0xff6D00B0) : Color(0xffE4E5E7), width: 1)
                                                                        ),
                                                                        onPressed: () => {
                                                                          setState(() {
                                                                            genderCode = 1;
                                                                            gender.text = "??????";
                                                                            genderComleted = true;
                                                                            Navigator.pop(context);
                                                                          })
                                                                        }
                                                                    ),
                                                                  ),
                                                                  SizedBox(width: 15),
                                                                  ButtonTheme(
                                                                    minWidth: 48,
                                                                    height: 34,
                                                                    child: RaisedButton(
                                                                        child: Text("??????",
                                                                            style: TextStyle(
                                                                              color: Color(0xff494846),
                                                                            )
                                                                        ),
                                                                        color: Colors.white,
                                                                        shape: RoundedRectangleBorder(
                                                                            borderRadius: BorderRadius.circular(16),
                                                                            side: BorderSide(color: genderCode == 2 ? Color(0xff6D00B0) : Color(0xffE4E5E7), width: 1)
                                                                        ),
                                                                        onPressed: () => {
                                                                          setState(() {
                                                                            genderCode = 2;
                                                                            gender.text = "??????";
                                                                            genderComleted = true;
                                                                            Navigator.pop(context);
                                                                          })
                                                                        }
                                                                    ),
                                                                  ),
                                                                  SizedBox(width: 15),
                                                                  ButtonTheme(
                                                                    minWidth: 83,
                                                                    height: 34,
                                                                    child: RaisedButton(
                                                                        child: Text("???????????????",
                                                                            style: TextStyle(
                                                                              color: Color(0xff494846),
                                                                            )
                                                                        ),
                                                                        color: Colors.white,
                                                                        shape: RoundedRectangleBorder(
                                                                            borderRadius: BorderRadius.circular(16),
                                                                            side: BorderSide(color: genderCode == 3 ? Color(0xff6D00B0) : Color(0xffE4E5E7), width: 1)
                                                                        ),
                                                                        onPressed: () => {
                                                                          setState(() {
                                                                            genderCode = 3;
                                                                            gender.text = "???????????????";
                                                                            genderComleted = true;
                                                                            Navigator.pop(context);
                                                                          })
                                                                        }
                                                                    ),
                                                                  ),
                                                                ])
                                                              ),
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
                                    color: Color(0xffF4F4F4),
                                    child: Column(children: [
                                      TextField(
                                        readOnly: true,
                                        decoration: InputDecoration(
                                          hintText: "??????????????? ??????????????????",
                                          suffixIcon: IconButton(
                                              onPressed: () {
                                                showModalBottomSheet(
                                                    context: context,
                                                    isScrollControlled: false,
                                                    builder: (context) {
                                                      return SingleChildScrollView(
                                                          child: Container(
                                                              decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.only(
                                                                    topLeft: Radius.circular(10),
                                                                    topRight: Radius.circular(10),
                                                                  )
                                                              ),
                                                            height: 402,
                                                            padding: EdgeInsets.only(
                                                              top: 20,
                                                                bottom: MediaQuery.of(context).viewInsets.bottom,
                                                              left: 16, right: 16
                                                            ),
                                                            child: Column(
                                                              children: [
                                                                ScrollDatePicker(
                                                                  height: 280,
                                                                  controller: controller,
                                                                  locale: DatePickerLocale.ko_kr,
                                                                  pickerDecoration: BoxDecoration(
                                                                      border: Border.all(color: Colors.blueAccent, width: 2.0)),
                                                                  config: DatePickerConfig(
                                                                      isLoop: true,
                                                                      selectedTextStyle: TextStyle(
                                                                          fontWeight: FontWeight.w600,
                                                                          color: Colors.black,
                                                                          fontSize: 20.0)),
                                                                  onChanged: (value) {
                                                                    setState(() {
                                                                      _selectedDate = value;
                                                                    });
                                                                  },
                                                                ),
                                                                Row(children: [
                                                                  Expanded(
                                                                    child: Container(
                                                                      height: 40,
                                                                      child: RaisedButton(
                                                                          child: const Text("????????????",
                                                                              style: TextStyle(
                                                                                color: Colors.white,
                                                                              )),
                                                                          color: Color(0xff6D00B0),
                                                                              // ?
                                                                              // : Color(0xffC192DE),
                                                                          shape: RoundedRectangleBorder(
                                                                            borderRadius: BorderRadius.circular(10.0),
                                                                          ),
                                                                          onPressed: () => {
                                                                            setState(() {
                                                                              birthDt.text = DateFormat("yyyy.MM.dd").format(_selectedDate);
                                                                              birthDtCompleted = true;
                                                                              Navigator.pop(context);
                                                                            })
                                                                          }
                                                                      ),
                                                                    ),
                                                                  )
                                                                ])
                                                              ]
                                                            )
                                                          )
                                                      );
                                                    }
                                                );
                                              },
                                              icon: Icon(Icons.expand_more, color: Colors.grey)
                                          ),
                                        ),
                                        controller: birthDt,
                                      ),
                                    ])
                                ),
                                Row(children: [
                                  Expanded(
                                    child: Container(
                                      height: 40,
                                      child: RaisedButton(
                                        child: const Text("??????",
                                            style: TextStyle(
                                              color: Colors.white,
                                            )),
                                        color: (genderComleted && birthDtCompleted)
                                            ? const Color(0xff6D00B0)
                                            : const Color(0xffC192DE),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                        onPressed: () => {
                                          setState(() {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => JoinEmail5()),
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
}
