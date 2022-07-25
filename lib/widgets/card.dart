import 'package:flutter/material.dart';
import 'package:hearthstoneapp/src/model/hearthstone_card.dart';
import 'package:hearthstoneapp/utils/constants.dart';
import 'package:hearthstoneapp/utils/palette.dart';
import 'package:hearthstoneapp/widgets/card_property.dart';
import 'package:hearthstoneapp/widgets/like_counter.dart';
import 'package:hearthstoneapp/widgets/mechanics.dart';
import 'package:hearthstoneapp/widgets/outlined_text.dart';

class CardView extends StatelessWidget {
  final HearthstoneCard card;

  const CardView({
    Key? key,
    required this.card,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.boxColor,
        title: Constants.cardViewTitle,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: [
              Container(
                margin: Constants.cardNameContainerMargin,
                height: Constants.cardNameContainerHeight,
                child: SizedBox(
                  width: Constants.detailsTitleWidth,
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      const Positioned(
                        right: Constants.likeCounterRightDistance,
                        child: LikeCounter(),
                      ),
                      OutlinedText(
                        text: card.name,
                      ),
                    ],
                  ),
                ),
              ),
              Image(
                image: card.image,
              ),
              Container(
                margin: Constants.propertyContainerMargin,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(Constants.containerRadius),
                  color: Palette.primaryColor,
                  boxShadow: Constants.containerShadow,
                ),
                child: Padding(
                  padding: Constants.propertyContainerPadding,
                  child: Column(
                    children: [
                      CardProperty(
                        propertyName: Constants.cardIdLabel,
                        child: Text(
                          card.cardId,
                          style: Constants.propertyTextStyle,
                        ),
                      ),
                      CardProperty(
                        propertyName: Constants.cardTypeLabel,
                        child: Text(
                          card.type,
                          style: Constants.propertyTextStyle,
                        ),
                      ),
                      CardProperty(
                        propertyName: Constants.cardSetLabel,
                        child: Text(
                          card.cardSet,
                          style: Constants.propertyTextStyle,
                        ),
                      ),
                      CardProperty(
                        propertyName: Constants.cardPlayerClassLabel,
                        child: Text(
                          card.playerClass,
                          style: Constants.propertyTextStyle,
                        ),
                      ),
                      CardProperty(
                        propertyName: Constants.cardHealthLabel,
                        visibility: card.health != null,
                        child: Text(
                          card.health.toString(),
                          style: Constants.propertyTextStyle,
                        ),
                      ),
                      CardProperty(
                        propertyName: Constants.cardCostLabel,
                        visibility: card.cost != null,
                        child: Text(
                          card.cost.toString(),
                          style: Constants.propertyTextStyle,
                        ),
                      ),
                      CardProperty(
                        propertyName: Constants.cardAttackLabel,
                        visibility: card.attack != null,
                        child: Text(
                          card.attack.toString(),
                          style: Constants.propertyTextStyle,
                        ),
                      ),
                      CardProperty(
                        propertyName: Constants.cardMechanicsLabel,
                        visibility: card.mechanics.isNotEmpty,
                        child: Mechanics(
                          listOfMechanics: card.mechanics,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: card.text != null,
                child: Padding(
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
                        card.text ?? Constants.emptyString,
                        style: const TextStyle(
                          fontSize: Constants.mediumFontSize,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
