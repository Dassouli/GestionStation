import 'package:flutter/material.dart';
import 'package:station_frontend/screens/ajouter_station_screen.dart';
import 'package:station_frontend/screens/faq_page.dart';
import 'package:station_frontend/screens/langue_page.dart';
import 'package:station_frontend/screens/login_screen.dart';
import 'package:station_frontend/screens/map_screen.dart';
import 'package:station_frontend/screens/reclamation_page.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
        DrawerHeader(
        decoration: BoxDecoration(
            color: Color(0xFF0B9A96),
        ),
        child: Image.asset('images/logo.png',width: 200, height: 200),
        ),


            ListTile(
              title: Text('FAQ'),
              onTap: () {
                Navigator.pop(context); // Ferme le menu
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FAQPage()),
                );
              },
            ),
            Divider(),
            // Séparateur entre les listes
            ListTile(
              title: Text('LANGUE'),
              onTap: () {
                Navigator.pop(context); // Ferme le menu
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LanguePage()),
                );
              },
            ),
           /* Divider(),
            ListTile(
              title: Text('AJOUTER STATION'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AjouterStationScreen()),
                );
              },
            ),*/
            Divider(),
            ListTile(
              title: Text('SE CONNECTER'),
              onTap: () {
                Navigator.pop(context); // Ferme le menu
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
            ),
            Divider(),
            ListTile(
              title: Text('RECHERCHER STATION'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MapScreen()),
                );
              },
            ),
            Divider(),
            ListTile(
              title: Text('RECLAMATION'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ReclamationScreen()),
                );
              },
            ),
          ],
        ),
    );
  }
}