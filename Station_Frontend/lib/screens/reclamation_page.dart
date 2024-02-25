import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ReclamationScreen extends StatelessWidget {
  final String email = 'imandassouli@gmail.com';
  final String subject = "Reclamation a propos de l'application StationMaster";
  final String body = 'Write your reclamation here...';

  Future<void> _sendEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: {
        'subject': subject,
        'body': body,
      },
    );
    final String emailUrl = emailUri.toString();

    if (await canLaunch(emailUrl)) {
      await launch(emailUrl);
    } else {
      throw 'Could not launch $emailUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    // Call _sendEmail() method immediately when the screen is opened
    _sendEmail();

    return Scaffold(
      appBar: AppBar(
        title: Text('Reclamation'),
        backgroundColor: Color(0xFF0B9A96), // Adjust color as needed
      ),
      body: Center(
        child: CircularProgressIndicator(), // Placeholder widget
      ),
    );
  }
}
