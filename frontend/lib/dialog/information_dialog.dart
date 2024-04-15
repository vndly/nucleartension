import 'dart:ui';
import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/models/game.dart';
import 'package:nucleartension/models/players/player.dart';
import 'package:nucleartension/models/research.dart';
import 'package:nucleartension/types/building_type.dart';
import 'package:nucleartension/types/research_type.dart';
import 'package:nucleartension/types/unit_type.dart';
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
  }) {
    final BuildContext context = Navigation.context;

    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Palette.transparent,
      builder: (context) => InformationDialog._(
        title: title,
        content: content,
        buttonAccept: buttonAccept,
        onAccept: onAccept,
      ),
    );

    return DialogController(context);
  }

  static DialogController _entityInfo({
    required String title,
    required String description,
    required String sprite,
  }) =>
      _show(
        title: Label(
          text: title.toUpperCase(),
          color: Palette.textMain,
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
              child: Label(
                text: description,
                color: Palette.textMain,
              ),
            ),
          ],
        ),
        buttonAccept: 'OK',
      );

  static DialogController building(BuildingType buildingType) => _entityInfo(
        title: buildingType.localized,
        description: buildingType.description,
        sprite: buildingType.sprite,
      );

  static DialogController unit(UnitType unitType) => _entityInfo(
        title: unitType.localized,
        description: unitType.description,
        sprite: unitType.sprite,
      );

  static DialogController research(ResearchType researchType) => _entityInfo(
        title: researchType.localized,
        description: researchType.details,
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
                ? player.population.toString()
                : 'unknown',
            size: 14,
            labelColor: Palette.textMain,
            textColor: Palette.textMain,
          ),
          const VBox(10),
          LabeledText(
            label: 'Military:',
            text: (researchIntelMilitary.level > 0)
                ? player.militaryPower.toString()
                : 'unknown',
            size: 14,
            labelColor: Palette.textMain,
            textColor: Palette.textMain,
          ),
          const VBox(10),
          LabeledText(
            label: 'Technology:',
            text: (researchIntelTechnology.level > 0)
                ? player.technologyLevel.toString()
                : 'unknown',
            size: 14,
            labelColor: Palette.textMain,
            textColor: Palette.textMain,
          ),
        ],
      ),
      buttonAccept: 'OK',
    );
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
      child: AlertDialog(
        titlePadding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
        contentPadding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
        actionsPadding: const EdgeInsets.fromLTRB(5, 5, 5, 2),
        backgroundColor: Palette.backgroundDialog,
        title: title,
        content: content,
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Palette.textMain,
            ),
            onPressed: () {
              Navigation.pop();
              onAccept?.call();
            },
            child: Label(
              text: buttonAccept,
            ),
          ),
        ],
      ),
    );
  }
}
