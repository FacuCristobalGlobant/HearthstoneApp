import 'package:flutter/cupertino.dart';

class HearthstoneCard {
  final String name;
  final String type;
  final String faction;
  final String rarity;
  final int cost;
  final int attack;
  final int health;
  final String ability;
  late final AssetImage image;

  HearthstoneCard(
    this.name,
    this.type,
    this.faction,
    this.rarity,
    this.cost,
    this.attack,
    this.health,
    this.ability,
    String img,
  ) {
    image = AssetImage(img);
  }
}
