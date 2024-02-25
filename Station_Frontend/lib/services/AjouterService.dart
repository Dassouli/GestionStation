import 'dart:convert';
import 'package:http/http.dart' as http;

class AjouterStation {
  static Future<bool> saveStation(String nom, String logoUrl, String adresse,String ville,double latitude,double longitude) async {

    final String apiUrl = 'http://127.0.01:8080/api/stations';

    // Create the request body
    final Map<String, dynamic> requestBody = {
      'nom': nom,
      'logo': logoUrl,
      'adresse': adresse,
      'ville': ville,
      'latitude': latitude,
      'longitude': longitude,
    };

    try {
      // Make a POST request to the signup API
      final http.Response response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(requestBody),
      );

      // Check if the request was successful (status code 200)
      if (response.statusCode == 200) {
        // Account creation successful

        return true;
      } else {
        // Account creation failed
        print('Failed to create station: ${response.body}');
        return false;
      }
    } catch (e) {
      // If an error occurs during the HTTP request, return false
      print('Error connecting to the signup API: $e');
      return false;
    }

  }

}


