import 'package:flutter/material.dart';
import 'package:station_frontend/screens/login_screen.dart';
import 'package:station_frontend/services/SignupService.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rolesController = TextEditingController();
  TextEditingController messsageController = TextEditingController();
  void _signup() async {
    String name = nameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String roles = rolesController.text.trim();
    String message = messsageController.text.trim();
    // Perform basic validation
    if (name.isEmpty || email.isEmpty || password.isEmpty || roles.isEmpty|| message.isEmpty) {
      // Show an error message to the user
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Please enter all fields.'),
      ));
      return;
    }

    // Call SignupService to create user
    bool success = await SignupService.createUser(name, email, password, roles,message);
    if (success != null) {
      // Signup successful, navigate to login screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    } else {
      // Show an error message if signup fails
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Failed to create user. Please try again.'),
      ));
    }
  }

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.white),
            ),
            const Text('Back',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white))
          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0B9A96),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _backButton(),
          Container(
            height: 200,
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sign Up'.toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Create an account to get started',
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(color: Colors.white54),
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
                      controller: nameController,
                      decoration: InputDecoration(
                          hintText: 'Name', border: InputBorder.none),
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
                      controller: emailController,
                      decoration: InputDecoration(
                          hintText: 'Email', border: InputBorder.none),
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
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: 'Password', border: InputBorder.none),
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
                      controller: rolesController,
                      decoration: InputDecoration(
                          hintText: 'Roles', border: InputBorder.none),
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
                      controller: messsageController,
                      decoration: InputDecoration(
                          hintText: 'Message', border: InputBorder.none),
                    ),
                  ),

                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: _signup,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(15),
                    ),
                    child: const Text('Sign Up'),
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
