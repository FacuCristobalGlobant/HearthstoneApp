import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hearthstoneapp/src/data/model/mechanic.dart';
import 'package:hearthstoneapp/src/presentation/widget/mechanics.dart';

void main() {
  testWidgets(
    "Should create a Text widget for each mechanic in the list, and each mechanic should have a '- ' before it's name",
    (tester) async {
      const mechanicPrefix = '- ';
      final List<CardMechanic> listOfMechanics = [
        CardMechanic(name: 'mechanic1'),
        CardMechanic(name: 'mechanic2'),
      ];
      await tester.pumpWidget(
        MaterialApp(
          home: Mechanics(
            listOfMechanics: listOfMechanics,
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(
        find.byType(Text),
        findsNWidgets(listOfMechanics.length),
      );

      expect(
        find.text('${mechanicPrefix}mechanic1'),
        findsOneWidget,
      );
      expect(
        find.text('${mechanicPrefix}mechanic2'),
        findsOneWidget,
      );
    },
  );
}
