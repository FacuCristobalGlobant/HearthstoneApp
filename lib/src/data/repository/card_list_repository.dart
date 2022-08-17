import 'dart:convert';
import 'dart:io';

import 'package:hearthstoneapp/src/data/datasource/remote/api_service.dart';
import 'package:hearthstoneapp/src/data/model/hearthstone_card.dart';

class CardListRepository {
  late final ApiService datasource;
  Future<List<HearthstoneCard>> getData({String endpoint = ''}) async {
    final List<HearthstoneCard> listOfCards = [];

    try {
      final response = await datasource.getData(endpoint: endpoint);

      if (response.statusCode == HttpStatus.ok) {
        final List<dynamic> jsonResponse =
            jsonDecode(response.body) as List<dynamic>;
        jsonResponse.forEach((card) {
          final HearthstoneCard currentCard =
              HearthstoneCard.fromJson(card as Map<String, dynamic>);
          listOfCards.add(currentCard);
        });
      }
    } catch (e) {
      throw Exception('there was an error retrieving data');
    }

    return listOfCards;
  }

  CardListRepository({ApiService? datasource}) {
    this.datasource = datasource ?? ApiService();
  }
}
