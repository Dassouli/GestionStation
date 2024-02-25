import 'dart:convert';
import 'package:http/http.dart' as http;

class SignupService {
  static Future<bool> createUser(String name, String email, String password,String roles,String message) async {

    final String apiUrl = 'http://127.0.01:8080/v1/auth';

    // Create the request body
    final Map<String, dynamic> requestBody = {
      'name': name,
      'email': email,
      'password': password,
      'roles': roles,
      'message': message,
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
        print('Failed to create user: ${response.body}');
        return false;
      }
    } catch (e) {
      // If an error occurs during the HTTP request, return false
      print('Error connecting to the signup API: $e');
      return false;
    }

  }

}


