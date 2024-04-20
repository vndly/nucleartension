import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

abstract class BaseLocalized {
  String get applicationName;

  String get bottomBarEvents;

  String get bottomBarMilitary;

  String get bottomBarResearch;

  String get bottomBarResources;

  String get bottomBarWarRoom;

  String get buttonAttack;

  String get buttonCancel;

  String get buttonOk;

  String get dialogInformationPlayerMilitary;

  String get dialogInformationPlayerPopulation;

  String get dialogInformationPlayerResearch;

  String get dialogInformationPlayerUnknown;

  String get dialogPauseResume;

  String get dialogPauseTitle;

  String get dialogSelectorMilitaryTitle;

  String get dialogSelectorMissilesTitle;

  String get headerAttackMissiles;

  String get headerDefcon;

  String get headerDefenseMissiles;

  String get headerMilitaryPower;

  String get homeContinue;

  String get homeInfo;

  String get homeSettings;

  String get labelCurrent;

  String get labelKiloton;

  String get labelLevel;

  String get labelMax;

  String get labelMegaton;

  String get labelMillion;

  String labelQueue(int param1, int param2);

  String labelRequires(String param1);

  String get labelSecond;

  String get screenEventsNoEvents;

  String get screenResearchIntel;

  String get screenResearchMilitary;

  String get screenResearchMissiles;

  String get screenResearchResources;

  String get screenResearchWarning;

  String get screenResearchWeapons;

  String get screenWarRoomIntelMilitary;

  String get screenWarRoomIntelPopulation;

  String get screenWarRoomIntelResearch;

  String get screenWarRoomTabIntel;

  String get screenWarRoomTabPlayers;

  String snackDefcon(int param1);

  String get typeBuildingMilitaryFacilityDescription1;

  String get typeBuildingMilitaryFacilityDescription2;

  String get typeBuildingMilitaryFacilityDescription3;

  String get typeBuildingMilitaryFacilityDescription4;

  String get typeBuildingMilitaryFacilityDescription5;

  String get typeBuildingMilitaryFacilityName;

  String get typeBuildingMissileSiloDescription1;

  String get typeBuildingMissileSiloDescription2;

  String get typeBuildingMissileSiloName;

  String get typeBuildingPowerPlantDescription1;

  String get typeBuildingPowerPlantDescription2;

  String get typeBuildingPowerPlantName;

  String get typeBuildingPropagandaStationDescription1;

  String get typeBuildingPropagandaStationDescription2;

  String get typeBuildingPropagandaStationName;

  String get typeBuildingSupplyCenterDescription1;

  String get typeBuildingSupplyCenterDescription2;

  String get typeBuildingSupplyCenterName;

  String get typeBuildingTechLabDescription1;

  String get typeBuildingTechLabDescription2;

  String get typeBuildingTechLabName;
}

class ENLocalized extends BaseLocalized {
  @override
  String get applicationName => 'Nuclear Tension';

  @override
  String get bottomBarEvents => 'Events';

  @override
  String get bottomBarMilitary => 'Military';

  @override
  String get bottomBarResearch => 'Research';

  @override
  String get bottomBarResources => 'Resources';

  @override
  String get bottomBarWarRoom => 'War room';

  @override
  String get buttonAttack => 'Attack';

  @override
  String get buttonCancel => 'Cancel';

  @override
  String get buttonOk => 'Ok';

  @override
  String get dialogInformationPlayerMilitary => 'Military:';

  @override
  String get dialogInformationPlayerPopulation => 'Population:';

  @override
  String get dialogInformationPlayerResearch => 'Research:';

  @override
  String get dialogInformationPlayerUnknown => 'Unknown';

  @override
  String get dialogPauseResume => 'Resume';

  @override
  String get dialogPauseTitle => 'Pause';

  @override
  String get dialogSelectorMilitaryTitle => 'Select amount of military power';

