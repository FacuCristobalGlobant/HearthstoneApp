import 'package:flutter/material.dart';

abstract class Constants {
  static const listViewTitle = Text('HearthStone card list');
  static const cardViewTitle = Text('Card details');
  static const listItemMargin = EdgeInsets.symmetric(
    vertical: 10,
    horizontal: 25,
  );
  static const listItemPadding = EdgeInsets.symmetric(
    horizontal: 15,
    vertical: 5,
  );
  static const verticalSmallPadding = EdgeInsets.symmetric(
    vertical: 10.0,
  );
  static const cardTypeLabel = 'Type: ';
  static const cardIdLabel = 'Card ID: ';
  static const cardCostLabel = 'Cost: ';
  static const cardAttackLabel = 'Attack: ';
  static const cardHealthLabel = 'Health: ';
  static const cardAbilityLabel = 'Description';
  static const cardSetLabel = 'Card set: ';
  static const cardPlayerClassLabel = 'Player Class: ';
  static const cardMechanicsLabel = 'Mechanics: ';
  static const double iconSize = 30;
  static const iconFontTextStyle = TextStyle(
    fontSize: 15,
    color: Colors.white,
  );
  static const double iconBoxSize = 80;
  static const double abilityLabelFontSize = 25;
  static const double mediumFontSize = 15;
  static const double bigFontSize = 30;
  static const int titleMaxLines = 12;
  static const likeCounterPadding = EdgeInsets.all(5);
  static const double likeCounterRadius = 10;
  static const double likeCounterCountRightDistance = 5;
  static const cardNameContainerMargin = EdgeInsets.only(top: 20);
  static const double cardNameContainerHeight = 60;
  static const double likeCounterRightDistance = 20;
  static const abilityLabelPadding = EdgeInsets.all(30);
  static const propertyContainerPadding = EdgeInsets.all(15);
  static const double containerRadius = 20;
  static const propertyContainerMargin = EdgeInsets.symmetric(
    horizontal: 40,
    vertical: 10,
  );
  static const containerShadow = [
    BoxShadow(
      offset: Offset(
        5,
        5,
      ),
      color: Colors.grey,
      blurRadius: 1,
    ),
  ];
  static const double detailsTitleWidth = 400;
  static const jsonReadingError =
      Text('There was an error reading the json file');
  static const jsonReadingLoading = Text('Loading Data');
  static const jsonPath = 'assets/cards_list.json';
  static const cardNameWidthFactor = 1 / (2.2);
  static const defaultImage = 'assets/images/EX1_572.png';
  static const emptyString = '';
  static const propertyTextStyle = TextStyle(
    fontSize: Constants.mediumFontSize,
    color: Colors.white,
  );
}
