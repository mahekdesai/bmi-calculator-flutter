import 'package:bmi/result_page.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';

void main() {
  runApp(bmi());
}

class bmi extends StatelessWidget {
  const bmi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(
          color: Color(0xFF0A0E21),
        ),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: InputPage(),
    );
  }
}


