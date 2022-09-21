import 'package:flutter/material.dart';

abstract class Styles {
  static const double iconSize = 30;
  static const double iconSizeFavorite = 40;
  static const double iconBoxSize = 80;
  static const double abilityLabelFontSize = 25;
  static const double mediumFontSize = 15;
  static const double largeFontSize = 18;
  static const double xLargeFontSize = 30;
  static const int titleMaxLines = 12;
  static const verticalSmallPadding = EdgeInsets.symmetric(
    vertical: 5.0,
  );

  static const iconFontTextStyle = TextStyle(
    fontSize: 15,
    color: Colors.white,
  );

  static const smallPadding = EdgeInsets.all(5);
  static const double likeCounterRadius = 10;
  static const double likeCounterCountRightDistance = 5;
  static const topMediumMargin = EdgeInsets.only(top: 20);
  static const double cardNameContainerHeight = 60;
  static const double likeCounterRightDistance = 20;
  static const largePadding = EdgeInsets.all(30);
  static const mediumPadding = EdgeInsets.all(15);
  static const double containerRadius = 5;
  static const propertyContainerMargin = EdgeInsets.symmetric(
    horizontal: 40,
    vertical: 10,
  );
  static const containerShadow = [
    BoxShadow(
      offset: Offset(
        2,
        2,
      ),
      color: Colors.grey,
      blurRadius: 1,
    ),
  ];
  static const double detailsTitleWidth = 400;
  static const propertyTextStyle = TextStyle(
    fontSize: Styles.mediumFontSize,
    color: Colors.white,
  );
  static const cardNameWidthFactor = 1 / (2.2);
  static const double outlinedTextDefaultStrokeWidth = 6;
  static const gridItemsPerRow = 3;
  static const double gritItemSpacing = 5;
  static const gridItemAspectRatio = 0.53;

  static const drawerHeaderPadding = EdgeInsets.symmetric(vertical: 30);
  static const double drawerLogoHeight = 80;
  static const drawerTextInputMargin =
      EdgeInsets.only(top: 20, left: 20, right: 20);
  static const drawerButtonContainerPadding =
      EdgeInsets.symmetric(vertical: 15.0, horizontal: 20);

  static const welcomeContainerPadding =
      EdgeInsets.symmetric(vertical: 60, horizontal: 20);

  static const welcomeButtonPadding = EdgeInsets.all(10);
  static const welcomeButtonTextPadding = EdgeInsets.all(8.0);
  static const double welcomeButtonTextScaleFactor = 2;
  static const outlinedTextDefaultFont = 'BigshotOne';
}
