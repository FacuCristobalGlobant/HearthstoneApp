import 'package:flutter/material.dart';
import 'package:hearthstoneapp/src/core/util/palette.dart';
import 'package:hearthstoneapp/src/core/util/strings.dart';
import 'package:hearthstoneapp/src/presentation/bloc/favorites_bloc.dart';
import 'package:hearthstoneapp/src/presentation/bloc/list_of_cards_bloc.dart';
import 'package:hearthstoneapp/src/presentation/widget/card_list_builder.dart';
import 'package:hearthstoneapp/src/presentation/widget/search_menu.dart';

class ListOfCards extends StatelessWidget {
  late final HearthstoneCardListBloc hearthstoneCardListBloc;
  late final FavoritesBloc favoritesBloc;
  ListOfCards({
    super.key,
    HearthstoneCardListBloc? hearthstoneCardListBloc,
    FavoritesBloc? favoritesBloc,
  }) {
    this.hearthstoneCardListBloc =
        hearthstoneCardListBloc ?? HearthstoneCardListBloc();
    this.favoritesBloc = favoritesBloc ?? FavoritesBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: SearchMenu(
          hearthstoneCardListBloc: hearthstoneCardListBloc,
          favoritesBloc: favoritesBloc,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Palette.boxColor,
        title: Strings.listViewTitle,
      ),
      body: CardListBuilder(
        hearthstoneCardListBloc.getCardListStream(),
        favoritesBloc,
      ),
    );
  }
}
