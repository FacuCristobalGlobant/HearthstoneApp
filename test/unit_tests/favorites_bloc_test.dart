import 'package:flutter_test/flutter_test.dart';
import 'package:hearthstoneapp/src/core/util/api_response_state.dart';
import 'package:hearthstoneapp/src/data/model/hearthstone_card.dart';
import 'package:hearthstoneapp/src/data/repository/favorites_repository.dart';
import 'package:hearthstoneapp/src/presentation/bloc/favorites_bloc.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../custom_matchers/has_state.dart';
import 'favorites_bloc_test.mocks.dart';

@GenerateMocks([FavoritesRepository])
void main() {
  group('Fetch favorites', () {
    test('Fetch cards marked as favorites', () async {
      final favoritesRepository = MockFavoritesRepository();
      final FavoritesBloc favoritesBloc =
          FavoritesBloc(repository: favoritesRepository);
      final favoritesStream = favoritesBloc.getCardListStream();

      when(
        favoritesRepository.getFavorites(),
      ).thenAnswer(
        (_) => Future(
          () => <HearthstoneCard>[
            HearthstoneCard(
              cardId: 'a',
              cardSet: 'classic',
            ),
          ],
        ),
      );

      expectLater(
        favoritesStream,
        emitsInOrder([
          HasState(ApiResponseState.loading),
          HasState(ApiResponseState.success),
          HasState(ApiResponseState.loading),
          HasState(ApiResponseState.empty),
        ]),
      );

      await favoritesBloc.getFavorites();

      when(
        favoritesRepository.getFavorites(),
      ).thenAnswer(
        (_) async => <HearthstoneCard>[],
      );
      await favoritesBloc.getFavorites();
    });
    test('Fetch cards marked as favorites', () async {
      final favoritesRepository = MockFavoritesRepository();
      final FavoritesBloc favoritesBloc =
          FavoritesBloc(repository: favoritesRepository);
      final favoritesStream = favoritesBloc.getCardListStream();

      when(
        favoritesRepository.getFavorites(),
      ).thenAnswer(
        (_) => throw Exception(),
      );

      expectLater(
        favoritesStream,
        emitsInOrder([
          HasState(ApiResponseState.loading),
          HasState(ApiResponseState.error),
        ]),
      );

      await favoritesBloc.getFavorites();
    });
  });
}
