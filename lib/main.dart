import 'package:flutter/material.dart';
import 'package:hearthstoneapp/utils/constants.dart';
import 'package:hearthstoneapp/utils/palette.dart';
import 'package:hearthstoneapp/hearthstone_card.dart';
import 'package:hearthstoneapp/widgets/card_property.dart';
import 'package:hearthstoneapp/widgets/outlined_text.dart';
import 'package:hearthstoneapp/widgets/like_counter.dart';

void main() => runApp(HearthStoneApp());

class HearthStoneApp extends StatelessWidget {
  HearthStoneApp({Key? key}) : super(key: key);

  final HearthstoneCard card = HearthstoneCard(
    "Ysera",
    "Minion",
    "Neutral",
    "Legendary",
    9,
    4,
    12,
    'At the end of your turn, add a Dream Card to your hand.',
    'assets/images/EX1_572.png',
  );

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
                  margin: Constants.cardNameContainerMargin,
                  height: Constants.cardNameContainerHeight,
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      const Positioned(
                        top: Constants.likeCounterTopDistance,
                        right: Constants.likeCounterRightDistance,
                        child: LikeCounter(),
                      ),
                      OutlinedText(
                        text: card.name,
                      ),
                    ],
                  ),
                ),
                Image(
                  fit: BoxFit.cover,
                  image: card.image,
                ),
                Container(
                  margin: Constants.propertyContainerMargin,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        Constants.propertyContainerRadius),
                    color: Palette.primaryColor,
                    boxShadow: Constants.propertyContainerShadow,
                  ),
                  child: Padding(
                    padding: Constants.propertyContainerPadding,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            CardProperty(
                              text: Constants.cardTypeLabel,
                            ),
                            CardProperty(
                              text: Constants.cardFactionLabel,
                            ),
                            CardProperty(
                              text: Constants.cardRarityLabel,
                            ),
                            CardProperty(
                              text: Constants.cardCostLabel,
                            ),
                            CardProperty(
                              text: Constants.cardAttackLabel,
                            ),
                            CardProperty(
                              text: Constants.cardHeathLabel,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            CardProperty(
                              text: card.type,
                            ),
                            CardProperty(
                              text: card.faction,
                            ),
                            CardProperty(
                              text: card.rarity,
                            ),
                            CardProperty(
                              text: card.cost.toString(),
                            ),
                            CardProperty(
                              text: card.attack.toString(),
                            ),
                            CardProperty(
                              text: card.health.toString(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: Constants.abilityLabelPadding,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        Constants.cardAbilityLabel,
                        style: TextStyle(
                          fontSize: Constants.abilityLabelFontSize,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        card.ability,
                        style: const TextStyle(
                          fontSize: Constants.abilityFontSize,
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
