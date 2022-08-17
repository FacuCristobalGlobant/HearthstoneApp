import 'package:flutter/material.dart';
import 'package:hearthstoneapp/src/core/util/keys.dart';
import 'package:hearthstoneapp/src/core/util/palette.dart';
import 'package:hearthstoneapp/src/core/util/styles.dart';

class DrawerButton extends StatelessWidget {
  final Function onClickAction;
  final String text;
  const DrawerButton({
    super.key,
    required this.onClickAction,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      key: Keys.drawerButtonKey,
      margin: Styles.topMediumMargin,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Palette.boxColor,
          padding: Styles.mediumPadding,
        ),
        onPressed: () {
          onClickAction();
        },
        child: Text(
          text,
          style: const TextStyle(
            fontSize: Styles.mediumFontSize,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
