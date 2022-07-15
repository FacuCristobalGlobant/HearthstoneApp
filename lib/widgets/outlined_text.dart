import 'package:flutter/material.dart';

class OutlinedText extends StatelessWidget {
  final double fontSize;
  final Color fill;
  final Color outlineColor;
  final String fontFamily;
  final String text;
  final double strokeWidth;

  const OutlinedText({
    Key? key,
    required this.text,
    this.fontSize = 50,
    this.fill = Colors.white,
    this.outlineColor = Colors.black87,
    this.fontFamily = "BigshotOne",
    this.strokeWidth = 6,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontFamily: fontFamily,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = strokeWidth
              ..color = outlineColor,
          ),
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontFamily: fontFamily,
            color: fill,
          ),
        ),
      ],
    );
  }
}
