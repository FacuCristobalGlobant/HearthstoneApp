import 'package:hearthstoneapp/src/core/util/strings.dart';
import 'package:hearthstoneapp/src/data/datasource/remote/api_service.dart';
import 'package:hearthstoneapp/src/data/model/hearthstone_card.dart';

abstract class ICardListRepository {
  late ApiService datasource;
  Future<List<HearthstoneCard>> getData(
      {String endpoint = Strings.emptyString});
  Future<void> storeData(List<HearthstoneCard> data);
}
