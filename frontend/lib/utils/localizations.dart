import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

abstract class BaseLocalized {
  String get applicationName;

  String attackMissileIncoming(String param1, int param2, String param3);

  String attackMissileOutgoing(String param1, int param2, String param3);

  String attackTroopIncoming(String param1, int param2);

  String attackTroopOutgoing(String param1, int param2);

  String get bottomBarEvents;

  String get bottomBarMilitary;

  String get bottomBarResearch;

  String get bottomBarResources;

  String get bottomBarWarRoom;

  String get buttonAttack;

  String get buttonCancel;

  String get buttonDismiss;

  String get buttonOk;

  String dialogAttackMissilesMessage(String param1);

  String dialogAttackMissilesSummary(String param1);

  String dialogAttackMissilesTitle(String param1);

  String dialogAttackTroopsMessage(String param1);

  String dialogAttackTroopsSummary(String param1);

  String dialogAttackTroopsTitle(String param1);

  String get dialogConfirmationCancelUpgradeMessage;

  String get dialogInformationPlayerIntelRequiredMissiles;

  String get dialogInformationPlayerIntelRequiredPopulation;

  String get dialogInformationPlayerIntelRequiredResearch;

  String get dialogInformationPlayerIntelRequiredTroops;

  String dialogInformationPlayerLostMessage(String param1);

  String get dialogInformationPlayerLostTitle;

  String get dialogInformationPlayerMissiles;

  String get dialogInformationPlayerPopulation;

  String get dialogInformationPlayerResearch;

  String get dialogInformationPlayerTroops;

  String dialogInformationPlayerWonMessage(String param1);

  String get dialogInformationPlayerWonTitle;

  String get dialogPauseResume;

  String get dialogPauseTitle;

  String get eventAttackMissileResultLine1;

  String eventAttackMissileResultLine2(String param1, String param2);

  String eventAttackMissileResultLine3(String param1, String param2);

  String eventAttackMissileResultLine4(int param1, String param2);

  String eventAttackMissileResultLine5(int param1, String param2);

  String eventAttackMissileResultLine6(String param1);

  String get eventAttackTroopResultLine1;

  String eventAttackTroopResultLine2(String param1, String param2);

  String eventAttackTroopResultLine3(String param1, String param2);

  String eventAttackTroopResultLine4(String param1);

  String eventAttackTroopResultLine5(String param1);

  String eventDefconLine1(int param1);

  String get eventDefconLine2Level1Other;

  String get eventDefconLine2Level1Self;

  String get eventDefconLine2Level2Other;

  String get eventDefconLine2Level2Self;

  String get eventDefconLine2Level3Other;

  String get eventDefconLine2Level3Self;

  String get eventDefconLine2Level4Other;

  String get eventDefconLine2Level4Self;

  String eventDefconLine3(int param1);

  String eventPlayerDefeatedLine1(String param1, String param2);

  String get eventPlayerDefeatedLine2;

  String eventPlayerDefeatedLine3(String param1);

  String eventPlayerDefeatedLine4(String param1);

  String eventPlayerDefeatedLine5(String param1);

  String get headerAttackMissiles;

  String get headerDefcon;

  String get headerDefenseMissiles;

  String get headerTroops;

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

  String labelRequiresBuilding(String param1);

  String labelRequiresResearch(String param1);

  String get labelSecond;

  String get labelWinner;

  String get screenEventsNoEvents;

  String get screenResearchIntel;

  String get screenResearchMissiles;

  String get screenResearchResources;

  String get screenResearchTroops;

  String get screenResearchWarning;

  String get screenWarRoomIntelMissiles;

  String get screenWarRoomIntelPopulation;

  String get screenWarRoomIntelResearch;

  String get screenWarRoomIntelTroops;

  String get screenWarRoomTabIntel;

  String get screenWarRoomTabPlayers;

  String snackDefcon(int param1);

  String get typeBuildingMilitaryFacilityDescription1;

  String get typeBuildingMilitaryFacilityDescription2;

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

  String get typeMilitaryAttackMissileDescription1;

  String get typeMilitaryAttackMissileDescription2;

  String get typeMilitaryAttackMissileName;

  String get typeMilitaryDefenseMissileDescription1;

  String get typeMilitaryDefenseMissileDescription2;

  String get typeMilitaryDefenseMissileName;

  String get typeMilitaryTroopDescription;

  String get typeMilitaryTroopName;

  String get typeResearchIntelLevel1;

  String get typeResearchIntelLevel2;

  String get typeResearchIntelMissilesDescription;

  String get typeResearchIntelMissilesName;

  String get typeResearchIntelPopulationDescription;

  String get typeResearchIntelPopulationName;

