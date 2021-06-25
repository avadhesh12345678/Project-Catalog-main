import 'package:flutter/material.dart';

class AppState with ChangeNotifier {
  Locale locale = Locale('en');
  var selectedLanguageCode = 'en';

  AppState(lang) {
    selectedLanguageCode = lang;
    if (lang == "en") {
      selectedLanguageCode = lang;
    } else {
      selectedLanguageCode = 'en';
    }
  }

  Locale get getLocale => locale;

  get getSelectedLanguageCode => selectedLanguageCode;

  setLocale(locale) => this.locale = locale;

  setSelectedLanguageCode(code) => this.selectedLanguageCode = code;

  changeLocale(Locale l) {
    var lang = l.languageCode;
    if (lang == "en") {
      locale = l;
      notifyListeners();
    } else {
      locale = 'en' as Locale;
      notifyListeners();
    }
  }

  changeLanguageCode(code) {
    if (code == "en") {
      selectedLanguageCode = code;
      notifyListeners();
    } else {
      selectedLanguageCode = 'en';
      notifyListeners();
    }
  }
}
