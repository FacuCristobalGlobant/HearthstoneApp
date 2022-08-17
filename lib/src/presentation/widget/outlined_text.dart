import 'package:flutter/material.dart';
import 'package:hearthstoneapp/src/core/util/styles.dart';

class OutlinedText extends StatelessWidget {
  final double fontSize;
  final Color fill;
  final Color outlineColor;
  final String fontFamily;
  final String text;
  final double strokeWidth;

  const OutlinedText({
    super.key,
    required this.text,
    this.fontSize = Styles.xLargeFontSize,
    this.fill = Colors.white,
    this.outlineColor = Colors.black87,
    this.fontFamily = Styles.outlinedTextDefaultFont,
    this.strokeWidth = Styles.outlinedTextDefaultStrokeWidth,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * Styles.cardNameWidthFactor,
      child: Stack(
        alignment: AlignmentDirectional.center,
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
            textAlign: TextAlign.center,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: fontSize,
              fontFamily: fontFamily,
              color: fill,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
