import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hearthstoneapp/src/core/util/assets.dart';
import 'package:hearthstoneapp/src/data/model/hearthstone_card.dart';
import 'package:hearthstoneapp/src/presentation/widget/grid_card_item.dart';

void main() {
  testWidgets(
    "Should display a default image, the type of the card, it's name and it's set",
    (tester) async {
      final HearthstoneCard card = HearthstoneCard(
        name: 'cardName',
        cardSet: 'cardSet',
        type: 'cardType',
      );
      await tester.pumpWidget(
        MaterialApp(
          home: GridCardItem(
            cardSet: card.cardSet!,
            name: card.name!,
            image: card.image,
            type: card.type!,
          ),
        ),
      );

      expect(
        find.image(const AssetImage(Assets.defaultImage)),
        findsOneWidget,
      );
      expect(
        find.text('cardName'),
        findsOneWidget,
      );
      expect(
        find.text('cardSet'),
        findsOneWidget,
      );
      expect(
        find.text('cardType'),
        findsOneWidget,
      );
    },
  );
}
