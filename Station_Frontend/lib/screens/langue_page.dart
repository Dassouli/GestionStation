import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../services/LangueService.dart';

class LanguePage extends StatefulWidget {
  @override
  _LanguePageState createState() => _LanguePageState();
}

class _LanguePageState extends State<LanguePage> {
  String? _selectedLangue; // Variable to store the selected language

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LANGUE'),
        backgroundColor: Color(0xFF0B9A96),
      ),
      body: Container(
        color: Color(0xFF0B9A96),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('images/logo.png', width: 200, height: 200),
              SizedBox(height: 20),
              Text(
                'Choisissez votre langue',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio(
                    value: 'Français',
                    groupValue: _selectedLangue,
                    onChanged: (value) {
                      setState(() {
                        _selectedLangue = value as String?;
                      });
                    },
                  ),
                  Text('Français'),
                  SizedBox(width: 20),
                  Radio(
                    value: 'Arabe',
                    groupValue: _selectedLangue,
                    onChanged: (value) {
                      setState(() {
                        _selectedLangue = value as String?;
                      });
                    },
                  ),
                  Text('Arabe'),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_selectedLangue != null) {
                    // Change language
                    Locale newLocale = _selectedLangue == 'Arabe' ? Locale('ar') : Locale('fr');
                    LangueService().setLangue(newLocale);
                    // Restart app to apply language change
                    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                  } else {
                    // No language selected
                    print('Please select a language');
                  }
                },
                child: Text('Valider'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
