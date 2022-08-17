import 'package:flutter/material.dart';

abstract class Strings {
  static const listViewTitle = Text('HearthStone card list');
  static const cardViewTitle = Text('Card details');
  static const cardTypeLabel = 'Type: ';
  static const cardIdLabel = 'Card ID: ';
  static const cardCostLabel = 'Cost: ';
  static const cardAttackLabel = 'Attack: ';
  static const cardHealthLabel = 'Health: ';
  static const cardAbilityLabel = 'Description';
  static const cardSetLabel = 'Card set: ';
  static const cardPlayerClassLabel = 'Player Class: ';
  static const cardMechanicsLabel = 'Mechanics: ';
  static const cardFactionLabel = 'Faction: ';
  static const jsonReadingError =
      Text('There was an error reading the json file');
  static const jsonReadingLoading = Text('Loading Data');
  static const emptyString = '';
  static const apiParams = {'collectible': '1'};
  static const notFoundMessage = 'No cards found';
  static const searchByNameText = 'Search by name';
  static const searchByFactionText = 'Search by faction';
  static const searchBySetText = 'Search by set';
  static const searchWelcomeButtonText = 'Search';
  static const searchInputHintText = 'Keyword';
}
