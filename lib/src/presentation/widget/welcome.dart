import 'package:flutter/material.dart';
import 'package:hearthstoneapp/src/core/util/assets.dart';
import 'package:hearthstoneapp/src/core/util/palette.dart';
import 'package:hearthstoneapp/src/core/util/strings.dart';
import 'package:hearthstoneapp/src/core/util/styles.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: Styles.welcomeContainerPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(Assets.hearthstoneFullLogo),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Palette.boxColor,
                padding: Styles.welcomeButtonPadding,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              child: const Padding(
                padding: Styles.welcomeButtonTextPadding,
                child: Text(
                  Strings.searchWelcomeButtonText,
                  textScaleFactor: Styles.welcomeButtonTextScaleFactor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
