import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hearthstoneapp/src/core/util/api_properties.dart';
import 'package:hearthstoneapp/src/core/util/api_response_state.dart';
import 'package:hearthstoneapp/src/core/util/keys.dart';
import 'package:hearthstoneapp/src/core/util/strings.dart';
import 'package:hearthstoneapp/src/data/model/hearthstone_card.dart';
import 'package:hearthstoneapp/src/presentation/bloc/list_of_cards_bloc.dart';
import 'package:hearthstoneapp/src/presentation/widget/list_of_cards.dart';
import 'package:hearthstoneapp/src/presentation/widget/not_found.dart';
import 'package:hearthstoneapp/src/presentation/widget/welcome.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../lib/src/presentation/bloc/favorites_bloc.dart';
import 'list_of_cards_test.mocks.dart';

@GenerateMocks([HearthstoneCardListBloc, FavoritesBloc])
void main() {
  testWidgets(
      'Should have a welcome widget as soon as its created, then a CircularProgressIndicator when waiting, and finally a not found widget when the response is an empty List',
      (tester) async {
    final cardBloc = MockHearthstoneCardListBloc();
    final favoritesBloc = MockFavoritesBloc();
    final StreamController<ApiResponse> hearthstoneCardStreamController =
        StreamController();

    when(cardBloc.getCardListStream()).thenAnswer(
      (_) => hearthstoneCardStreamController.stream,
    );
    when(favoritesBloc.isFavorite('a')).thenAnswer(
      (_) async => true,
    );

    hearthstoneCardStreamController.sink.add(
      ApiResponse(
        state: ApiResponseState.initial,
      ),
    );

    await tester.pumpWidget(
      MaterialApp(
        home: ListOfCards(
          hearthstoneCardListBloc: cardBloc,
          favoritesBloc: favoritesBloc,
        ),
      ),
    );

    expect(find.byType(Home), findsOneWidget);

    hearthstoneCardStreamController.sink.add(
      ApiResponse(
        state: ApiResponseState.loading,
      ),
    );
    await tester.pump();

    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    hearthstoneCardStreamController.sink.add(
      ApiResponse(
        state: ApiResponseState.empty,
        listOfCards: [],
      ),
    );

    await tester.pumpAndSettle();
    expect(find.byKey(Keys.gridItemKey), findsNothing);
    expect(find.byType(NotFound), findsOneWidget);
  });
  testWidgets(
      'There should be a TextField in the drawer, as well as 4 DrawerButtons. Then after entering a keyword and tapping a button it should assemble the endpoint and render the cards in the response',
      (tester) async {
    final cardBloc = MockHearthstoneCardListBloc();
    final favoritesBloc = MockFavoritesBloc();
    final StreamController<ApiResponse> hearthstoneCardStreamController =
        StreamController();
    const String cardName = 'ysera';
    const Map<String, String> endpoint = ApiProperties.byName;
    const String keyword = 'ysera';
    final List<HearthstoneCard> listOfCards = [
      HearthstoneCard(cardId: 'id1', name: 'card1'),
      HearthstoneCard(cardId: 'id2', name: 'card2'),
      HearthstoneCard(cardId: 'id3', name: 'card3'),
    ];

    when(cardBloc.getCardListStream()).thenAnswer(
      (_) => hearthstoneCardStreamController.stream,
    );
    when(favoritesBloc.isFavorite('a')).thenAnswer(
      (_) async => true,
    );

    await tester.pumpWidget(
      MaterialApp(
        home: ListOfCards(
          hearthstoneCardListBloc: cardBloc,
          favoritesBloc: favoritesBloc,
        ),
      ),
    );

    when(cardBloc.searchForCards(endpoint, keyword)).thenAnswer((_) async {
      hearthstoneCardStreamController.sink.add(
        ApiResponse(
          state: ApiResponseState.success,
          listOfCards: listOfCards,
        ),
      );
    });

    final ScaffoldState state = tester.firstState(find.byType(Scaffold));
    state.openDrawer();
    await tester.pumpAndSettle();

    expect(
      find.byKey(Keys.drawerButtonKey),
      findsNWidgets(4),
    );
    expect(find.text(Strings.searchByNameText), findsOneWidget);
    expect(find.text(Strings.searchByFactionText), findsOneWidget);
    expect(find.text(Strings.searchBySetText), findsOneWidget);

    await tester.enterText(find.byType(TextField), cardName);

    await tester.tap(find.text(Strings.searchByNameText));

    await tester.pumpAndSettle();

    expect(find.byKey(Keys.gridItemKey), findsNWidgets(3));

    state.openDrawer();

    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField), cardName);

    await tester.tap(find.text(Strings.searchBySetText));

    await tester.pumpAndSettle();

    expect(find.byKey(Keys.gridItemKey), findsNWidgets(3));

    state.openDrawer();

    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField), cardName);

    await tester.tap(find.text(Strings.searchByFactionText));

    await tester.pumpAndSettle();

    expect(find.byKey(Keys.gridItemKey), findsNWidgets(3));
  });
}