  String get typeResearchIntelResearchDescription;

  String get typeResearchIntelResearchName;

  String get typeResearchIntelTroopsDescription;

  String get typeResearchIntelTroopsName;

  String get typeResearchMissilesActiveTrackingDescription;

  String get typeResearchMissilesActiveTrackingName;

  String get typeResearchMissilesAdditiveManufacturingDescription;

  String get typeResearchMissilesAdditiveManufacturingName;

  String get typeResearchMissilesAssemblyAutomationDescription;

  String get typeResearchMissilesAssemblyAutomationName;

  String get typeResearchMissilesNuclearBombDescription;

  String get typeResearchMissilesNuclearBombDescriptionExtra;

  String get typeResearchMissilesNuclearBombName;

  String get typeResearchMissilesSignalJammingDescription;

  String get typeResearchMissilesSignalJammingName;

  String get typeResearchResourcesGridManagementDescription;

  String get typeResearchResourcesGridManagementName;

  String get typeResearchResourcesIndoctrinationDescription;

  String get typeResearchResourcesIndoctrinationName;

  String get typeResearchResourcesProductionChainDescription;

  String get typeResearchResourcesProductionChainName;

  String get typeResearchResourcesQuantumComputingDescription;

  String get typeResearchResourcesQuantumComputingName;

  String get typeResearchTroopsCostDescription;

  String get typeResearchTroopsCostName;

  String get typeResearchTroopsTimeDescription;

  String get typeResearchTroopsTimeName;

  String get typeResearchWarningEarlyWarningDescription;

  String get typeResearchWarningEarlyWarningName;

  String get typeResearchWarningFastDeploymentsDescription;

  String get typeResearchWarningFastDeploymentsName;

  String get typeResearchWarningHypersonicPropulsionDescription;

  String get typeResearchWarningHypersonicPropulsionName;

  String get typeResearchWarningRadarNetworkDescription;

  String get typeResearchWarningRadarNetworkName;

  String get typeResourceEnergy;

  String get typeResourcePopulation;

  String get typeResourceSupplies;

  String get typeResourceTechnology;
}

class ENLocalized extends BaseLocalized {
  @override
  String get applicationName => 'Nuclear Tension';

  @override
  String attackMissileIncoming(String param1, int param2, String param3) =>
      'Incoming attack from ${param1.toString()} with ${param2.toString()} missiles (${param3.toString()})';

  @override
  String attackMissileOutgoing(String param1, int param2, String param3) =>
      'Outgoing attack to ${param1.toString()} with ${param2.toString()} missiles (${param3.toString()})';

  @override
  String attackTroopIncoming(String param1, int param2) =>
      'Incoming attack from ${param1.toString()} with ${param2.toString()} troops';

  @override
  String attackTroopOutgoing(String param1, int param2) =>
      'Outgoing attack to ${param1.toString()} with ${param2.toString()} troops';

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
  String get buttonDismiss => 'Dismiss';

  @override
  String get buttonOk => 'Ok';

  @override
  String dialogAttackMissilesMessage(String param1) =>
      'Missiles: ${param1.toString()}';

  @override
  String dialogAttackMissilesSummary(String param1) =>
      '≈ ${param1.toString()} casualties';

  @override
  String dialogAttackMissilesTitle(String param1) =>
      'Launch missile attack to ${param1.toString()}';

  @override
  String dialogAttackTroopsMessage(String param1) =>
      'Troops: ${param1.toString()}';

  @override
  String dialogAttackTroopsSummary(String param1) =>
      '≈ ${param1.toString()} casualties';

  @override
  String dialogAttackTroopsTitle(String param1) =>
      'Launch troop attack to ${param1.toString()}';

  @override
  String get dialogConfirmationCancelUpgradeMessage => 'Cancel upgrade?';

  @override
  String get dialogInformationPlayerIntelRequiredMissiles =>
      'Intel reseach required';

  @override
  String get dialogInformationPlayerIntelRequiredPopulation =>
      'Intel reseach required';

  @override
  String get dialogInformationPlayerIntelRequiredResearch =>
      'Intel reseach required';

  @override
  String get dialogInformationPlayerIntelRequiredTroops =>
      'Intel reseach required';

  @override
  String dialogInformationPlayerLostMessage(String param1) =>
      'You have been destroyed by ${param1.toString()}.';

  @override
  String get dialogInformationPlayerLostTitle => 'You lost the match';

  @override
  String get dialogInformationPlayerMissiles => 'Missiles:';

  @override
  String get dialogInformationPlayerPopulation => 'Population:';

  @override
  String get dialogInformationPlayerResearch => 'Research:';

  @override
  String get dialogInformationPlayerTroops => 'Troops:';

