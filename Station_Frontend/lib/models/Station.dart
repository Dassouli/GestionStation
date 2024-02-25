import 'price.dart';
import 'service.dart';
class Station {
  final int id;
  final String nom;
  final String logoUrl;
  final String adresse;
  final String ville;
  final double latitude;
  final double longitude;
  List<Price> prices;
  List<Service> services;

  Station({
    required this.id,
    required this.nom,
    required this.logoUrl,
    required this.adresse,
    required this.ville,
    required this.latitude,
    required this.longitude,
    this.prices = const [],
    this.services = const [],
  });

  // Factory method to convert JSON data to Station object
  factory Station.fromJson(Map<String, dynamic> json) {
    return Station(
      id: json['id'] as int,
      nom: json['nom'] as String,
      logoUrl: json['logoUrl'] as String,
      adresse: json['adresse'] as String,
      ville: json['ville'] as String,
      latitude: json['latitude'] as double,
      longitude: json['longitude'] as double,

    );
  }

}
