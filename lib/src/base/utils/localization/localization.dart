import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/src/base/dependencyinjection/locator.dart';
import 'package:flutter_boilerplate/src/base/utils/navigation_utils.dart';
import 'package:intl/intl.dart';

import 'localization_en.dart';

class MyLocalizationsDelegate extends LocalizationsDelegate<Localization> {
  const MyLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => [
        'en',
      ].contains(locale.languageCode);

// @override
////   bool isSupported(Locale locale) => ['en', 'fr'].contains(locale.languageCode);

  @override
  Future<Localization> load(Locale locale) => _load(locale);

  static Future<Localization> _load(Locale locale) async {
    final String name =
        (locale.countryCode == null || locale.countryCode!.isEmpty)
            ? locale.languageCode
            : locale as String;

    final localeName = Intl.canonicalizedLocale(name);
    Intl.defaultLocale = localeName;

    // if( locale.languageCode == "fr" ) {
    //   return LocalizationFR();
    // } else {
    //   return LocalizationEN();
    // }

    return LocalizationEN();
  }

  @override
  bool shouldReload(LocalizationsDelegate<Localization> old) => false;
}

abstract class Localization {
  static Localization of() {
    return Localizations.of<Localization>(
        locator<NavigationUtils>().getCurrentContext, Localization)!;
  }

  // Common Strings
  String get internetNotConnected;
  String get poorInternetConnection;
  String get alertPermissionNotRestricted;
  String get appName;
  String get ok;
  String get cancel;
  String get edit;
  String get delete;
  String get done;
  String get logout;
  String get galleryTitle;
  String get cameraTitle;
  String get yes;
  String get no;
  String get save;
  String get search;

  // Auth Stringd

  //Full Name
  String get fullname;
  String get msgFullNameEmpty;
  String get msgFullNameInvalid;
  //Email
  String get email;
  String get msgEmailEmpty;
  String get msgEmailInvalid;
  //Password
  String get password;
  String get msgPasswordEmpty;
  String get msgPasswordError;
  //Confirm Password
  String get confirmPassword;
  String get msgConfirmPasswordEmpty;
  String get msgPasswordNotMatch;
  //Trade
  String get tradeName;
  String get msgTradeNameEmpty;
  String get msgTradeNameInvalid;
  //cr
  String get cr;
  String get msgCREmpty;
  String get msgCRInvalid;
  //city
  String get city;
  String get msgCityEmpty;
  String get msgCityInvalid;
  //vat
  String get vat;
  String get msgVATEmpty;
  String get msgVATInvalid;
}
