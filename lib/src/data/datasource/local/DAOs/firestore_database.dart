import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreDatabase {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> storeData(
    List<Map<String, dynamic>> listOfCards,
  ) async {
    final WriteBatch batch = _firestore.batch();
    listOfCards.forEach((card) {
      final DocumentReference docRef =
          _firestore.collection('cards').doc(card['cardId'] as String);
      batch.set(
        docRef,
        card,
        SetOptions(merge: true),
      );
    });
    batch.commit();
  }

  Future<List<Map<String, dynamic>>> getData({
    required Map<String, String> endpoint,
    required String keyword,
  }) async {
    try {
      final QuerySnapshot response = await _firestore
          .collection('cards')
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
