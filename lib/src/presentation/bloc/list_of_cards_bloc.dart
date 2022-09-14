import 'dart:async';

import 'package:hearthstoneapp/src/core/util/api_response_state.dart';
import 'package:hearthstoneapp/src/data/datasource/local/DAOs/firestore_database.dart';
import 'package:hearthstoneapp/src/data/model/hearthstone_card.dart';
import 'package:hearthstoneapp/src/data/repository/card_list_repository.dart';
import 'package:hearthstoneapp/src/domain/bloc/i_hearthstone_card_list_bloc.dart';

class HearthstoneCardListBloc extends IHearthstoneCardListBloc {
  late final CardListRepository _repository;

  final ApiResponse _apiResponse = ApiResponse(state: ApiResponseState.initial);
  final StreamController<ApiResponse> _hearthstoneCardStreamController =
      StreamController();

  HearthstoneCardListBloc({
    CardListRepository? repository,
  }) {
    _repository =
        repository ?? CardListRepository(fsDatabase: FirestoreDatabase());
  }

  @override
  List<HearthstoneCard>? get cardList => _apiResponse.listOfCards;

  @override
  void dispose() {
    _hearthstoneCardStreamController.close();
  }

  @override
  Future<void> initialize() async {
    _hearthstoneCardStreamController.sink.add(
      _apiResponse,
    );
  }

  @override
  Stream<ApiResponse> getCardListStream() =>
      _hearthstoneCardStreamController.stream;

  @override
  Future<void> searchForCards(
    Map<String, String> endpoint,
    String keyword,
  ) async {
    _hearthstoneCardStreamController.sink.add(
      ApiResponse(
        state: ApiResponseState.loading,
      ),
    );

    try {
      final List<HearthstoneCard> listOfCards =
          await _repository.getData(endpoint: endpoint, keyword: keyword);
      if (listOfCards.isEmpty) {
        _hearthstoneCardStreamController.sink.add(
          ApiResponse(
            state: ApiResponseState.empty,
          ),
        );
      } else {
        _hearthstoneCardStreamController.sink.add(
          ApiResponse(
            state: ApiResponseState.success,
            listOfCards: listOfCards,
          ),
        );
      }
    } on Exception catch (_) {
      _hearthstoneCardStreamController.sink.add(
        ApiResponse(
          state: ApiResponseState.error,
        ),
      );
    }
  }
}
