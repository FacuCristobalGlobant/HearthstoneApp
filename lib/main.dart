import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hearthstoneapp/CustomAttribute.dart';
import 'package:hearthstoneapp/OutlinedText.dart';
import 'package:hearthstoneapp/Palette.dart';
import 'package:hearthstoneapp/LikeCounter.dart';

void main() => runApp(const HearthStoneApp());


class HearthStoneApp extends StatelessWidget {
  const HearthStoneApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Palette.detailsColor,
        ),
        body: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: ListView(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  child: Stack(
                    children: const [
                      Center(
                        child: OutlinedText(text: 'Ysera')
                      ),
                      Positioned(
                        top: 0,
                        right: 40,
                        child: LikeCounter(),
                      ),
                    ],
                  ),
                ),
                const Image(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/EX1_572.png'),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Palette.primaryColor,
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(3, 3),
                        color: Color(0x332222222),
                        blurRadius: 3
                      ),
                      BoxShadow(
                          color: Color(0x33ffffff),
                          offset: Offset(-3, -3),
                          blurRadius: 3
                      )
                    ]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            CustomAttribute(
                              text: 'Type:',
                            ),
                            CustomAttribute(
                              text: 'Faction:',
                            ),
                            CustomAttribute(
                              text: 'Rarity:',
                            ),
                            CustomAttribute(
                              text: 'Cost:',
                            ),
                            CustomAttribute(
                              text: 'Attack:',
                            ),
                            CustomAttribute(
                              text: 'Health:',
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: const [
                            CustomAttribute(
                              text: 'Minion',
                            ),
                            CustomAttribute(
                              text: 'Neutral',
                            ),
                            CustomAttribute(
                              text: 'Legendary',
                            ),
                            CustomAttribute(
                              text: '9',
                            ),
                            CustomAttribute(
                              text: '4',
                            ),
                            CustomAttribute(
                              text: '12',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Ability',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        'At the end of your turn, add a Dream Card to your hand.',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}