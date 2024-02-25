import 'package:flutter/material.dart';
import '../NavBar.dart';
import '../models/price.dart';
import '../models/station.dart';
import '../services/api_service.dart';
import 'station_detail.dart';

class StationsListScreen extends StatefulWidget {
  @override
  _StationsListScreenState createState() => _StationsListScreenState();
}

class _StationsListScreenState extends State<StationsListScreen> {
  late Future<List<Station>> futureStations;

  @override
  void initState() {
    super.initState();
    futureStations = ApiService().fetchStations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text('La liste des stations'),
        backgroundColor: Color(0xFF0B9A96),
      ),
      body: FutureBuilder<List<Station>>(
        future: futureStations,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (snapshot.hasData) {
            List<Station>? stations = snapshot.data;
            return ListView.builder(
              itemCount: stations!.length,
              itemBuilder: (context, index) {
                Station station = stations[index];
                return ListTile(
                  leading: Image.asset('images/pg1.png',
                    width: 50, // Set your width
                    height: 50, // and height here
                    fit: BoxFit.cover,
                  ),
                  title: Text(
                    station.nom,
                    style: TextStyle(fontWeight: FontWeight.bold), // Bold font style for station name
                  ),
                  subtitle: Text('${station.longitude.toString()} km'),
                  trailing: FutureBuilder<List<Price>>(
                    future: ApiService().fetchPricesForStation(station.id),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator(); // Return a CircularProgressIndicator while loading
                      } else if (snapshot.hasError) {
                        return Text("Price: Error");
                      } else if (snapshot.hasData) {
                        List<Price>? prices = snapshot.data;
                        // Assuming the first price is displayed
                        if (prices != null && prices.isNotEmpty) {
                          return Text(
                            '${prices[0].prix.toString()} MAD',
                            style: TextStyle(fontWeight: FontWeight.bold), // Bold font style for price
                          );
                        } else {
                          return Text('N/A');
                        }
                      } else {
                        return Text('N/A');
                      }
                    },
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StationDetailsScreen(station: station),
                      ),
                    );
                  },
                );
              },
            );
          } else {
            return Center(child: Text("No data available"));
          }
        },
      ),
    );
  }
}
