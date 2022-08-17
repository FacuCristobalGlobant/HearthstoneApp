import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hearthstoneapp/src/presentation/widget/drawer_button.dart';

void main() {
  testWidgets(
    'Should render a button with the text received as parameter',
    (tester) async {
      const String buttonText = 'buttonText';
      await tester.pumpWidget(
        MaterialApp(
          home: DrawerButton(
            onClickAction: () => null,
            text: buttonText,
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(
        find.text(buttonText),
        findsOneWidget,
      );
    },
  );
}
