import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:hearthstoneapp/src/model/hearthstone_card.dart';

class CardListRepository {
  Future<List<HearthstoneCard>> readJson(String pathToJson) async {
    List<HearthstoneCard> listOfCards = [];

    final String response = await rootBundle.loadString(pathToJson);
    final List<dynamic> data = await json.decode(response);

    data.forEach((card) {
      HearthstoneCard currentCard =
          HearthstoneCard.fromJson(card as Map<String, dynamic>);
      listOfCards.add(currentCard);
    });

    return listOfCards;
  }
}
