class Price {
  final int id;
  final double prix;
  final String typeCarburant;

  Price({
    required this.id,
    required this.prix,
    required this.typeCarburant,
  });

  // Factory method to convert JSON data to Price object
  factory Price.fromJson(Map<String, dynamic> json) {
    return Price(
      id: json['id'] as int,
      prix: json['prix'] as double,
      typeCarburant: json['typeCarburant'] as String,
    );
  }
}
