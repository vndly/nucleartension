import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

abstract class BaseLocalized {
  String get applicationName;

  String attackMissileIncoming(String param1, int param2, String param3);

  String attackMissileOutgoing(String param1, int param2, String param3);

  String attackUnitIncoming(String param1, int param2);

  String attackUnitOutgoing(String param1, int param2);

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

  String get eventAttackMissileLaunchLine1;

  String eventAttackMissileLaunchLine2(String param1);

  String eventAttackMissileLaunchLine3(String param1);

  String eventAttackMissileLaunchLine4(int param1, String param2);

  String get eventAttackMissileResultLine1;

  String eventAttackMissileResultLine2(String param1, String param2);

  String eventAttackMissileResultLine3(String param1, String param2);

  String eventAttackMissileResultLine4(int param1, String param2);

  String eventAttackMissileResultLine5(int param1, String param2);

  String eventAttackMissileResultLine6(String param1);

  String get eventAttackUnitLaunchLine1;

  String eventAttackUnitLaunchLine2(String param1);

  String eventAttackUnitLaunchLine3(String param1);

  String eventAttackUnitLaunchLine4(String param1);

  String get eventAttackUnitResultLine1;

  String eventAttackUnitResultLine2(String param1, String param2);

  String eventAttackUnitResultLine3(String param1, String param2);

  String eventAttackUnitResultLine4(String param1);

  String eventAttackUnitResultLine5(String param1);

  String eventDefconLine1(int param1);

  String get eventDefconLine2Level1;

  String get eventDefconLine2Level2;

  String get eventDefconLine2Level3;

  String get eventDefconLine2Level4;

  String eventDefconLine3(int param1);

  String eventPlayerDefeatedLine1(String param1);

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

  String get labelNone;

  String labelPeople(String param1);

  String labelQueue(int param1, int param2);

  String labelRequires(String param1);

  String get labelSecond;

  String get labelWinner;

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

  String get typeCountryChina;

  String get typeCountryFrance;

  String get typeCountryIndia;

  String get typeCountryIsrael;

  String get typeCountryNorthKorea;

  String get typeCountryPakistan;

  String get typeCountryRussia;

  String get typeCountryUk;

  String get typeCountryUsa;

  String get typeResearchActiveTrackingDescription;

  String get typeResearchActiveTrackingName;

  String get typeResearchAdditiveManufacturingDescription;

  String get typeResearchAdditiveManufacturingName;

  String get typeResearchAssemblyAutomationDescription;

  String get typeResearchAssemblyAutomationName;

  String get typeResearchGridManagementDescription;

  String get typeResearchGridManagementName;

  String get typeResearchIndoctrinationDescription;

  String get typeResearchIndoctrinationName;

  String get typeResearchProductionChainDescription;

  String get typeResearchProductionChainName;

  String get typeResearchQuantumComputingDescription;

  String get typeResearchQuantumComputingName;

  String get typeResearchSignalJammingDescription;

  String get typeResearchSignalJammingName;

  String get typeResourceEnergy;

  String get typeResourcePopulation;

  String get typeResourceSupplies;

  String get typeResourceTechnology;

  String typeUnitAircraftDescription(int param1);

  String get typeUnitAircraftName;

  String get typeUnitAttackMissileDescription1;

  String get typeUnitAttackMissileDescription2;

  String get typeUnitAttackMissileName;

  String get typeUnitDefenseMissileDescription1;

  String get typeUnitDefenseMissileDescription2;

  String get typeUnitDefenseMissileName;

  String typeUnitInfantryDescription(int param1);

  String get typeUnitInfantryName;

  String typeUnitVehiclesDescription(int param1);

  String get typeUnitVehiclesName;
}

class ENLocalized extends BaseLocalized {
  @override
  String get applicationName => 'Nuclear Tension';

  @override
  String attackMissileIncoming(String param1, int param2, String param3) =>
      'Incoming missile attack from ${param1.toString()} with ${param2.toString()} missiles (${param3.toString()})';

  @override
  String attackMissileOutgoing(String param1, int param2, String param3) =>
      'Outgoing missile attack to ${param1.toString()} with ${param2.toString()} missiles (${param3.toString()})';

