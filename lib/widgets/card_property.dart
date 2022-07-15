import 'package:flutter/material.dart';

class CardProperty extends StatelessWidget {
  final double fontSize;
  final Color color;
  final String text;
  final FontWeight weight;

  const CardProperty({
    Key? key,
    this.fontSize = 20,
    this.color = Colors.white,
    required this.text,
    this.weight = FontWeight.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: weight,
      ),
    );
  }
}
