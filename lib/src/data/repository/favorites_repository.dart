import 'package:hearthstoneapp/src/data/datasource/local/DAOs/firestore_database.dart';
import 'package:hearthstoneapp/src/data/model/hearthstone_card.dart';
import 'package:hearthstoneapp/src/domain/repository/i_favorites_repository.dart';

class FavoritesRepository extends IFavoritesRepository {
  late FirestoreDatabase firestoreDatabase;

  FavoritesRepository({FirestoreDatabase? database}) {
    firestoreDatabase = database ?? FirestoreDatabase();
  }

  @override
  Future<void> removeFavorite(String cardId) async {
    await firestoreDatabase.removeFavorite(cardId);
  }

  @override
  Future<void> setFavorite(String cardId) async {
    await firestoreDatabase.setFavorite(cardId);
  }

  @override
  Future<bool> isFavorite(String cardId) async {
    return firestoreDatabase.isFavorite(cardId);
  }

  Future<List<HearthstoneCard>> getFavorites() async {
    final List<HearthstoneCard> listOfCards = [];
    try {
      final response = await firestoreDatabase.getFavorites();
      response.forEach((card) {
        final HearthstoneCard currentCard = HearthstoneCard.fromJson(card);
        listOfCards.add(currentCard);
      });
    } catch (e) {
      throw Exception(e);
    }
    return listOfCards;
  }
}