  @override
  String get dialogSelectorMissilesTitle => 'Select amount of missiles';

  @override
  String get headerAttackMissiles => 'Attack Missiles:';

  @override
  String get headerDefcon => 'DEFCON:';

  @override
  String get headerDefenseMissiles => 'Defense Missiles:';

  @override
  String get headerMilitaryPower => 'Military Power:';

  @override
  String get homeContinue => 'Continue';

  @override
  String get homeInfo => 'Info';

  @override
  String get homeSettings => 'Settings';

  @override
  String get labelCurrent => 'Current';

  @override
  String get labelKiloton => 'Kt';

  @override
  String get labelLevel => 'Level';

  @override
  String get labelMax => 'Max';

  @override
  String get labelMegaton => 'Mt';

  @override
  String get labelMillion => 'M';

  @override
  String labelQueue(int param1, int param2) =>
      'Queue ${param1.toString()}/${param2.toString()}';

  @override
  String labelRequires(String param1) => 'Requires ${param1.toString()}';

  @override
  String get labelSecond => 's';

  @override
  String get screenEventsNoEvents => 'No events';

  @override
  String get screenResearchIntel => 'Intel';

  @override
  String get screenResearchMilitary => 'Military';

  @override
  String get screenResearchMissiles => 'Missiles';

  @override
  String get screenResearchResources => 'Resources';

  @override
  String get screenResearchWarning => 'Warning';

  @override
  String get screenResearchWeapons => 'Weapons';

  @override
  String get screenWarRoomIntelMilitary => 'Military';

  @override
  String get screenWarRoomIntelPopulation => 'Population';

  @override
  String get screenWarRoomIntelResearch => 'Research';

  @override
  String get screenWarRoomTabIntel => 'Intel';

  @override
  String get screenWarRoomTabPlayers => 'Players';

  @override
  String snackDefcon(int param1) => 'DEFCON ${param1.toString()}';

  @override
  String get typeBuildingMilitaryFacilityDescription1 =>
      'Creates military units:';

  @override
  String get typeBuildingMilitaryFacilityDescription2 => '* Infantry';

  @override
  String get typeBuildingMilitaryFacilityDescription3 => '* Vehicles';

  @override
  String get typeBuildingMilitaryFacilityDescription4 => '* Aircraft';

  @override
  String get typeBuildingMilitaryFacilityDescription5 =>
      'Each level of this building increases its queue size.';

  @override
  String get typeBuildingMilitaryFacilityName => 'Military Facility';

  @override
  String get typeBuildingMissileSiloDescription1 =>
      'Creates defense and attack missiles.';

  @override
  String get typeBuildingMissileSiloDescription2 =>
      'Each level of this building increases its queue size.';

  @override
  String get typeBuildingMissileSiloName => 'Missile Silo';

  @override
  String get typeBuildingPowerPlantDescription1 => 'Produces energy.';

  @override
  String get typeBuildingPowerPlantDescription2 =>
      'Each level of this building increases its production output.';

  @override
  String get typeBuildingPowerPlantName => 'Power Plant';

  @override
  String get typeBuildingPropagandaStationDescription1 =>
      'Produces population.';

  @override
  String get typeBuildingPropagandaStationDescription2 =>
      'Each level of this building increases its production output.';

  @override
  String get typeBuildingPropagandaStationName => 'Propaganda Station';

  @override
  String get typeBuildingSupplyCenterDescription1 => 'Produces supplies.';

  @override
  String get typeBuildingSupplyCenterDescription2 =>
      'Each level of this building increases its production output.';

  @override
  String get typeBuildingSupplyCenterName => 'Supply Center';

  @override
  String get typeBuildingTechLabDescription1 => 'Produces technology.';

  @override
  String get typeBuildingTechLabDescription2 =>
      'Each level of this building increases its production output.';

  @override
  String get typeBuildingTechLabName => 'Tech Lab';
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
