import 'package:flutter/material.dart';
import 'constant.dart';

class genderWidget extends StatelessWidget {
genderWidget({required this.genderName, required this.iconName});

final String genderName;
final IconData iconName;

@override
Widget build(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Icon(
        iconName,
        size: 90.0,
      ),
      SizedBox(
        height: 15.0,
      ),
      Text(
        genderName,
        style: kLabelTextStyle,
      ),
    ],
  );
}
}
