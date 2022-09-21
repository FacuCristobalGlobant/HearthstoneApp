import 'package:flutter/material.dart';
import 'package:hearthstoneapp/src/core/util/api_properties.dart';
import 'package:hearthstoneapp/src/core/util/assets.dart';
import 'package:hearthstoneapp/src/core/util/palette.dart';
import 'package:hearthstoneapp/src/core/util/strings.dart';
import 'package:hearthstoneapp/src/core/util/styles.dart';
import 'package:hearthstoneapp/src/presentation/bloc/favorites_bloc.dart';
import 'package:hearthstoneapp/src/presentation/bloc/list_of_cards_bloc.dart';
import 'package:hearthstoneapp/src/presentation/widget/drawer_button.dart';
import 'package:hearthstoneapp/src/presentation/widget/favorites_list.dart';

class SearchMenu extends StatefulWidget {
  final HearthstoneCardListBloc hearthstoneCardListBloc;
  final FavoritesBloc favoritesBloc;

  const SearchMenu({
    super.key,
    required this.hearthstoneCardListBloc,
    required this.favoritesBloc,
  });

  @override
  State<SearchMenu> createState() => _SearchMenuState();
}

class _SearchMenuState extends State<SearchMenu> {
  String keyword = Strings.emptyString;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Column(
          children: [
            ColoredBox(
              color: Palette.boxColor,
              child: Padding(
                padding: Styles.drawerHeaderPadding,
                child: Column(
                  children: [
                    Image.asset(
                      Assets.hearthstoneLogo,
                      height: Styles.drawerLogoHeight,
                    ),
                    Container(
                      margin: Styles.drawerTextInputMargin,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Styles.containerRadius),
                        color: Colors.white,
                      ),
                      child: TextField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: Strings.searchInputHintText,
                        ),
                        onChanged: (String value) async {
                          keyword = value;
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: Styles.drawerButtonContainerPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  DrawerButton(
                    onClickAction: () {
                      widget.hearthstoneCardListBloc.searchForCards(
                        ApiProperties.byName,
                        keyword,
                      );
                      Scaffold.of(context).closeDrawer();
                    },
                    text: Strings.searchByNameText,
                  ),
                  DrawerButton(
                    onClickAction: () {
                      widget.hearthstoneCardListBloc.searchForCards(
                        ApiProperties.byFaction,
                        keyword,
                      );
                      Scaffold.of(context).closeDrawer();
                    },
                    text: Strings.searchByFactionText,
                  ),
                  DrawerButton(
                    onClickAction: () {
                      widget.hearthstoneCardListBloc.searchForCards(
                        ApiProperties.byCardSet,
                        keyword,
                      );
                      Scaffold.of(context).closeDrawer();
                    },
                    text: Strings.searchBySetText,
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: Styles.drawerButtonContainerPadding,
          child: DrawerButton(
            onClickAction: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    widget.favoritesBloc.getFavorites();
                    return Scaffold(
                      appBar: AppBar(
                        backgroundColor: Palette.boxColor,
                        title: const Text(Strings.favoritesTitle),
                      ),
                      body: FavoritesList(
                        widget.favoritesBloc,
                      ),
                    );
                  },
                ),
              );
            },
            text: Strings.favoritesTitle,
            color: Colors.indigo[500]!,
          ),
        )
      ],
    );
  }
}
