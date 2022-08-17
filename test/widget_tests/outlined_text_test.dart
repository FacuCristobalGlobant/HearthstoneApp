import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hearthstoneapp/src/presentation/widget/outlined_text.dart';

void main() {
  testWidgets(
    'Should find 2 text widgets since it creates an outline effect by stacking them',
    (tester) async {
      const String cardName = 'someCard';
      await tester.pumpWidget(
        const MaterialApp(
          home: OutlinedText(
            text: cardName,
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(
        find.text(cardName),
        findsNWidgets(2),
      );
    },
  );
}
