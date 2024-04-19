import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

abstract class BaseLocalized {
  String get applicationName;

  String get buttonOk;

  String get dialogInformationPlayerMilitary;

  String get dialogInformationPlayerPopulation;

  String get dialogInformationPlayerTechnology;

  String get dialogInformationPlayerUnknown;

  String get gameAdsLoadingAd;

  String get gameDeadGet;

  String get gameDeadInfinite;

  String get gameDeadTitle;

  String get gameDeadWait;

  String get gameDeadWaitEnded;

  String get gameGameFinishedRateAndShare;

  String get gameGameFinishedSubtitle;

  String get gameGameFinishedTitle;

  String get gameGameFinishedWebSubtitle;

  String get gameGameFinishedWebTitle;

  String get gameLabelDoubleCoins;

  String gameLabelLevel(String param1);

  String get gamePauseContinue;

  String get gamePauseTitle;

  String get gameRetryShield;

  String get gameRetrySkip;

  String get gameRetryTitle;

  String get gameTutorialPowerUpShieldDescription;

  String gameTutorialPowerUpTimeFastDescription(String param1);

  String gameTutorialPowerUpTimeSlowDescription(String param1);

  String get gameTutorialPowerUpTitle;

  String get homeButtonContinue;

  String get homeButtonDownload;

  String get homeButtonFreeCoin;

  String get homeButtonLevels;

  String get homeLabelMoreLivesIn;

  String get screenAvatarsSelect;

  String get screenAvatarsSelected;

  String get screenAvatarsUnlock;

  String get screenAvatarsUnlockAll;

  String get screenInfoCredits;

  String get screenInfoFeedback;

  String get screenInfoMoreGames;

  String get screenInfoPrivacy;

  String get screenInfoTermsAndConditions;

  String get screenLevelsMoreLevels;

  String get screenLevelsUnlockAllLevels;

  String get screenSettingsAudio;

  String get screenSettingsRestorePurchases;

  String get screenSettingsVibration;

  String get shopBuyAllAvatars;

  String get shopBuyAllLevels;

  String get shopBuyCoins;

  String get shopBuyInfiniteLives;

  String get splashLoading;

  String get splashWeb;
}

class ENLocalized extends BaseLocalized {
  @override
  String get applicationName => 'Nuclear Tension';

  @override
  String get buttonOk => 'OK';

  @override
  String get dialogInformationPlayerMilitary => 'Military:';

  @override
  String get dialogInformationPlayerPopulation => 'Population:';

  @override
  String get dialogInformationPlayerTechnology => 'Technology:';

  @override
  String get dialogInformationPlayerUnknown => 'Unknown';

  @override
  String get gameAdsLoadingAd => 'Loading ad…';

  @override
  String get gameDeadGet => 'Get';

  @override
  String get gameDeadInfinite => 'Get infinite';

  @override
  String get gameDeadTitle => 'You are out of lives';

  @override
  String get gameDeadWait => 'Wait';

  @override
  String get gameDeadWaitEnded => 'Get lives';

  @override
  String get gameGameFinishedRateAndShare =>
      'Rate and share the game with your friends';

  @override
  String get gameGameFinishedSubtitle =>
      'There will be more levels coming soon!';

  @override
  String get gameGameFinishedTitle => 'You completed the game!';

  @override
  String get gameGameFinishedWebSubtitle =>
      'Download the full game to play many more levels';

  @override
  String get gameGameFinishedWebTitle => 'You completed the demo!';

  @override
  String get gameLabelDoubleCoins => 'Double coins';

  @override
  String gameLabelLevel(String param1) => 'Level ${param1.toString()}';

  @override
  String get gamePauseContinue => 'Continue';

  @override
  String get gamePauseTitle => 'Paused';

  @override
  String get gameRetryShield => 'Get a shield';

  @override
  String get gameRetrySkip => 'Skip level';

  @override
  String get gameRetryTitle => 'You crashed!';

  @override
  String get gameTutorialPowerUpShieldDescription =>
      'Protects you if you collide with an enemy';

  @override
  String gameTutorialPowerUpTimeFastDescription(String param1) =>
      'Speeds up time for ${param1.toString()} seconds';

  @override
  String gameTutorialPowerUpTimeSlowDescription(String param1) =>
      'Slows down time for ${param1.toString()} seconds';

  @override
  String get gameTutorialPowerUpTitle => 'New power up!';

  @override
  String get homeButtonContinue => 'Continue';

  @override
  String get homeButtonDownload => 'Download game';

  @override
  String get homeButtonFreeCoin => 'Free coins';

  @override
  String get homeButtonLevels => 'Levels';

  @override
  String get homeLabelMoreLivesIn => 'More lives in:';

  @override
  String get screenAvatarsSelect => 'Select';

  @override
  String get screenAvatarsSelected => 'Selected';

  @override
  String get screenAvatarsUnlock => 'Unlock';

  @override
  String get screenAvatarsUnlockAll => 'Unlock all';

  @override
  String get screenInfoCredits => 'Credits';

  @override
  String get screenInfoFeedback => 'Feedback';

  @override
  String get screenInfoMoreGames => 'More games';

  @override
  String get screenInfoPrivacy => 'Privacy';

  @override
  String get screenInfoTermsAndConditions => 'Terms and conditions';

  @override
  String get screenLevelsMoreLevels => 'More levels coming soon';

  @override
  String get screenLevelsUnlockAllLevels => 'Unlock all';

  @override
  String get screenSettingsAudio => 'Audio';

  @override
  String get screenSettingsRestorePurchases => 'Restore purchases';

  @override
  String get screenSettingsVibration => 'Vibration';

  @override
  String get shopBuyAllAvatars => 'Unlock all spaceships';

  @override
  String get shopBuyAllLevels => 'Unlock all levels';

  @override
  String get shopBuyCoins => 'Get';

  @override
  String get shopBuyInfiniteLives => 'Infinite lives';

  @override
  String get splashLoading => 'Loading';

  @override
  String get splashWeb => 'Tap to start';
}

class Localized {
  static late BaseLocalized get;
  static late Locale current;

  static List<Locale> locales = localized.keys.map(Locale.new).toList();

  static Map<String, BaseLocalized> localized = <String, BaseLocalized>{
    'en': ENLocalized()
  };

  static bool isSupported(Locale locale) =>
      locales.map((Locale l) => l.languageCode).contains(locale.languageCode);

  static void load(Locale locale) {
    current = locale;
    get = localized[locale.languageCode]!;
  }
}

class CustomLocalizationsDelegate extends LocalizationsDelegate<dynamic> {
  const CustomLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => Localized.isSupported(locale);

  @override
  Future<dynamic> load(Locale locale) {
    Localized.load(locale);
    return SynchronousFuture<dynamic>(Object());
  }

  @override
  bool shouldReload(CustomLocalizationsDelegate old) => false;
}
