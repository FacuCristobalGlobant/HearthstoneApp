import 'package:flutter/cupertino.dart';
import 'package:hearthstoneapp/src/model/mechanic.dart';
import 'package:hearthstoneapp/utils/constants.dart';

class HearthstoneCard {
  final String name;
  final String cardId;
  final String cardSet;
  final String type;
  final String playerClass;
  final String? text;
  final int? health;
  final int? cost;
  final int? attack;
  final String locale;
  final List<CardMechanic> mechanics;
  late final AssetImage image;

  HearthstoneCard({
    required this.cardId,
    required this.cardSet,
    required this.playerClass,
    required this.name,
    required this.type,
    this.text,
    this.health,
    this.cost,
    this.attack,
    required this.locale,
    this.mechanics = const [],
    String img = Constants.defaultImage,
  }) {
    image = AssetImage(img);
  }

  factory HearthstoneCard.fromJson(Map json) {
    List<CardMechanic> mechanics = [];
    json["mechanics"]?.forEach((mechanic) {
      CardMechanic currentMechanic =
          CardMechanic.fromJson(mechanic as Map<String, dynamic>);
      mechanics.add(currentMechanic);
    });

    return HearthstoneCard(
      type: json["type"],
      playerClass: json["playerClass"],
      cardId: json["cardId"],
      name: json["name"],
      cardSet: json["cardSet"],
      text: json["text"],
      health: json["health"],
      locale: json["locale"],
      mechanics: mechanics,
    );
  }
}