  @override
  String dialogInformationPlayerWonMessage(String param1) =>
      'You successfully destroyed all your enemies in ${param1.toString()}.';

  @override
  String get dialogInformationPlayerWonTitle => 'You won the match';

  @override
  String get dialogPauseResume => 'Resume';

  @override
  String get dialogPauseTitle => 'Pause';

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
      'Casualties: ${param1.toString()}';

  @override
  String get eventAttackTroopResultLine1 => 'Troop attack finished';

  @override
  String eventAttackTroopResultLine2(String param1, String param2) =>
      'Attacker: ${param1.toString()}${param2.toString()}';

  @override
  String eventAttackTroopResultLine3(String param1, String param2) =>
      'Defender: ${param1.toString()}${param2.toString()}';

  @override
  String eventAttackTroopResultLine4(String param1) =>
      'Troops: ${param1.toString()}';

  @override
  String eventAttackTroopResultLine5(String param1) =>
      'Casualties: ${param1.toString()}';

  @override
  String eventDefconLine1(int param1) => 'DEFCON ${param1.toString()}';

  @override
  String get eventDefconLine2Level1Other =>
      'A player has launched a missile attack.';

  @override
  String get eventDefconLine2Level1Self =>
      'You have launched a missile attack.';

  @override
  String get eventDefconLine2Level2Other =>
      'A player has created an attack missile.';

  @override
  String get eventDefconLine2Level2Self =>
      'You have created an attack missile.';

  @override
  String get eventDefconLine2Level3Other =>
      'A player has launched a troop attack.';

  @override
  String get eventDefconLine2Level3Self => 'You have launched a troop attack.';

  @override
  String get eventDefconLine2Level4Other => 'A player has created a troop.';

  @override
  String get eventDefconLine2Level4Self => 'You have created a troop.';

  @override
  String eventDefconLine3(int param1) =>
      'Resource production rate increased to: +${param1.toString()}%';

  @override
  String eventPlayerDefeatedLine1(String param1, String param2) =>
      '${param1.toString()} has been defeated by ${param2.toString()}';

  @override
  String get eventPlayerDefeatedLine2 => 'Resources looted:';

  @override
  String eventPlayerDefeatedLine3(String param1) =>
      'Energy: ${param1.toString()}';

  @override
  String eventPlayerDefeatedLine4(String param1) =>
      'Supplies: ${param1.toString()}';

  @override
  String eventPlayerDefeatedLine5(String param1) =>
      'Technology: ${param1.toString()}';

  @override
  String get headerAttackMissiles => 'Attack Missiles:';

  @override
  String get headerDefcon => 'DEFCON:';

  @override
  String get headerDefenseMissiles => 'Defense Missiles:';

  @override
  String get headerTroops => 'Troops:';

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
  String labelRequiresBuilding(String param1) =>
      'Requires ${param1.toString()} building';

  @override
  String labelRequiresResearch(String param1) =>
      'Requires ${param1.toString()} research';

  @override
  String get labelSecond => 's';

  @override
  String get labelWinner => 'Winner';

  @override
  String get screenEventsNoEvents => 'No events';

  @override
  String get screenResearchIntel => 'Intel';

  @override
  String get screenResearchMissiles => 'Missiles';

  @override
  String get screenResearchResources => 'Resources';

  @override
  String get screenResearchTroops => 'Troops';

  @override
  String get screenResearchWarning => 'Warning';

  @override
  String get screenWarRoomIntelMissiles => 'Missiles';

  @override
  String get screenWarRoomIntelPopulation => 'Population';

  @override
  String get screenWarRoomIntelResearch => 'Research';

  @override
  String get screenWarRoomIntelTroops => 'Troops';

  @override
  String get screenWarRoomTabIntel => 'Intel';

  @override
  String get screenWarRoomTabPlayers => 'Players';

  @override
  String snackDefcon(int param1) => 'DEFCON ${param1.toString()}';

  @override
  String get typeBuildingMilitaryFacilityDescription1 =>
      'Creates troops used to defend your territory and attack other players.';

  @override
  String get typeBuildingMilitaryFacilityDescription2 =>
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
      'Produces energy, which is used to create troops, missiles and upgrade buildings.';

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
      'Produces supplies, which is used to create troops, missiles and upgrade buildings.';

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
  String get typeMilitaryAttackMissileDescription1 =>
      'Missiles used to send nuclear attacks to enemies.';

  @override
  String get typeMilitaryAttackMissileDescription2 =>
      "If an attack missiles is not intercepted, it kills an amount of the enemy's population proportionally to the missile yield.";

  @override
  String get typeMilitaryAttackMissileName => 'Attack Missile';

