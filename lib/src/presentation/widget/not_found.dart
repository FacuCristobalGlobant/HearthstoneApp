import 'package:flutter/material.dart';
import 'package:hearthstoneapp/src/core/util/assets.dart';
import 'package:hearthstoneapp/src/core/util/strings.dart';
import 'package:hearthstoneapp/src/core/util/styles.dart';

class NotFound extends StatelessWidget {
  const NotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Assets.notFoundImage),
            const Text(
              Strings.notFoundMessage,
              style: TextStyle(
                fontSize: Styles.xLargeFontSize,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
