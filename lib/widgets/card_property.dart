import 'package:flutter/material.dart';
import 'package:hearthstoneapp/utils/constants.dart';
import 'package:hearthstoneapp/utils/custom_flex.dart';

class CardProperty extends StatelessWidget {
  final double fontSize;
  final Color color;
  final String propertyName;
  final Widget child;
  final FontWeight weight;
  final bool visibility;

  const CardProperty({
    Key? key,
    this.fontSize = Constants.mediumFontSize,
    this.color = Colors.white,
    this.weight = FontWeight.normal,
    required this.child,
    required this.propertyName,
    this.visibility = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visibility,
      child: Padding(
        padding: Constants.verticalSmallPadding,
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