  @override
  String get typeMilitaryDefenseMissileDescription1 =>
      'Missiles used to intercept incoming missile attacks.';

  @override
  String get typeMilitaryDefenseMissileDescription2 =>
      'Each defense missile has a base effectiveness of 50% that can be improved researching new technologies.';

  @override
  String get typeMilitaryDefenseMissileName => 'Defense Missile';

  @override
  String get typeMilitaryTroopDescription =>
      "Used to defend your territory from other players' troop attacks and attack other players to decrease their population.";

  @override
  String get typeMilitaryTroopName => 'Troop';

  @override
  String get typeResearchIntelLevel1 => "Global players' ranking";

  @override
  String get typeResearchIntelLevel2 => "Players's values";

  @override
  String get typeResearchIntelMissilesDescription =>
      'Reveals missile intel about other players';

  @override
  String get typeResearchIntelMissilesName => 'Missiles';

  @override
  String get typeResearchIntelPopulationDescription =>
      'Reveals population intel about other players';

  @override
  String get typeResearchIntelPopulationName => 'Population';

  @override
  String get typeResearchIntelResearchDescription =>
      'Reveals research intel about other players';

  @override
  String get typeResearchIntelResearchName => 'Research';

  @override
  String get typeResearchIntelTroopsDescription =>
      'Reveals troop intel about other players';

  @override
  String get typeResearchIntelTroopsName => 'Troops';

  @override
  String get typeResearchMissilesActiveTrackingDescription =>
      'Increases defense missiles effectiveness';

  @override
  String get typeResearchMissilesActiveTrackingName => 'Active Tracking';

  @override
  String get typeResearchMissilesAdditiveManufacturingDescription =>
      'Decreases missile cost production';

  @override
  String get typeResearchMissilesAdditiveManufacturingName =>
      'Additive Manufacturing';

  @override
  String get typeResearchMissilesAssemblyAutomationDescription =>
      'Decreases missile time production';

  @override
  String get typeResearchMissilesAssemblyAutomationName =>
      'Assembly Automation';

  @override
  String get typeResearchMissilesNuclearBombDescription =>
      'Increases nuclear bomb yield';

  @override
  String get typeResearchMissilesNuclearBombDescriptionExtra =>
      'The bigger the yield, the more casualties the missile causes.';

  @override
  String get typeResearchMissilesNuclearBombName => 'Nuclear Bomb';

  @override
  String get typeResearchMissilesSignalJammingDescription =>
      "Decreases the effectiveness of enemy's defense missiles";

  @override
  String get typeResearchMissilesSignalJammingName => 'Signal Jamming';

  @override
  String get typeResearchResourcesGridManagementDescription =>
      'Increases energy production';

  @override
  String get typeResearchResourcesGridManagementName => 'Grid Management';

  @override
  String get typeResearchResourcesIndoctrinationDescription =>
      'Increases population production';

  @override
  String get typeResearchResourcesIndoctrinationName => 'Indoctrination';

  @override
  String get typeResearchResourcesProductionChainDescription =>
      'Increases supplies production';

  @override
  String get typeResearchResourcesProductionChainName => 'Production Chain';

  @override
  String get typeResearchResourcesQuantumComputingDescription =>
      'Increases technology production';

  @override
  String get typeResearchResourcesQuantumComputingName => 'Quantum computing';

  @override
  String get typeResearchTroopsCostDescription =>
      'Decreases troop cost production';

  @override
  String get typeResearchTroopsCostName => 'Troop cost';

  @override
  String get typeResearchTroopsTimeDescription =>
      'Decreases troop time production';

  @override
  String get typeResearchTroopsTimeName => 'Troop time';

  @override
  String get typeResearchWarningEarlyWarningDescription =>
      'Increases warning time when receiving a troop attack';

  @override
  String get typeResearchWarningEarlyWarningName => 'Early Warning';

  @override
  String get typeResearchWarningFastDeploymentsDescription =>
      'Increases troop speed';

  @override
  String get typeResearchWarningFastDeploymentsName => 'Fast Deployments';

  @override
  String get typeResearchWarningHypersonicPropulsionDescription =>
      'Increases attack missiles speed';

  @override
  String get typeResearchWarningHypersonicPropulsionName =>
      'Hypersonic Propulsion';

  @override
  String get typeResearchWarningRadarNetworkDescription =>
      'Increases warning time when receiving a missile attack';

  @override
  String get typeResearchWarningRadarNetworkName => 'Radar Network';

  @override
  String get typeResourceEnergy => 'Energy';

  @override
  String get typeResourcePopulation => 'Population';

  @override
  String get typeResourceSupplies => 'Supplies';

  @override
  String get typeResourceTechnology => 'Technology';
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
