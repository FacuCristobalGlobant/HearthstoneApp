import 'package:hearthstoneapp/src/core/util/api_response_state.dart';
import 'package:hearthstoneapp/src/data/model/hearthstone_card.dart';
import 'package:hearthstoneapp/src/domain/bloc/i_bloc.dart';

abstract class IHearthstoneCardListBloc extends IBloc {
  List<HearthstoneCard>? get cardList;
  Stream<ApiResponse> getCardListStream();
  void searchForCards(String keyword);
}
