import 'dart:convert';
import 'dart:io';

import 'package:hearthstoneapp/src/data/datasource/i_api_datasource.dart';
import 'package:hearthstoneapp/src/data/datasource/local/DAOs/firestore_database.dart';
import 'package:hearthstoneapp/src/data/datasource/remote/api_service.dart';
import 'package:hearthstoneapp/src/data/model/hearthstone_card.dart';

class CardListRepository {
  late final IApiDatasource _datasource;
  late final FirestoreDatabase? _firestoreDatabase;
  Future<List<HearthstoneCard>> getData({
    required Map<String, String> endpoint,
    required String keyword,
  }) async {
    final List<HearthstoneCard> listOfCards = [];

    try {
      final List<Map<String, dynamic>> listToSave = [];
      final response =
          await _datasource.getData(endpoint: endpoint, keyword: keyword);
      if (response.statusCode == HttpStatus.ok) {
        final List<dynamic> decodedResponse =
            jsonDecode(response.body) as List<dynamic>;
        decodedResponse.forEach((card) {
          final HearthstoneCard currentCard =
              HearthstoneCard.fromJson(card as Map<String, dynamic>);
          listToSave.add(card);
          listOfCards.add(currentCard);
        });
        _firestoreDatabase!.storeData(listToSave);
      }
    } catch (e) {
      try {
        final List<Map<String, dynamic>> listToSave = [];
        final response = await _firestoreDatabase!.getData(
          endpoint: endpoint,
          keyword: keyword,
        );
        response.forEach((card) {
          final HearthstoneCard currentCard = HearthstoneCard.fromJson(card);
          listToSave.add(card);
          listOfCards.add(currentCard);
        });
      } catch (e) {
        throw Exception('there was an error retrieving data');
      }
    }

    return listOfCards;
  }

  CardListRepository({
    IApiDatasource? datasource,
    FirestoreDatabase? fsDatabase,
  }) {
    _datasource = datasource ?? ApiService();
    _firestoreDatabase = fsDatabase;
  }
}
