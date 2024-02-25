class Service {
  final int id;
  final String nom;
  final String description;

  Service({
    required this.id,
    required this.nom,
    required this.description,
  });

  // Factory method to convert JSON data to Service object
  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      id: json['id'] as int,
      nom: json['nom'] as String,
      description: json['description'] as String,
    );
  }
}
