import 'package:flutter/material.dart';
import 'package:station_frontend/screens/login_screen.dart';
import 'package:station_frontend/screens/signup_screen.dart';
import 'package:station_frontend/services/LoginService.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _TestState();
}

class _TestState extends State<HomeScreen> {
  final LoginService _loginService = LoginService();

  Future<void> _logout(BuildContext context) async {
    await _loginService.logout();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
          (route) => false,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF0B9A96), // Set the color to green
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome in StationMaster",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20), // Add some space between the text and the logo
              // Add your logo widget here
              Image.asset(
                'images/logo.png',
                width: 100, // Adjust width as needed
                height: 100, // Adjust height as needed
              ),
              // Optionally, you can add a text widget below the logo
              // Text(
              //   "Your additional text here",
              //   style: TextStyle(
              //     fontSize: 16,
              //     color: Colors.white,
              //   ),
              // ),
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 300, // Adjust width as needed
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignupScreen()),
                );
              },
              child: Text('Sign Up'),
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
            ),
          ),
          SizedBox(width: 50),
          SizedBox(
            width: 300, // Adjust width as needed
            child: FloatingActionButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                      (route) => false,
                );
              },
              child: Text('Sign In'),
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}