import 'package:flutter/material.dart';
import 'package:hearthstoneapp/src/presentation/widget/list_of_cards.dart';

void main() => runApp(const HearthStoneApp());

class HearthStoneApp extends StatelessWidget {
  const HearthStoneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HearthStoneApp',
      home: ListOfCards(),
    );
  }
}
