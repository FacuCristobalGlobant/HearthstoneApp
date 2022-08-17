import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hearthstoneapp/src/presentation/widget/card_property.dart';

void main() {
  testWidgets(
    'Should display the name of the property as well as the value',
    (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CardProperty(
            propertyName: 'propertyName',
            child: Text('value'),
          ),
        ),
      );

      expect(
        find.text('propertyName'),
        findsOneWidget,
      );
      expect(
        find.text('value'),
        findsOneWidget,
      );
    },
  );
}
