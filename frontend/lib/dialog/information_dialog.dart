import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/dialog/base_dialog.dart';
import 'package:nucleartension/models/game.dart';
import 'package:nucleartension/models/players/active_player.dart';
import 'package:nucleartension/models/players/player.dart';
import 'package:nucleartension/types/building_type.dart';
import 'package:nucleartension/types/military_type.dart';
import 'package:nucleartension/types/research_type.dart';
import 'package:nucleartension/types/resource_type.dart';
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

  static DialogController playerWon({
    required String time,
    required VoidCallback onAccept,
  }) =>
      _messageInfo(
        title: Localized.get.dialogInformationPlayerWonTitle,
        message: Localized.get.dialogInformationPlayerWonMessage(time),
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
          ],
        ),
        buttonAccept: Localized.get.buttonOk,
      );

  static DialogController building(BuildingType buildingType) => _entityInfo(
        title: buildingType.localized,
        sprite: buildingType.sprite,
      );

  static DialogController military(MilitaryType militaryType) => _entityInfo(
        title: militaryType.localized,
        sprite: militaryType.sprite,
      );

  static DialogController research(ResearchType researchType) => _entityInfo(
        title: researchType.localized,
        sprite: researchType.sprite,
      );

  static DialogController player({
    required MyGame game,
    required Player player,
  }) {
    final bool hasIntelPopulation =
        game.self.getResearch(ResearchType.intel_population).level >= 2;
    final bool hasIntelMissiles =
        game.self.getResearch(ResearchType.intel_missiles).level >= 2;

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
            text: hasIntelPopulation
                ? Formatter.resourceRaw(player.population)
                : Localized.get.dialogInformationPlayerIntelRequiredPopulation,
            labelSize: 14,
            textSize: 12,
            labelColor: Palette.textPrimary,
            textColor:
                hasIntelPopulation ? Palette.textPrimary : Palette.textError,
            textUppercase: false,
          ),
          const VBox(10),
          LabeledText(
            label: Localized.get.dialogInformationPlayerMissiles,
            text: hasIntelMissiles
                ? Formatter.resourceRaw(player.amountOfMissiles)
                : Localized.get.dialogInformationPlayerIntelRequiredMissiles,
            labelSize: 14,
            textSize: 12,
            labelColor: Palette.textPrimary,
            textColor:
                hasIntelMissiles ? Palette.textPrimary : Palette.textError,
            textUppercase: false,
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
            const VBox(10),
            ..._debugPlayer('Defense missiles:',
                player.military.get(MilitaryType.missile_defense).toInt()),
            ..._debugPlayer('Attack missiles:',
                player.military.get(MilitaryType.missile_attack).toInt()),
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
          labelSize: 12,
          textSize: 12,
          labelColor: Palette.textPrimary,
          textColor: Palette.textPrimary,
          labelUppercase: false,
          textUppercase: false,
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
