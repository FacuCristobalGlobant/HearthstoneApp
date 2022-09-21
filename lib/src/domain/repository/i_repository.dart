import 'package:hearthstoneapp/src/data/model/hearthstone_card.dart';

abstract class ICardListRepository {
  Future<List<HearthstoneCard>> getData({
    required Map<String, String> endpoint,
    required String keyword,
  });
}
