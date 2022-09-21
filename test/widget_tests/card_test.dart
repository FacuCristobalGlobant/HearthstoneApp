import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hearthstoneapp/src/data/model/hearthstone_card.dart';
import 'package:hearthstoneapp/src/presentation/widget/card.dart';
import 'package:hearthstoneapp/src/presentation/widget/outlined_text.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../lib/src/presentation/bloc/favorites_bloc.dart';
import 'card_test.mocks.dart';

@GenerateMocks([FavoritesBloc])
void main() {
  testWidgets(
    'A card should display all properties in the HearthstoneCard object specified in the constructor',
    (tester) async {
      final HearthstoneCard card = HearthstoneCard(
        cardId: 'a',
        name: 'cardName',
        cardSet: 'cardSet',
        health: 12,
        cost: 3,
      );
      final favoritesBloc = MockFavoritesBloc();

      when(favoritesBloc.isFavorite(card.cardId))
          .thenAnswer((realInvocation) async => true);

      await tester.pumpWidget(
        MaterialApp(
          home: CardView(
            card: card,
            favoritesBloc: favoritesBloc,
          ),
        ),
      );

      expect(
        find.byType(OutlinedText),
        findsOneWidget,
      );
      expect(
        find.text('cardSet'),
        findsOneWidget,
      );
      expect(
        find.text('12'),
        findsOneWidget,
      );
      expect(
        find.text('3'),
        findsOneWidget,
      );
    },
  );
}
