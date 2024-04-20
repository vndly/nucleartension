import 'dart:ui';
import 'package:nucleartension/utils/assets.dart';
import 'package:nucleartension/utils/localizations.dart';
import 'package:nucleartension/utils/palette.dart';

enum Country {
  usa(
    code: 'us',
    color: Palette.countryUsa,
  ),
  russia(
    code: 'ru',
    color: Palette.countryRussia,
  ),
  china(
    code: 'cn',
    color: Palette.countryChina,
  ),
  uk(
    code: 'gb',
    color: Palette.countryUnitedKingdom,
  ),
  france(
    code: 'fr',
    color: Palette.countryFrance,
  ),
  north_korea(
    code: 'kp',
    color: Palette.countryNorthKorea,
  ),
  india(
    code: 'in',
    color: Palette.countryIndia,
  ),
  pakistan(
    code: 'pk',
    color: Palette.countryPakistan,
  ),
  israel(
    code: 'il',
    color: Palette.countryIsrael,
  );

  final String code;
  final Color color;

  const Country({
    required this.code,
    required this.color,
  });

  String get flag {
    switch (this) {
      case usa:
        return Assets.IMAGES_COUNTRIES_US;
      case russia:
        return Assets.IMAGES_COUNTRIES_RU;
      case Country.china:
        return Assets.IMAGES_COUNTRIES_CN;
      case Country.uk:
        return Assets.IMAGES_COUNTRIES_GB;
      case Country.france:
        return Assets.IMAGES_COUNTRIES_FR;
      case Country.north_korea:
        return Assets.IMAGES_COUNTRIES_KP;
      case Country.india:
        return Assets.IMAGES_COUNTRIES_IN;
      case Country.pakistan:
        return Assets.IMAGES_COUNTRIES_PK;
      case Country.israel:
        return Assets.IMAGES_COUNTRIES_IL;
    }
  }

  String get localized {
    switch (this) {
      case usa:
        return Localized.get.typeCountryUsa;
      case russia:
        return Localized.get.typeCountryRussia;
      case Country.china:
        return Localized.get.typeCountryChina;
      case Country.uk:
        return Localized.get.typeCountryUk;
      case Country.france:
        return Localized.get.typeCountryFrance;
      case Country.north_korea:
        return Localized.get.typeCountryNorthKorea;
      case Country.india:
        return Localized.get.typeCountryIndia;
      case Country.pakistan:
        return Localized.get.typeCountryPakistan;
      case Country.israel:
        return Localized.get.typeCountryIsrael;
    }
  }
}
