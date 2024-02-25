import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../services/api_service.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(35.781350, -5.820759);
  Set<Marker> _markers = {};
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _loadStations();
  }

  Future<void> _loadStations() async {
    var stations = await ApiService().fetchStations();
    for (var station in stations) {
      var prices = await ApiService().fetchPricesForStation(station.id);
      String pricesInfo = '';
      for (var price in prices) {
        pricesInfo += ' ${price.prix.toString()} MAD\n';
      }
      setState(() {
        _markers.add(
          Marker(
            markerId: MarkerId(station.id.toString()),
            position: LatLng(station.latitude, station.longitude),
            infoWindow: InfoWindow(
              title: station.nom,
              snippet: 'Prix:\n$pricesInfo',
            ),
          ),
        );
      });
    }
  }


  Future<void> _searchStationsByVille(String ville) async {
    var stations = await ApiService().fetchStationsByVille(ville);
    setState(() {
      _markers = stations
          .map((station) => Marker(
        markerId: MarkerId(station.id.toString()),
        position: LatLng(station.latitude, station.longitude),
        infoWindow: InfoWindow(
          title: station.nom,
          snippet: station.adresse,
        ),
      ))
          .toSet();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0B9A96),
        title: Text('Stations Map'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              String query = _searchController.text.trim();
              if (query.isNotEmpty) {
                _searchStationsByVille(query);
              }
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search by city...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onSubmitted: (value) {
                String query = _searchController.text.trim();
                if (query.isNotEmpty) {
                  _searchStationsByVille(query);
                }
              },
            ),
          ),
          Expanded(
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
              ),
              markers: _markers,
            ),
          ),
        ],
      ),
    );
  }
}
