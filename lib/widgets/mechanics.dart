import 'package:flutter/material.dart';
import 'package:hearthstoneapp/src/model/mechanic.dart';
import 'package:hearthstoneapp/utils/constants.dart';

class Mechanics extends StatelessWidget {
  final List<CardMechanic> listOfMechanics;
  final bool visibility;
  final TextStyle style;

  const Mechanics({
    Key? key,
    required this.listOfMechanics,
    this.visibility = true,
    this.style = Constants.propertyTextStyle,
  }) : super(key: key);

  List<Text> getWidgetsFromMechanics(List<CardMechanic> listOfMechanics) {
    List<Text> listOfWidgets = [];
    listOfMechanics.forEach((mechanic) {
      listOfWidgets.add(Text(
        '- ${mechanic.name}',
        textAlign: TextAlign.end,
        style: style,
      ));
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
