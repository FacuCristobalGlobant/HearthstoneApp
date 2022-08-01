class CardMechanic {
  final String name;

  CardMechanic({
    required this.name,
  });

  factory CardMechanic.fromJson(Map json) {
    return CardMechanic(
      name: json['name'] as String,
    );
  }
}
