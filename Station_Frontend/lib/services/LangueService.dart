import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class LangueService {
  Locale _locale = const Locale('fr', ''); // Default locale is French

  Locale get locale => _locale;

  void setLangue(Locale locale) {
    _locale = locale;
  }

  static LangueService of(BuildContext context) {
    return Localizations.of<LangueService>(context, LangueService)!;
  }

  static const supportedLocales = [
    Locale('fr', ''), // French
    Locale('ar', ''), // Arabic
    // Add more locales as needed
  ];

  // Define a delegate that loads the LangueService
  static const LocalizationsDelegate<LangueService> delegate = _LangueServiceDelegate();
}

// Define the delegate
class _LangueServiceDelegate extends LocalizationsDelegate<LangueService> {
  const _LangueServiceDelegate();

  @override
  bool isSupported(Locale locale) => ['fr', 'ar'].contains(locale.languageCode);

  @override
  Future<LangueService> load(Locale locale) async {
    LangueService service = LangueService();
    service.setLangue(locale);
    return service;
  }

  @override
  bool shouldReload(_LangueServiceDelegate old) => false;
}
