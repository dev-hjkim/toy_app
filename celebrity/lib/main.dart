import 'package:flutter/material.dart';
import "join/join_email1.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Celebrity",
      home: JoinEmail1(),
    );
  }

}