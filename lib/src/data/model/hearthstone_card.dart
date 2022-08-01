import 'package:flutter/cupertino.dart';
import 'package:hearthstoneapp/src/core/util/constants.dart';
import 'package:hearthstoneapp/src/data/model/mechanic.dart';

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
    final List<CardMechanic> mechanics = [];
    json['mechanics']?.forEach((mechanic) {
      final CardMechanic currentMechanic =
          CardMechanic.fromJson(mechanic as Map<String, dynamic>);
      mechanics.add(currentMechanic);
    });

    return HearthstoneCard(
      type: json['type'] as String,
      playerClass: json['playerClass'] as String,
      cardId: json['cardId'] as String,
      name: json['name'] as String,
      cardSet: json['cardSet'] as String,
      text: json['text'] as String?,
      health: json['health'] as int?,
      locale: json['locale'] as String,
      mechanics: mechanics,
    );
  }
}
