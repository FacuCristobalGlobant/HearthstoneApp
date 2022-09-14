import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hearthstoneapp/src/core/util/api_properties.dart';
import 'package:hearthstoneapp/src/data/datasource/local/DAOs/firestore_database.dart';
import 'package:hearthstoneapp/src/data/datasource/remote/api_service.dart';
import 'package:hearthstoneapp/src/data/repository/card_list_repository.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'fetch_cards_repository_test.mocks.dart';

@GenerateMocks([ApiService, FirestoreDatabase])
void main() {
  group('Fetch cards', () {
    test('Fetch cards searching by name', () async {
      final datasource = MockApiService();
      final firebaseDatabase = MockFirestoreDatabase();
      const Map<String, String> endpoint = ApiProperties.byName;
      const String keyword = 'ysera';
      final repository = CardListRepository(
        datasource: datasource,
        fsDatabase: firebaseDatabase,
      );
      when(
        datasource.getData(
          endpoint: endpoint,
          keyword: keyword,
        ),
      ).thenAnswer(
        (_) async => http.Response(
          '[{"cardId": "1"}]',
          HttpStatus.ok,
        ),
      );
      expect(
        await repository.getData(endpoint: endpoint, keyword: keyword),
        hasLength(1),
      );
    });
    test('If the code is not 200 it should return an empty list', () async {
      final datasource = MockApiService();
      final firebaseDatabase = MockFirestoreDatabase();
      const Map<String, String> endpoint = ApiProperties.byName;
      const String keyword = 'ysera';

      when(
        datasource.getData(
          endpoint: endpoint,
          keyword: keyword,
        ),
      ).thenAnswer(
        (_) async => http.Response(
          '[]',
          HttpStatus.notFound,
        ),
      );
      final repository = CardListRepository(
        datasource: datasource,
        fsDatabase: firebaseDatabase,
      );
      expect(
        await repository.getData(
          endpoint: endpoint,
          keyword: keyword,
        ),
        hasLength(0),
      );
    });
    test('The repository should throw an exception if the endpoint is wrong',
        () async {
      final datasource = MockApiService();
      final firebaseDatabase = MockFirestoreDatabase();
      const Map<String, String> endpoint = ApiProperties.byName;
      const String keyword = 'ysera';

      when(
        datasource.getData(
          endpoint: endpoint,
          keyword: keyword,
        ),
      ).thenAnswer(
        (_) async => throw Exception(),
      );

      final repository = CardListRepository(
        datasource: datasource,
        fsDatabase: firebaseDatabase,
      );
      expect(
        repository.getData(
          endpoint: endpoint,
          keyword: keyword,
        ),
        throwsException,
      );
    });
    test(
        'If there is no internet conection it should try to retrieve the data from the firestore database',
        () async {
      final datasource = MockApiService();
      final firebaseDatabase = MockFirestoreDatabase();
      const Map<String, String> endpoint = ApiProperties.byName;
      const String keyword = 'ysera';

      when(
        datasource.getData(
          endpoint: endpoint,
          keyword: keyword,
        ),
      ).thenAnswer(
        (_) async => throw Exception(),
      );

      when(
        firebaseDatabase.getData(
          endpoint: endpoint,
          keyword: keyword,
        ),
      ).thenAnswer(
        (_) async => Future(
          () => [
            {'test': 'test'}
          ],
        ),
      );

      final repository = CardListRepository(
        datasource: datasource,
        fsDatabase: firebaseDatabase,
      );
      expect(
        await repository.getData(
          endpoint: endpoint,
          keyword: keyword,
        ),
        hasLength(1),
      );
    });
  });
}
