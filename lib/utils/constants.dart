import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class Constants {
  static const cardTypeLabel = "Type: ";
  static const cardFactionLabel = "Faction: ";
  static const cardRarityLabel = "Rarity: ";
  static const cardCostLabel = "Cost: ";
  static const cardAttackLabel = "Attack: ";
  static const cardHeathLabel = "Health: ";
  static const cardAbilityLabel = "Ability";
  static const double iconSize = 50;
  static const iconFontTextStyle = TextStyle(
    fontSize: 25,
    color: Colors.white,
  );
  static const double iconBoxSize = 100;
  static const double abilityLabelFontSize = 25;
  static const double abilityFontSize = 20;
  static const likeCounterPadding = EdgeInsets.all(5);
  static const double likeCounterRadius = 20;
  static const double likeCounterCountRightDistance = 5;
  static const cardNameContainerMargin = EdgeInsets.only(top: 20);
  static const double cardNameContainerHeight = 60;
  static const double likeCounterTopDistance = 0;
  static const double likeCounterRightDistance = 20;
  static const abilityLabelPadding = EdgeInsets.all(30);
  static const propertyContainerPadding = EdgeInsets.all(15);
  static const double propertyContainerRadius = 20;
  static const propertyContainerMargin = EdgeInsets.symmetric(horizontal: 40);
  static const propertyContainerShadow = [
    BoxShadow(
      offset: Offset(
        3,
        3,
      ),
      color: Colors.black54,
      blurRadius: 3,
    ),
  ];
}
