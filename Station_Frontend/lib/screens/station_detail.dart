import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/price.dart';
import '../models/service.dart';
import '../models/station.dart';
import '../services/api_service.dart';

class StationDetailsScreen extends StatefulWidget {
  final Station station;

  const StationDetailsScreen({Key? key, required this.station}) : super(key: key);

  @override
  _StationDetailsScreenState createState() => _StationDetailsScreenState();
}

class _StationDetailsScreenState extends State<StationDetailsScreen> {
  late List<Price> prices;
  late List<Service> services;

  @override
  void initState() {
    super.initState();
    fetchPricesAndServices();
  }

  Future<void> fetchPricesAndServices() async {
    try {
      prices = await ApiService().fetchPricesForStation(widget.station.id);
      services = await ApiService().fetchServicesForStation(widget.station.id);
      setState(() {});
    } catch (e) {
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0B9A96),
        title: Text('Détail Station'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Stack(
              children: [
                GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(
                        widget.station.latitude, widget.station.longitude),
                    zoom: 11,
                  ),
                  markers: {
                    Marker(
                      markerId: MarkerId(widget.station.id.toString()),
                      position: LatLng(
                          widget.station.latitude, widget.station.longitude),
                      infoWindow: InfoWindow(
                        title: widget.station.nom,
                        snippet: widget.station.adresse,
                      ),
                    ),
                  },
                ),
                Positioned(
                  top: MediaQuery
                      .of(context)
                      .size
                      .height / 2,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 50, // Adjust the height as needed
                    color: Colors.orange, // Orange color for the bar
                    alignment: Alignment.center,
                    child: Text(
                      'Details',
                      style: TextStyle(color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nom de la station: ${widget.station.nom}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text('Addresse: ${widget.station.adresse}'),
                SizedBox(height: 16),
                Text(
                  'Prix:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: prices.map((price) {
                    return Text(
                      '${price.typeCarburant}: ${price.prix.toString()} MAD',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    );
                  }).toList(),
                ),
                SizedBox(height: 16),
                Text(
                  'Service:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: services.map((service) {
                    return Text(
                      '${service.nom}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}