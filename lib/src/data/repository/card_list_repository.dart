import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:hearthstoneapp/src/data/model/hearthstone_card.dart';

class CardListRepository {
  Future<List<HearthstoneCard>> readJson(String pathToJson) async {
    final List<HearthstoneCard> listOfCards = [];

    final String response = await rootBundle.loadString(pathToJson);
    final List<dynamic> data = await json.decode(response) as List<dynamic>;

    data.forEach((card) {
      final HearthstoneCard currentCard =
          HearthstoneCard.fromJson(card as Map<String, dynamic>);
      listOfCards.add(currentCard);
    });

    return listOfCards;
  }
}
