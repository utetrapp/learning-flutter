import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'dart:io';

class LocalizationLogic {
  AppLocalizations? _strings;
  AppLocalizations get strings => _strings!;

  bool get isLoaded => _strings != null;

  bool get isEnglish => strings.localeName == 'en';

  Future<void> load() async {
    final localeCode = await findSystemLocale();
    Locale locale = Locale(localeCode.split('_')[0]);
    if (AppLocalizations.supportedLocales.contains(locale) == false) {
      locale = const Locale('en');
    }
    _strings = await AppLocalizations.delegate.load(locale);
  }

  Future<void> loadIfChanged(Locale locale) async {
    bool didChange = _strings?.localeName != locale.languageCode;
    if (didChange && AppLocalizations.supportedLocales.contains(locale)) {
      _strings = await AppLocalizations.delegate.load(locale);
    }
  }

  Future<String> findSystemLocale() {
    try {
      Intl.systemLocale = Intl.canonicalizedLocale(Platform.localeName);
    } catch (e) {
      return Future.value("en");
    }
    return Future.value(Intl.systemLocale);
  }
}
