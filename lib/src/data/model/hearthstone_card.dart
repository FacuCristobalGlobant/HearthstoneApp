import 'package:hearthstoneapp/src/data/model/mechanic.dart';

class HearthstoneCard {
  final String? name;
  final String? cardId;
  final String? cardSet;
  final String? type;
  final String? faction;
  final String? playerClass;
  final String? text;
  final int? health;
  final int? cost;
  final int? attack;
  final String? locale;
  final List<CardMechanic> mechanics;
  final String? image;

  HearthstoneCard({
    this.cardId,
    this.cardSet,
    this.playerClass,
    this.name,
    this.type,
    this.text,
    this.health,
    this.cost,
    this.attack,
    this.faction,
    this.locale,
    this.mechanics = const [],
    this.image,
  });

  factory HearthstoneCard.fromJson(Map json) {
    final List<CardMechanic> mechanics = [];
    json['mechanics']?.forEach((mechanic) {
      final CardMechanic currentMechanic =
          CardMechanic.fromJson(mechanic as Map<String, dynamic>);
      mechanics.add(currentMechanic);
    });

    return HearthstoneCard(
      type: json['type'] as String?,
      playerClass: json['playerClass'] as String?,
      cardId: json['cardId'] as String?,
      name: json['name'] as String?,
      cardSet: json['cardSet'] as String?,
      text: json['text'] as String?,
      health: json['health'] as int?,
      locale: json['locale'] as String?,
      faction: json['faction'] as String?,
      image: json['img'] as String?,
      mechanics: mechanics,
    );
  }
}
