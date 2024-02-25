import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:station_frontend/screens/home_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('fr', ''), // French
        const Locale('ar', ''), // Arabic
      ],
      home: const HomeScreen(), // Use LoginScreen from login_screen.dart
    );
  }
}
