import 'package:hearthstoneapp/src/data/model/hearthstone_card.dart';

class ApiResponse {
  final List<HearthstoneCard>? listOfCards;
  final ApiResponseState state;

  ApiResponse({
    required this.state,
    this.listOfCards,
  });
}

enum ApiResponseState {
  loading,
  success,
  empty,
  initial,
  error,
}
