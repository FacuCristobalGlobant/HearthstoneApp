import 'package:flutter/material.dart';
import 'package:hearthstoneapp/src/core/util/assets.dart';
import 'package:hearthstoneapp/src/core/util/keys.dart';
import 'package:hearthstoneapp/src/core/util/palette.dart';
import 'package:hearthstoneapp/src/core/util/strings.dart';
import 'package:hearthstoneapp/src/core/util/styles.dart';
import 'package:hearthstoneapp/src/data/model/hearthstone_card.dart';
import 'package:hearthstoneapp/src/presentation/bloc/favorites_bloc.dart';
import 'package:hearthstoneapp/src/presentation/widget/card_property.dart';
import 'package:hearthstoneapp/src/presentation/widget/favorite.dart';
import 'package:hearthstoneapp/src/presentation/widget/like_counter.dart';
import 'package:hearthstoneapp/src/presentation/widget/mechanics.dart';
import 'package:hearthstoneapp/src/presentation/widget/outlined_text.dart';

class CardView extends StatelessWidget {
  final HearthstoneCard card;
  final FavoritesBloc favoritesBloc;

  const CardView({
    super.key,
    required this.card,
    required this.favoritesBloc,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Keys.cardWidgetKey,
      appBar: AppBar(
        backgroundColor: Palette.boxColor,
        title: Strings.cardViewTitle,
      ),
      body: SingleChildScrollView(
        child: DecoratedBox(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: [
              Container(
                margin: Styles.topMediumMargin,
                height: Styles.cardNameContainerHeight,
                child: SizedBox(
                  width: Styles.detailsTitleWidth,
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Positioned(
                        left: Styles.likeCounterRightDistance,
                        child: Favorite(
                          card: card,
                          favoritesBloc: favoritesBloc,
                        ),
                      ),
                      const Positioned(
                        right: Styles.likeCounterRightDistance,
                        child: LikeCounter(),
                      ),
                      OutlinedText(
                        text: card.name!,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: Styles.largePadding,
                child: card.image != null
                    ? Image.network(
                        card.image!,
                        errorBuilder: (context, error, _) => Center(
                          child: Image.asset(Assets.defaultImage),
                        ),
                        loadingBuilder: (
                          BuildContext context,
                          Widget child,
                          ImageChunkEvent? loadingProgress,
                        ) {
                          if (loadingProgress == null) {
                            return child;
                          }
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          );
                        },
                      )
                    : Image.asset(Assets.defaultImage),
              ),
              Container(
                margin: Styles.propertyContainerMargin,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Styles.containerRadius),
                  color: Palette.primaryColor,
                  boxShadow: Styles.containerShadow,
                ),
                child: Padding(
                  padding: Styles.mediumPadding,
                  child: Column(
                    children: [
                      CardProperty(
                        propertyName: Strings.cardIdLabel,
                        visibility: card.cardId != null,
                        child: Text(
                          card.cardId ?? Strings.emptyString,
                          style: Styles.propertyTextStyle,
                        ),
                      ),
                      CardProperty(
                        propertyName: Strings.cardTypeLabel,
                        visibility: card.type != null,
                        child: Text(
                          card.type ?? Strings.emptyString,
                          style: Styles.propertyTextStyle,
                        ),
                      ),
                      CardProperty(
                        propertyName: Strings.cardFactionLabel,
                        visibility: card.faction != null,
                        child: Text(
                          card.faction ?? Strings.emptyString,
                          style: Styles.propertyTextStyle,
                        ),
                      ),
                      CardProperty(
                        propertyName: Strings.cardSetLabel,
                        visibility: card.cardSet != null,
                        child: Text(
                          card.cardSet ?? Strings.emptyString,
                          style: Styles.propertyTextStyle,
                          textAlign: TextAlign.end,
                        ),
                      ),
                      CardProperty(
                        propertyName: Strings.cardPlayerClassLabel,
                        visibility: card.playerClass != null,
                        child: Text(
                          card.playerClass ?? Strings.emptyString,
                          style: Styles.propertyTextStyle,
                        ),
                      ),
                      CardProperty(
                        propertyName: Strings.cardHealthLabel,
                        visibility: card.health != null,
                        child: Text(
                          card.health.toString(),
                          style: Styles.propertyTextStyle,
                        ),
                      ),
                      CardProperty(
                        propertyName: Strings.cardCostLabel,
                        visibility: card.cost != null,
                        child: Text(
                          card.cost.toString(),
                          style: Styles.propertyTextStyle,
                        ),
                      ),
                      CardProperty(
                        propertyName: Strings.cardAttackLabel,
                        visibility: card.attack != null,
                        child: Text(
                          card.attack.toString(),
                          style: Styles.propertyTextStyle,
                        ),
                      ),
                      CardProperty(
                        propertyName: Strings.cardMechanicsLabel,
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
                  padding: Styles.largePadding,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        Strings.cardAbilityLabel,
                        style: TextStyle(
                          fontSize: Styles.abilityLabelFontSize,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        card.text ?? Strings.emptyString,
                        style: const TextStyle(
                          fontSize: Styles.mediumFontSize,
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
