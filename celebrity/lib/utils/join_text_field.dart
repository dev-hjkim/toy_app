import "package:flutter/material.dart";


class JoinTextField extends StatelessWidget {
  final String fieldName;
  final Color buttonColor;

  JoinTextField({required this.fieldName, required this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(this.fieldName),
          TextField(
            decoration: InputDecoration(
              hintText: this.fieldName + "을(를) 입력해주세요."
            ),
          )
        ]
      )
    );
  }

}