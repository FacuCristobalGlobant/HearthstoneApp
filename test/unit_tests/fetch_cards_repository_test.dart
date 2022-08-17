import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hearthstoneapp/src/core/util/api_properties.dart';
import 'package:hearthstoneapp/src/data/datasource/remote/api_service.dart';
import 'package:hearthstoneapp/src/data/repository/card_list_repository.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'fetch_cards_repository_test.mocks.dart';

@GenerateMocks([ApiService])
void main() {
  group('Fetch cards', () {
    test('Fetch cards searching by name', () async {
      final datasource = MockApiService();
      const endpoint = '${ApiProperties.byName}ysera';
      final repository = CardListRepository(datasource: datasource);
      when(datasource.getData(endpoint: endpoint)).thenAnswer(
        (_) async => http.Response(
          '[{"cardId": "1"}]',
          HttpStatus.ok,
        ),
      );
      expect(
        await repository.getData(endpoint: endpoint),
        hasLength(1),
      );
    });
    test('If the code is not 200 it should return an empty list', () async {
      final datasource = MockApiService();
      const endpoint = '${ApiProperties.byName}ysera';

      when(datasource.getData(endpoint: endpoint)).thenAnswer(
        (_) async => http.Response(
          '[]',
          HttpStatus.notFound,
        ),
      );
      final repository = CardListRepository(datasource: datasource);
      expect(
        await repository.getData(endpoint: endpoint),
        hasLength(0),
      );
    });
    test('The repository should throw an exception if the endpoint is wrong',
        () async {
      final datasource = MockApiService();
      const endpoint = 'wrongEndpoint';

      when(datasource.getData(endpoint: endpoint)).thenAnswer(
        (_) async => throw Exception(),
      );

      final repository = CardListRepository(datasource: datasource);
      expect(
        repository.getData(endpoint: endpoint),
        throwsException,
      );
    });
  });
}
