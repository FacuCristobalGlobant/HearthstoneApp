import 'package:hearthstoneapp/src/core/util/api_response_state.dart';
import 'package:hearthstoneapp/src/domain/bloc/i_bloc.dart';

abstract class IFavoritesBloc extends IBloc {
  Future<void> setFavorite(String cardId);
  Future<void> removeFavorite(String cardId);
  Future<bool> isFavorite(String cardId);
  Future<void> getFavorites();
  Stream<ApiResponse> getCardListStream();
}
