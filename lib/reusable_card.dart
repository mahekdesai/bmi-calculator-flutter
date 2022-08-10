import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({required this.rang, this.cardChild,this.onPress});

  final Color rang;
  final Widget ? cardChild;
  final VoidCallback ? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: rang,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}