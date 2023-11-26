// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum LanguageType { ENGLISH, ARABIC }

const String ARABIC = "ar";
const String ENGLISH = "en";
const String ASSET_PATH_LOCALISATIONS = "assets/translation";

const Locale ARABIC_LOCAL = Locale("ar", "SY");
const Locale ENGLISH_LOCAL = Locale("en", "US");

extension LanguageTypeExtension on LanguageType {
  String getValue() {
    switch (this) {
      case LanguageType.ENGLISH:
        return ENGLISH;
      case LanguageType.ARABIC:
        return ARABIC;
    }
  }
}

class AppLocalizations {
  final Locale? locale;

  AppLocalizations({
    this.locale,
  });

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  late Map<String, String> _localizedStrings;

  Future loadJsonLanguage() async {
    String jsonString = await rootBundle.loadString(
        "$ASSET_PATH_LOCALISATIONS/${locale!.languageCode}-${locale!.countryCode}.json");

    Map<String, dynamic> jsonMap = json.decode(jsonString);
    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });
  }

  String translate(String key) => _localizedStrings[key] ?? key;

  // is current language arabic
  static bool isCurrentLanguageArabic(BuildContext context) {
    return Localizations.localeOf(context).languageCode == ARABIC;
  }
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return [ENGLISH, ARABIC].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations localizations = AppLocalizations(locale: locale);
    await localizations.loadJsonLanguage();
    return localizations;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) =>
      false;
}

extension TranslateX on String {
  String tr(context) {
    return AppLocalizations.of(context)!.translate(this);
  }
}
