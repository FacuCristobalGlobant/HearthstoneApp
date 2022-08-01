import 'package:flutter/material.dart';
import 'package:hearthstoneapp/src/core/util/constants.dart';
import 'package:hearthstoneapp/src/data/model/mechanic.dart';

class Mechanics extends StatelessWidget {
  final List<CardMechanic> listOfMechanics;
  final bool visibility;
  final TextStyle style;

  const Mechanics({
    super.key,
    required this.listOfMechanics,
    this.visibility = true,
    this.style = Constants.propertyTextStyle,
  });

  List<Text> getWidgetsFromMechanics(List<CardMechanic> listOfMechanics) {
    final List<Text> listOfWidgets = [];
    listOfMechanics.forEach((mechanic) {
      listOfWidgets.add(
        Text(
          '- ${mechanic.name}',
          textAlign: TextAlign.end,
          style: style,
        ),
      );
    });
    return listOfWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: getWidgetsFromMechanics(listOfMechanics),
    );
  }
}
