import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/dialog/base_dialog.dart';
import 'package:nucleartension/models/game.dart';
import 'package:nucleartension/models/players/active_player.dart';
import 'package:nucleartension/models/players/player.dart';
import 'package:nucleartension/models/research.dart';
import 'package:nucleartension/types/building_type.dart';
import 'package:nucleartension/types/military_type.dart';
import 'package:nucleartension/types/research_type.dart';
import 'package:nucleartension/types/resource_type.dart';
import 'package:nucleartension/types/unit_type.dart';
import 'package:nucleartension/utils/environment.dart';
import 'package:nucleartension/utils/formatter.dart';
import 'package:nucleartension/utils/localizations.dart';
import 'package:nucleartension/utils/palette.dart';
import 'package:nucleartension/widgets/images/image_asset.dart';
import 'package:nucleartension/widgets/labels/label.dart';
import 'package:nucleartension/widgets/labels/labeled_text.dart';

class InformationDialog extends StatelessWidget {
  final Widget title;
  final Widget content;
  final String buttonAccept;
  final VoidCallback? onAccept;

  const InformationDialog._({
    required this.title,
    required this.content,
    required this.buttonAccept,
    required this.onAccept,
  });

  static DialogController _show({
    required Widget title,
    required Widget content,
    required String buttonAccept,
    VoidCallback? onAccept,
  }) =>
      BaseDialog.show(InformationDialog._(
        title: title,
        content: content,
        buttonAccept: buttonAccept,
        onAccept: onAccept,
      ));

  static DialogController _messageInfo({
    required String title,
    required String message,
    required VoidCallback onAccept,
  }) =>
      _show(
        title: Label(
          text: title,
          color: Palette.textPrimary,
          weight: FontWeight.bold,
        ),
        content: Label(
          text: message,
          color: Palette.textPrimary,
          uppercase: false,
        ),
        buttonAccept: Localized.get.buttonOk,
        onAccept: onAccept,
      );

  static DialogController playerWon(VoidCallback onAccept) => _messageInfo(
        title: Localized.get.dialogInformationPlayerWonTitle,
        message: Localized.get.dialogInformationPlayerWonMessage,
        onAccept: onAccept,
      );

  static DialogController playerLost({
    required Player killer,
    required VoidCallback onAccept,
  }) =>
      _messageInfo(
        title: Localized.get.dialogInformationPlayerLostTitle,
        message: Localized.get.dialogInformationPlayerLostMessage(killer.name),
        onAccept: onAccept,
      );

  static DialogController _entityInfo({
    required String title,
    required List<String> descriptions,
    required String sprite,
  }) =>
      _show(
        title: Label(
          text: title,
          color: Palette.textPrimary,
          weight: FontWeight.bold,
        ),
        content: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 3),
              child: ImageAsset(
                path: sprite,
                size: 70,
              ),
            ),
            const HBox(12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (final String description in descriptions)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Label(
                        text: description,
                        color: Palette.textPrimary,
                        uppercase: false,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
        buttonAccept: Localized.get.buttonOk,
      );

  static DialogController building(BuildingType buildingType) => _entityInfo(
        title: buildingType.localized,
        descriptions: buildingType.description,
        sprite: buildingType.sprite,
      );

  static DialogController unit(UnitType unitType) => _entityInfo(
        title: unitType.localized,
        descriptions: unitType.description,
        sprite: unitType.sprite,
      );

  static DialogController research(ResearchType researchType) => _entityInfo(
        title: researchType.localized,
        descriptions: researchType.details,
        sprite: researchType.sprite,
      );

  static DialogController player({
    required Game game,
    required Player player,
  }) {
    final Research intelPopulation =
        game.self.getResearch(ResearchType.intel_population);
    final Research intelMilitary =
        game.self.getResearch(ResearchType.intel_military);
    final Research intelMissiles =
        game.self.getResearch(ResearchType.intel_missiles);
    final Research intelResearch =
        game.self.getResearch(ResearchType.intel_research);

    return _show(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ImageAsset(
            path: player.country.flag,
            width: 21,
            height: 14,
          ),
          const HBox(15),
          Label(
            text: player.name,
            color: player.country.color,
            weight: FontWeight.bold,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LabeledText(
            label: Localized.get.dialogInformationPlayerPopulation,
            text: (intelPopulation.level >= 2)
                ? Formatter.resourceRaw(player.population)
                : Localized.get.dialogInformationPlayerUnknown,
            size: 14,
            labelColor: Palette.textPrimary,
            textColor: Palette.textPrimary,
          ),
          const VBox(10),
          LabeledText(
            label: Localized.get.dialogInformationPlayerMilitary,
            text: (intelMilitary.level >= 2)
                ? Formatter.resourceRaw(player.militaryPower)
                : Localized.get.dialogInformationPlayerUnknown,
            size: 14,
            labelColor: Palette.textPrimary,
            textColor: Palette.textPrimary,
          ),
          const VBox(10),
          LabeledText(
            label: Localized.get.dialogInformationPlayerMissiles,
            text: (intelMissiles.level >= 2)
                ? Formatter.resourceRaw(player.amountOfMissiles)
                : Localized.get.dialogInformationPlayerUnknown,
            size: 14,
            labelColor: Palette.textPrimary,
            textColor: Palette.textPrimary,
          ),
          const VBox(10),
          LabeledText(
            label: Localized.get.dialogInformationPlayerResearch,
            text: (intelResearch.level >= 2)
                ? Formatter.resourceRaw(player.researchLevel)
                : Localized.get.dialogInformationPlayerUnknown,
            size: 14,
            labelColor: Palette.textPrimary,
            textColor: Palette.textPrimary,
          ),
          if (Environment.isDebug) ...[
            const VBox(10),
            if (player is ActivePlayer) ...[
              ..._debugPlayer('Next creation:', player.nextCreateAction?.name),
              ..._debugPlayer(
                  'Next research:', player.nextResearchAction?.name),
              ..._debugPlayer('Next attack:', player.nextAttackAction?.name),
            ],
            const VBox(10),
            ..._debugPlayer(
                'Energy:', player.resources.get(ResourceType.energy).toInt()),
            ..._debugPlayer('Supplies:',
                player.resources.get(ResourceType.supplies).toInt()),
            ..._debugPlayer('Technology:',
                player.resources.get(ResourceType.technology).toInt()),
            const VBox(10),
            ..._debugPlayer('Defense missiles:',
                player.military.get(MilitaryType.defense_missiles).toInt()),
            ..._debugPlayer('Attack missiles:',
                player.military.get(MilitaryType.attack_missiles).toInt()),
            ..._debugPlayer('Nuclear bomb tech:',
                player.getResearch(ResearchType.missiles_nuclear_bomb).level),
          ],
        ],
      ),
      buttonAccept: Localized.get.buttonOk,
    );
  }

  static List<Widget> _debugPlayer(String label, Object? text) => [
        const VBox(10),
        LabeledText(
          label: label,
          text: text.toString(),
          size: 12,
          labelColor: Palette.textPrimary,
          textColor: Palette.textPrimary,
          uppercase: false,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      title: title,
      content: content,
      actions: [
        TextButton(
          onPressed: () {
            BaseDialog.close();
            onAccept?.call();
          },
          child: Label(
            text: buttonAccept,
            color: Palette.textPrimary,
            weight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
