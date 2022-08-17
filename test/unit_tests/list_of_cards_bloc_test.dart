import 'package:flutter_test/flutter_test.dart';
import 'package:hearthstoneapp/src/core/util/api_properties.dart';
import 'package:hearthstoneapp/src/core/util/api_response_state.dart';
import 'package:hearthstoneapp/src/data/model/hearthstone_card.dart';
import 'package:hearthstoneapp/src/data/repository/card_list_repository.dart';
import 'package:hearthstoneapp/src/presentation/bloc/list_of_cards_bloc.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import './list_of_cards_bloc_test.mocks.dart';
import '../custom_matchers/has_state.dart';

@GenerateMocks([CardListRepository])
void main() {
  group('BloC testing', () {
    test(
      'When given a successful response with content should emit ApiResponse objects in the following order : initial, loading and success. When given an empty list should return empty instead of success',
      () async {
        const endpoint = '${ApiProperties.byName}ysera';

        final repository = MockCardListRepository();
        final HearthstoneCardListBloc cardListBloc =
            HearthstoneCardListBloc(repository: repository);
        final cardListStream = cardListBloc.getCardListStream();

        when(repository.getData(endpoint: endpoint)).thenAnswer(
          (_) async => <HearthstoneCard>[
            HearthstoneCard(cardId: '1'),
            HearthstoneCard(cardId: '2'),
            HearthstoneCard(cardId: '3'),
          ],
        );

        expectLater(
          cardListStream,
          emitsInOrder([
            HasState(ApiResponseState.initial),
            HasState(ApiResponseState.loading),
            HasState(ApiResponseState.success),
            HasState(ApiResponseState.loading),
            HasState(ApiResponseState.empty),
          ]),
        );

        await cardListBloc.initialize();
        await cardListBloc.searchForCards(endpoint);

        when(repository.getData(endpoint: endpoint)).thenAnswer(
          (_) async => <HearthstoneCard>[],
        );

        await cardListBloc.searchForCards(endpoint);
      },
    );
    test(
      "If there's an exception it should emit ApiResponse objects in this order: initial, loading and error",
      () async {
        const endpoint = 'WrongEndpoint';

        final repository = MockCardListRepository();
        final HearthstoneCardListBloc cardListBloc =
            HearthstoneCardListBloc(repository: repository);
        final cardListStream = cardListBloc.getCardListStream();

        when(repository.getData(endpoint: endpoint)).thenAnswer(
          (_) async => throw Exception(),
        );

        expectLater(
          cardListStream,
          emitsInOrder([
            HasState(ApiResponseState.initial),
            HasState(ApiResponseState.loading),
            HasState(ApiResponseState.error),
          ]),
        );

        await cardListBloc.initialize();
        await cardListBloc.searchForCards(endpoint);
      },
    );
  });
}