  @override
  String attackUnitIncoming(String param1, int param2) =>
      'Incoming unit attack from ${param1.toString()} with ${param2.toString()}';

  @override
  String attackUnitOutgoing(String param1, int param2) =>
      'Outgoing unit attack to ${param1.toString()} with ${param2.toString()}';

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
  String get eventAttackMissileLaunchLine1 => 'Missile attack launched';

  @override
  String eventAttackMissileLaunchLine2(String param1) =>
      'Attacker: ${param1.toString()}';

  @override
  String eventAttackMissileLaunchLine3(String param1) =>
      'Defender: ${param1.toString()}';

  @override
  String eventAttackMissileLaunchLine4(int param1, String param2) =>
      'Amount: ${param1.toString()} (${param2.toString()})';

  @override
  String get eventAttackMissileResultLine1 => 'Missile attack finished';

  @override
  String eventAttackMissileResultLine2(String param1, String param2) =>
      'Attacker: ${param1.toString()}${param2.toString()}';

  @override
  String eventAttackMissileResultLine3(String param1, String param2) =>
      'Defender: ${param1.toString()}${param2.toString()}';

  @override
  String eventAttackMissileResultLine4(int param1, String param2) =>
      'Total missiles: ${param1.toString()} (${param2.toString()})';

  @override
  String eventAttackMissileResultLine5(int param1, String param2) =>
      'Successful missiles: ${param1.toString()}${param2.toString()}';

  @override
  String eventAttackMissileResultLine6(String param1) =>
      'Defender loses: ${param1.toString()}';

  @override
  String get eventAttackUnitLaunchLine1 => 'Unit attack launched';

  @override
  String eventAttackUnitLaunchLine2(String param1) =>
      'Attacker: ${param1.toString()}';

  @override
  String eventAttackUnitLaunchLine3(String param1) =>
      'Defender: ${param1.toString()}';

  @override
  String eventAttackUnitLaunchLine4(String param1) =>
      'Power: ${param1.toString()}';

  @override
  String get eventAttackUnitResultLine1 => 'Unit attack finished';

  @override
  String eventAttackUnitResultLine2(String param1, String param2) =>
      'Attacker: ${param1.toString()}${param2.toString()}';

  @override
  String eventAttackUnitResultLine3(String param1, String param2) =>
      'Defender: ${param1.toString()}${param2.toString()}';

  @override
  String eventAttackUnitResultLine4(String param1) =>
      'Power: ${param1.toString()}';

  @override
  String eventAttackUnitResultLine5(String param1) =>
      'Defender loses: ${param1.toString()}';

  @override
  String eventDefconLine1(int param1) => 'DEFCON ${param1.toString()}';

  @override
  String get eventDefconLine2Level1 => 'A player has launched a missile attack';

  @override
  String get eventDefconLine2Level2 => 'A player has created an attack missile';

  @override
  String get eventDefconLine2Level3 => 'A player has launched a unit attack';

  @override
  String get eventDefconLine2Level4 => 'A player has created a military unit';

  @override
  String eventDefconLine3(int param1) =>
      'Economy production boost increased to +${param1.toString()}%';

  @override
  String eventPlayerDefeatedLine1(String param1) =>
      'Player defeated: ${param1.toString()}';

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
  String get labelNone => 'None';

  @override
  String labelPeople(String param1) => '${param1.toString()} People';

  @override
  String labelQueue(int param1, int param2) =>
      'Queue ${param1.toString()}/${param2.toString()}';

  @override
  String labelRequires(String param1) => 'Requires ${param1.toString()}';

  @override
  String get labelSecond => 's';

  @override
  String get labelWinner => 'Winner';

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
  String get typeBuildingPowerPlantDescription1 =>
      'Produces energy, which is used to create units, missiles and upgrade buildings.';

  @override
  String get typeBuildingPowerPlantDescription2 =>
      'Each level of this building increases its production output.';

  @override
  String get typeBuildingPowerPlantName => 'Power Plant';

  @override
  String get typeBuildingPropagandaStationDescription1 =>
      'Produces population. A player is eliminated when it loses all the population.';

  @override
  String get typeBuildingPropagandaStationDescription2 =>
      'Each level of this building increases its production output.';

