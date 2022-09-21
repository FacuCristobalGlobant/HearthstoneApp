import 'dart:async';

import 'package:hearthstoneapp/src/core/util/api_response_state.dart';
import 'package:hearthstoneapp/src/data/model/hearthstone_card.dart';
import 'package:hearthstoneapp/src/data/repository/favorites_repository.dart';
import 'package:hearthstoneapp/src/domain/bloc/i_favorites_bloc.dart';

class FavoritesBloc extends IFavoritesBloc {
  late FavoritesRepository favoritesRepository;

  final StreamController<ApiResponse> _favoritesCardListController =
      StreamController.broadcast();

  FavoritesBloc({FavoritesRepository? repository}) {
    favoritesRepository = repository ?? FavoritesRepository();
  }

  @override
  Stream<ApiResponse> getCardListStream() =>
      _favoritesCardListController.stream;

  @override
  void dispose() {
    _favoritesCardListController.close();
  }

  @override
  Future<void> initialize() async {}

  @override
  Future<void> removeFavorite(String cardId) async =>
      favoritesRepository.removeFavorite(cardId);

  @override
  Future<void> setFavorite(String cardId) async =>
      favoritesRepository.setFavorite(cardId);

  @override
  Future<bool> isFavorite(String cardId) async =>
      favoritesRepository.isFavorite(cardId);

  @override
  Future<void> getFavorites() async {
    _favoritesCardListController.sink.add(
      ApiResponse(
        state: ApiResponseState.loading,
      ),
    );
    try {
      final List<HearthstoneCard> listOfCards =
          await favoritesRepository.getFavorites();
      if (listOfCards.isEmpty) {
        _favoritesCardListController.sink.add(
          ApiResponse(
            state: ApiResponseState.empty,
          ),
        );
      } else {
        _favoritesCardListController.sink.add(
          ApiResponse(
            state: ApiResponseState.success,
            listOfCards: listOfCards,
          ),
        );
      }
    } on Exception catch (_) {
      _favoritesCardListController.sink.add(
        ApiResponse(
          state: ApiResponseState.error,
        ),
      );
    }
  }
}
