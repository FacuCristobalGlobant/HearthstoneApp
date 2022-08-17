import 'package:flutter/material.dart';
import 'package:hearthstoneapp/src/core/util/custom_flex.dart';
import 'package:hearthstoneapp/src/core/util/keys.dart';
import 'package:hearthstoneapp/src/core/util/styles.dart';

class CardProperty extends StatelessWidget {
  final double fontSize;
  final Color color;
  final String propertyName;
  final Widget child;
  final FontWeight weight;
  final bool visibility;

  const CardProperty({
    super.key,
    required this.propertyName,
    required this.child,
    this.fontSize = Styles.mediumFontSize,
    this.color = Colors.white,
    this.weight = FontWeight.normal,
    this.visibility = true,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      key: Keys.cardPropertyKey,
      visible: visibility,
      child: Padding(
        padding: Styles.verticalSmallPadding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: CustomFlex.small,
              child: Text(
                propertyName,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: fontSize,
                  color: color,
                  fontWeight: weight,
                ),
              ),
            ),
            Flexible(
              flex: CustomFlex.medium,
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
