import 'package:flutter/material.dart';
import 'package:hearthstoneapp/src/core/util/constants.dart';
import 'package:hearthstoneapp/src/core/util/custom_flex.dart';
import 'package:hearthstoneapp/src/core/util/palette.dart';
import 'package:hearthstoneapp/src/data/model/hearthstone_card.dart';
import 'package:hearthstoneapp/src/data/repository/card_list_repository.dart';
import 'package:hearthstoneapp/src/presentation/widget/card.dart';

class ListOfCards extends StatelessWidget {
  ListOfCards({super.key});
  final CardListRepository repository = CardListRepository();
  late final Future<List<HearthstoneCard>> listOfCards;

  @override
  Widget build(BuildContext context) {
    listOfCards = repository.readJson(Constants.jsonPath);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.boxColor,
        title: Constants.listViewTitle,
      ),
      body: FutureBuilder(
        future: listOfCards,
        builder: (
          context,
          AsyncSnapshot<List<HearthstoneCard>> snapshot,
        ) {
          final List<Widget> children = [];
          if (snapshot.hasData) {
            snapshot.data?.forEach((hearthstoneCard) {
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
                  child: Container(
                    margin: Constants.listItemMargin,
                    padding: Constants.listItemPadding,
                    decoration: BoxDecoration(
                      color: Palette.primaryColor,
                      borderRadius:
                          BorderRadius.circular(Constants.containerRadius),
                      boxShadow: Constants.containerShadow,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: CustomFlex.large,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Center(
                                child: Padding(
                                  padding: Constants.verticalSmallPadding,
                                  child: Text(
                                    hearthstoneCard.name,
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: Constants.mediumFontSize,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              Text(
                                hearthstoneCard.type,
                                style: Constants.iconFontTextStyle,
                              ),
                              Text(
                                hearthstoneCard.cardSet,
                                style: Constants.iconFontTextStyle,
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          flex: CustomFlex.medium,
                          child: Image(
                            alignment: Alignment.centerRight,
                            fit: BoxFit.cover,
                            image: hearthstoneCard.image,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            });
          } else if (snapshot.hasError) {
            children.add(
              Constants.jsonReadingError,
            );
          } else {
            children.add(
              Constants.jsonReadingLoading,
            );
          }
          return SingleChildScrollView(
            child: Column(
              children: children,
            ),
          );
        },
      ),
    );
  }
}