  @override
  String get typeBuildingPropagandaStationName => 'Propaganda Station';

  @override
  String get typeBuildingSupplyCenterDescription1 =>
      'Produces supplies, which is used to create units, missiles and upgrade buildings.';

  @override
  String get typeBuildingSupplyCenterDescription2 =>
      'Each level of this building increases its production output.';

  @override
  String get typeBuildingSupplyCenterName => 'Supply Center';

  @override
  String get typeBuildingTechLabDescription1 =>
      'Produces technology, which is used to upgrade researches.';

  @override
  String get typeBuildingTechLabDescription2 =>
      'Each level of this building increases its production output.';

  @override
  String get typeBuildingTechLabName => 'Tech Lab';

  @override
  String get typeCountryChina => 'China';

  @override
  String get typeCountryFrance => 'France';

  @override
  String get typeCountryIndia => 'India';

  @override
  String get typeCountryIsrael => 'Israel';

  @override
  String get typeCountryNorthKorea => 'North Korea';

  @override
  String get typeCountryPakistan => 'Pakistan';

  @override
  String get typeCountryRussia => 'Russia';

  @override
  String get typeCountryUk => 'United Kingdom';

  @override
  String get typeCountryUsa => 'USA';

  @override
  String get typeResearchActiveTrackingDescription =>
      'Increases defense missiles effectiveness';

  @override
  String get typeResearchActiveTrackingName => 'Active Tracking';

  @override
  String get typeResearchAdditiveManufacturingDescription =>
      'Decreases missile cost production';

  @override
  String get typeResearchAdditiveManufacturingName => 'Additive Manufacturing';

  @override
  String get typeResearchAssemblyAutomationDescription =>
      'Decreases missile time production';

  @override
  String get typeResearchAssemblyAutomationName => 'Assembly Automation';

  @override
  String get typeResearchGridManagementDescription =>
      'Increases energy production';

  @override
  String get typeResearchGridManagementName => 'Grid Management';

  @override
  String get typeResearchIndoctrinationDescription =>
      'Increases population production';

  @override
  String get typeResearchIndoctrinationName => 'Indoctrination';

  @override
  String get typeResearchProductionChainDescription =>
      'Increases supplies production';

  @override
  String get typeResearchProductionChainName => 'Production Chain';

  @override
  String get typeResearchQuantumComputingDescription =>
      'Increases technology production';

  @override
  String get typeResearchQuantumComputingName => 'Quantum computing';

  @override
  String get typeResearchSignalJammingDescription =>
      "Decreases the effectiveness of enemy's defense missiles";

  @override
  String get typeResearchSignalJammingName => 'Signal Jamming';

  @override
  String get typeResourceEnergy => 'Energy';

  @override
  String get typeResourcePopulation => 'Population';

  @override
  String get typeResourceSupplies => 'Supplies';

  @override
  String get typeResourceTechnology => 'Technology';

  @override
  String typeUnitAircraftDescription(int param1) =>
      'Advance jet fighters. It increases the military power by ${param1.toString()}.';

  @override
  String get typeUnitAircraftName => 'Aircraft';

  @override
  String get typeUnitAttackMissileDescription1 =>
      'Missiles used to send nuclear attacks to enemies.';

  @override
  String get typeUnitAttackMissileDescription2 =>
      "If an attack missiles is not intercepted, it kills an amount of the enemy's population proportionally to the missile yield.";

  @override
  String get typeUnitAttackMissileName => 'Attack Missile';

  @override
  String get typeUnitDefenseMissileDescription1 =>
      'Missiles used to intercept incoming missiles attacks.';

  @override
  String get typeUnitDefenseMissileDescription2 =>
      'Each defense missile has a base effectiveness of 50% that can be improved researching new technologies.';

  @override
  String get typeUnitDefenseMissileName => 'Defense Missile';

  @override
  String typeUnitInfantryDescription(int param1) =>
      'Basic military soldier squad. It increases the military power by ${param1.toString()}.';

  @override
  String get typeUnitInfantryName => 'Infantry';

  @override
  String typeUnitVehiclesDescription(int param1) =>
      'Land military vehicles. It increases the military power by ${param1.toString()}.';

  @override
  String get typeUnitVehiclesName => 'Vehicle';
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
