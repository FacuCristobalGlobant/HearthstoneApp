import 'package:flutter/material.dart';
import 'package:hearthstoneapp/utils/constants.dart';
import 'package:hearthstoneapp/utils/palette.dart';

class LikeCounter extends StatefulWidget {
  final IconData icon;

  const LikeCounter({
    Key? key,
    this.icon = Icons.favorite,
  }) : super(key: key);

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
        width: Constants.iconBoxSize,
        padding: Constants.likeCounterPadding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Constants.likeCounterRadius),
          color: Palette.detailsColor,
        ),
        child: Stack(
          alignment: AlignmentDirectional.centerStart,
          children: [
            Icon(
              widget.icon,
              size: Constants.iconSize,
              color: Colors.white,
            ),
            Positioned(
              right: Constants.likeCounterCountRightDistance,
              child: Text(
                '$count',
                textAlign: TextAlign.center,
                style: Constants.iconFontTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}