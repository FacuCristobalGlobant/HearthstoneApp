import 'package:flutter/material.dart';
import 'package:hearthstoneapp/src/core/util/palette.dart';
import 'package:hearthstoneapp/src/core/util/styles.dart';

class LikeCounter extends StatefulWidget {
  final IconData icon;

  const LikeCounter({
    super.key,
    this.icon = Icons.favorite,
  });

  @override
  LikeCounterState createState() => LikeCounterState();
}

class LikeCounterState extends State<LikeCounter> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          count++;
        });
      },
      child: Container(
        width: Styles.iconBoxSize,
        padding: Styles.smallPadding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Styles.likeCounterRadius),
          color: Palette.detailsColor,
        ),
        child: Stack(
          alignment: AlignmentDirectional.centerStart,
          children: [
            Icon(
              widget.icon,
              size: Styles.iconSize,
              color: Colors.white,
            ),
            Positioned(
              right: Styles.likeCounterCountRightDistance,
              child: Text(
                '$count',
                textAlign: TextAlign.center,
                style: Styles.iconFontTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
