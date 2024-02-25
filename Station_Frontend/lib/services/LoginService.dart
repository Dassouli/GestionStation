import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginService {
  static Future<Map<String, dynamic>?> authenticate(String username, String password) async {
    // Define the endpoint URL for authentication
    final String apiUrl = 'http://127.0.0.1:8080/v1/auth/token';

    // Create the request body
    final Map<String, dynamic> requestBody = {
      'username': username,
      'password': password,
    };

    try {
      // Make a POST request to the authentication API
      final http.Response response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(requestBody),
      );

      // Check if the request was successful (status code 200)
      if (response.statusCode == 200) {
        // Parse the response JSON
        Map<String, dynamic> responseData = jsonDecode(response.body);
        return responseData;
      } else {
        // If the request fails, return null
        return null;
      }
    } catch (e) {
      // If an error occurs during the HTTP request, return null
      print('Error connecting to the authentication API: $e');
      return null;
    }
  }
  Future<void> saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }
  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }
  Future<bool> isLoggedIn() async {
    String? token = await getToken();
    return token != null;
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
  }
}
