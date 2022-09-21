abstract class IFavoritesRepository {
  Future<void> setFavorite(String cardId);
  Future<void> removeFavorite(String cardId);
  Future<bool> isFavorite(String cardId);
}
