import 'package:flutter/material.dart';
import 'package:hearthstoneapp/src/core/util/strings.dart';
import 'package:hearthstoneapp/src/core/util/styles.dart';
import 'package:hearthstoneapp/src/data/model/hearthstone_card.dart';
import 'package:hearthstoneapp/src/presentation/bloc/favorites_bloc.dart';
import 'package:hearthstoneapp/src/presentation/widget/card.dart';
import 'package:hearthstoneapp/src/presentation/widget/grid_card_item.dart';

class CardListContainer extends StatelessWidget {
  final List<HearthstoneCard> listOfCards;
  final FavoritesBloc favoritesBloc;

  const CardListContainer(this.listOfCards, this.favoritesBloc);

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [];
    listOfCards.forEach((hearthstoneCard) {
      children.add(
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CardView(
                  card: hearthstoneCard,
                  favoritesBloc: favoritesBloc,
                ),
              ),
            );
          },
          child: GridCardItem(
            image: hearthstoneCard.image,
            name: hearthstoneCard.name ?? Strings.emptyString,
            cardSet: hearthstoneCard.cardSet ?? Strings.emptyString,
            type: hearthstoneCard.type ?? Strings.emptyString,
          ),
        ),
      );
    });
    return GridView.count(
      padding: Styles.smallPadding,
      crossAxisCount: Styles.gridItemsPerRow,
      mainAxisSpacing: Styles.gritItemSpacing,
      crossAxisSpacing: Styles.gritItemSpacing,
      childAspectRatio: Styles.gridItemAspectRatio,
      children: children,
    );
  }
}
