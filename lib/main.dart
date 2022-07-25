import 'package:flutter/material.dart';
import 'package:hearthstoneapp/widgets/list_of_cards.dart';

void main() => runApp(const HearthStoneApp());

class HearthStoneApp extends StatelessWidget {
  const HearthStoneApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HearthStoneApp',
      home: ListOfCards(),
    );
  }
}
