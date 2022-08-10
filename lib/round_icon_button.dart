import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon, this.onTap});

  final Text icon;
  final VoidCallback ? onTap;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 5.0,
      child: icon,
      onPressed: onTap,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
