import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hearthstoneapp/src/data/model/hearthstone_card.dart';
import 'package:hearthstoneapp/src/presentation/bloc/favorites_bloc.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../lib/src/presentation/widget/favorite.dart';
import 'favorite_button_test.mocks.dart';

@GenerateMocks([FavoritesBloc])
void main() {
  testWidgets(
    'The widget should display different icons depending on the card being a favorite or not, tapping the widget removes the card as favorite',
    (tester) async {
      final favoritesBloc = MockFavoritesBloc();
      final HearthstoneCard card = HearthstoneCard(cardId: '1', name: 'ysera');

      when(favoritesBloc.isFavorite(card.cardId))
          .thenAnswer((realInvocation) async => true);

      await tester.pumpWidget(
        MaterialApp(
          home: Favorite(
            favoritesBloc: favoritesBloc,
            card: card,
          ),
        ),
      );

      await tester.pumpAndSettle();

      expectLater(
        find.byIcon(Icons.favorite),
        findsOneWidget,
      );

      when(favoritesBloc.isFavorite(card.cardId))
          .thenAnswer((realInvocation) async => false);

      when(favoritesBloc.removeFavorite(card.cardId))
          .thenAnswer((realInvocation) async => false);

      await tester.tap(find.byIcon(Icons.favorite));

      await tester.pumpAndSettle();

      expectLater(
        find.byIcon(Icons.favorite_border_sharp),
        findsOneWidget,
      );
    },
  );
}
