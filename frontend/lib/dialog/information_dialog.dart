import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/dialog/base_dialog.dart';
import 'package:nucleartension/models/game.dart';
import 'package:nucleartension/models/players/player.dart';
import 'package:nucleartension/models/research.dart';
import 'package:nucleartension/types/building_type.dart';
import 'package:nucleartension/types/research_type.dart';
import 'package:nucleartension/types/unit_type.dart';
import 'package:nucleartension/utils/formatter.dart';
import 'package:nucleartension/utils/navigation.dart';
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

  static DialogController _entityInfo({
    required String title,
    required List<String> descriptions,
    required String sprite,
  }) =>
      _show(
        title: Label(
          text: title.toUpperCase(),
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
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
        buttonAccept: 'OK',
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
        descriptions: [researchType.details],
        sprite: researchType.sprite,
      );

  static DialogController player({
    required Game game,
    required Player player,
  }) {
    final Research researchIntelPopulation =
        game.self.getResearch(ResearchType.intel_population);
    final Research researchIntelMilitary =
        game.self.getResearch(ResearchType.intel_military);
    final Research researchIntelTechnology =
        game.self.getResearch(ResearchType.intel_technology);

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
            label: 'Population:',
            text: (researchIntelPopulation.level > 0)
                ? Formatter.resourceRaw(player.population)
                : 'unknown',
            size: 14,
            labelColor: Palette.textPrimary,
            textColor: Palette.textPrimary,
          ),
          const VBox(10),
          LabeledText(
            label: 'Military:',
            text: (researchIntelMilitary.level > 0)
                ? Formatter.resourceRaw(player.militaryPower)
                : 'unknown',
            size: 14,
            labelColor: Palette.textPrimary,
            textColor: Palette.textPrimary,
          ),
          const VBox(10),
          LabeledText(
            label: 'Technology:',
            text: (researchIntelTechnology.level > 0)
                ? Formatter.resourceRaw(player.technologyLevel)
                : 'unknown',
            size: 14,
            labelColor: Palette.textPrimary,
            textColor: Palette.textPrimary,
          ),
        ],
      ),
      buttonAccept: 'OK',
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      title: title,
      content: content,
      actions: [
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Palette.textPrimary,
          ),
          onPressed: () {
            Navigation.pop();
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
