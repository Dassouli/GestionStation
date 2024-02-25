import 'package:flutter/material.dart';
import 'package:station_frontend/screens/station_list.dart';
import 'package:station_frontend/services/AjouterService.dart';

class AjouterStationScreen extends StatefulWidget {
  @override
  _AjouterStationScreenState createState() => _AjouterStationScreenState();
}

class _AjouterStationScreenState extends State<AjouterStationScreen> {
  TextEditingController nomController = TextEditingController();
  TextEditingController logoUrlController = TextEditingController();
  TextEditingController adresseController = TextEditingController();
  TextEditingController villeController = TextEditingController();
  TextEditingController latitudeController = TextEditingController();
  TextEditingController longitudeController = TextEditingController();

  void _ajouter() async {
    String nom = nomController.text.trim();
    String logo = logoUrlController.text.trim();
    String adresse = adresseController.text.trim();
    String ville = villeController.text.trim();
    String latitudeText = latitudeController.text.trim();
    String longitudeText = longitudeController.text.trim();

    // Perform basic validation
    if (nom.isEmpty ||
        logo.isEmpty ||
        adresse.isEmpty ||
        ville.isEmpty ||
        latitudeText.isEmpty ||
        longitudeText.isEmpty) {
      // Show an error message to the user
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Please enter all fields.'),
      ));
      return;
    }

    double? latitude = double.tryParse(latitudeText);
    double? longitude = double.tryParse(longitudeText);

    // Check if latitude and longitude are valid doubles
    if (latitude == null || longitude == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Latitude and longitude must be valid numbers.'),
      ));
      return;
    }

    bool success = await AjouterStation.saveStation(
        nom, logo, adresse, ville, latitude, longitude);
    if (success != null) {
      // Signup successful, navigate to login screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => StationsListScreen()),
      );
    } else {
      // Show an error message if signup fails
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Failed to create user. Please try again.'),
      ));
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0B9A96),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ajouter'.toUpperCase(),
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Ajouter une station',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(color: Colors.white54),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30))),
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(0, 5),
                              color: Color(0xFF0B9A96).withOpacity(.2),
                              spreadRadius: 5,
                              blurRadius: 10)
                        ]),
                    child: TextField(
                      controller: nomController,
                      decoration: InputDecoration(
                          hintText: 'Nom de la station',
                          border: InputBorder.none),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(0, 5),
                              color: Color(0xFF0B9A96).withOpacity(.2),
                              spreadRadius: 5,
                              blurRadius: 10)
                        ]),
                    child: TextField(
                      controller: logoUrlController,
                      decoration: InputDecoration(
                          hintText: 'Url de logo ', border: InputBorder.none),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(0, 5),
                              color: Color(0xFF0B9A96).withOpacity(.2),
                              spreadRadius: 5,
                              blurRadius: 10)
                        ]),
                    child: TextField(
                      controller: adresseController,
                      decoration: InputDecoration(
                          hintText: 'Adresse', border: InputBorder.none),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(0, 5),
                              color: Color(0xFF0B9A96).withOpacity(.2),
                              spreadRadius: 5,
                              blurRadius: 10)
                        ]),
                    child: TextField(
                      controller: villeController,
                      decoration: InputDecoration(
                          hintText: 'Ville', border: InputBorder.none),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(0, 5),
                              color: Color(0xFF0B9A96).withOpacity(.2),
                              spreadRadius: 5,
                              blurRadius: 10)
                        ]),
                    child: TextField(
                      controller: latitudeController,
                      decoration: InputDecoration(
                          hintText: 'Latitude', border: InputBorder.none),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(0, 5),
                              color: Color(0xFF0B9A96).withOpacity(.2),
                              spreadRadius: 5,
                              blurRadius: 10)
                        ]),
                    child: TextField(
                      controller: longitudeController,
                      decoration: InputDecoration(
                          hintText: 'Longitude', border: InputBorder.none),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: _ajouter,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(15),
                    ),
                    child: const Text('Ajouter'),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
