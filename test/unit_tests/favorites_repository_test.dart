import 'package:flutter_test/flutter_test.dart';
import 'package:hearthstoneapp/src/data/datasource/local/DAOs/firestore_database.dart';
import 'package:hearthstoneapp/src/data/repository/favorites_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'favorites_repository_test.mocks.dart';

@GenerateMocks([FirestoreDatabase])
void main() {
  group('Fetch favorites', () {
    test('Fetch cards marked as favorites', () async {
      final firebaseDatabase = MockFirestoreDatabase();
      final FavoritesRepository favoritesRepository =
          FavoritesRepository(database: firebaseDatabase);

      when(
        firebaseDatabase.getFavorites(),
      ).thenAnswer(
        (_) => Future(
          () => [
            {
              'cardId': 'a',
              'name': 'ysera',
            },
          ],
        ),
      );
      expect(
        await favoritesRepository.getFavorites(),
        hasLength(1),
      );
    });
  });
}
