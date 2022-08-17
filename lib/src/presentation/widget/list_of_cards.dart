import 'package:flutter/material.dart';
import 'package:hearthstoneapp/src/core/util/api_response_state.dart';
import 'package:hearthstoneapp/src/core/util/palette.dart';
import 'package:hearthstoneapp/src/core/util/strings.dart';
import 'package:hearthstoneapp/src/core/util/styles.dart';
import 'package:hearthstoneapp/src/presentation/bloc/list_of_cards_bloc.dart';
import 'package:hearthstoneapp/src/presentation/widget/card.dart';
import 'package:hearthstoneapp/src/presentation/widget/grid_card_item.dart';
import 'package:hearthstoneapp/src/presentation/widget/not_found.dart';
import 'package:hearthstoneapp/src/presentation/widget/search_menu.dart';
import 'package:hearthstoneapp/src/presentation/widget/welcome.dart';

class ListOfCards extends StatelessWidget {
  late final HearthstoneCardListBloc hearthstoneCardListBloc;
  ListOfCards({super.key, HearthstoneCardListBloc? hearthstoneCardListBloc}) {
    this.hearthstoneCardListBloc =
        hearthstoneCardListBloc ?? HearthstoneCardListBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: SearchMenu(
          hearthstoneCardListBloc: hearthstoneCardListBloc,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Palette.boxColor,
        title: Strings.listViewTitle,
      ),
      body: StreamBuilder<ApiResponse>(
        stream: hearthstoneCardListBloc.getCardListStream(),
        builder: (context, snapshot) {
          final List<Widget> children = [];
          if (snapshot.hasData) {
            if (snapshot.data!.state == ApiResponseState.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.data!.state == ApiResponseState.empty) {
              return const NotFound();
            }
            snapshot.data?.listOfCards!.forEach((hearthstoneCard) {
              children.add(
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CardView(
                          card: hearthstoneCard,
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
          } else if (snapshot.hasError) {
            children.add(
              Text(
                snapshot.error.toString(),
              ),
            );
          } else {
            return const Center(
              child: Home(),
            );
          }
          return GridView.count(
            padding: Styles.smallPadding,
            crossAxisCount: Styles.gridItemsPerRow,
            mainAxisSpacing: Styles.gritItemSpacing,
            crossAxisSpacing: Styles.gritItemSpacing,
            childAspectRatio: Styles.gridItemAspectRatio,
            children: children,
          );
        },
      ),
    );
  }
}
