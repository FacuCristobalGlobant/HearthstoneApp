import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hearthstoneapp/src/presentation/widget/like_counter.dart';

void main() {
  testWidgets(
      'The counter should be 0 at the start and change to 1 after tapping the widget',
      (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: LikeCounter(),
      ),
    );

    expect(find.text('0'), findsOneWidget);

    await tester.tap(find.byType(LikeCounter).first);
    await tester.pumpAndSettle();
    expect(find.text('1'), findsOneWidget);
  });
}
