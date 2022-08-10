import 'package:flutter/material.dart';
import 'constant.dart';

class BottomButton extends StatelessWidget {
  BottomButton({required this.onTap,required this.text});

  final VoidCallback ? onTap;
  final String text;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            text,
            style: kBottomButtonStyle,
          ),
        ),
        color: kBottomContainerColor,
        width: double.infinity,
        height: kBottomHeight,
        margin: EdgeInsets.only(top: 10.0),
      ),
    );
  }
}