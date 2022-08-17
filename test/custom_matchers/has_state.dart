import 'package:flutter_test/flutter_test.dart';
import 'package:hearthstoneapp/src/core/util/api_response_state.dart';

class HasState extends CustomMatcher {
  HasState(matcher)
      : super(
          'ApiResponse with state that is',
          'state',
          matcher,
        );
  @override
  ApiResponseState featureValueOf(actual) => (actual as ApiResponse).state;
}
