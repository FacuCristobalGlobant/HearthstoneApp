import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hearthstoneapp/src/core/util/strings.dart';
import 'package:hearthstoneapp/src/presentation/widget/not_found.dart';

void main() {
  testWidgets(
    'The widget should display an image and a set message',
    (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: NotFound(),
        ),
      );

      await tester.pumpAndSettle();

      expect(
        find.byType(Image),
        findsOneWidget,
      );
      expect(
        find.text(Strings.notFoundMessage),
        findsOneWidget,
      );
    },
  );
}
