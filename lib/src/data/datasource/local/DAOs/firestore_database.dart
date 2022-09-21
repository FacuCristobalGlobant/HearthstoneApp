import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hearthstoneapp/src/core/util/strings.dart';

class FirestoreDatabase {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> storeData(
    List<Map<String, dynamic>> listOfCards,
  ) async {
    final WriteBatch batch = _firestore.batch();
    listOfCards.forEach((card) {
      final DocumentReference docRef = _firestore
          .collection(Strings.collectionName)
          .doc(card['cardId'] as String);
      batch.set(
        docRef,
        card,
        SetOptions(merge: true),
      );
    });
    batch.commit();
  }

  Future<List<Map<String, dynamic>>> getFavorites() async {
    final List<Map<String, dynamic>> favorites = [];
    try {
      final QuerySnapshot snapshot = await _firestore
          .collection(Strings.collectionName)
          .where(
            Strings.favoriteField,
            isEqualTo: true,
          )
          .get();

      favorites.addAll(
        snapshot.docs.toList().map((e) => e.data()).toList(),
      );
    } catch (e) {
      throw Exception(e);
    }
    return favorites;
  }

  Future<bool> isFavorite(String cardId) async {
    bool exists = false;

    try {
      final DocumentSnapshot snapshot =
          await _firestore.collection(Strings.collectionName).doc(cardId).get();
      exists = snapshot.data()?[Strings.favoriteField] as bool? ?? false;
    } catch (_) {}
    return exists;
  }

  Future<bool> setFavorite(String cardId) async {
    final DocumentReference reference =
        _firestore.collection(Strings.collectionName).doc(cardId);
    await reference.update({Strings.favoriteField: true});
    return true;
  }

  Future<bool> removeFavorite(String cardId) async {
    try {
      await _firestore
          .collection(Strings.collectionName)
          .doc(cardId)
          .update({Strings.favoriteField: FieldValue.delete()});
    } catch (e) {
      throw Exception(e);
    }
    return false;
  }

  Future<List<Map<String, dynamic>>> getData({
    required Map<String, String> endpoint,
    required String keyword,
  }) async {
    try {
      final QuerySnapshot response = await _firestore
          .collection(Strings.collectionName)
          .where(
            endpoint['fieldName'],
            isGreaterThanOrEqualTo: keyword,
          )
          .where(
            endpoint['fieldName'],
            isLessThan: '${keyword}z',
          )
          .get();
      final List<Map<String, dynamic>> cardData =
          response.docs.toList().map((e) => e.data()).toList();
      return cardData;
    } catch (_) {
      throw Exception('Error reading data from firebase');
    }
  }
}
