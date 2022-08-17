import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hearthstoneapp/src/data/model/hearthstone_card.dart';
import 'package:hearthstoneapp/src/presentation/widget/card.dart';
import 'package:hearthstoneapp/src/presentation/widget/outlined_text.dart';

void main() {
  testWidgets(
    'A card should display all properties in the HearthstoneCard object specified in the constructor',
    (tester) async {
      final HearthstoneCard card = HearthstoneCard(
        name: 'cardName',
        cardSet: 'cardSet',
        health: 12,
        cost: 3,
      );
      await tester.pumpWidget(
        MaterialApp(
          home: CardView(card: card),
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
