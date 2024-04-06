import 'dart:ui';
import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/types/building_type.dart';
import 'package:nucleartension/types/research_type.dart';
import 'package:nucleartension/types/unit_type.dart';
import 'package:nucleartension/utils/navigation.dart';
import 'package:nucleartension/utils/palette.dart';
import 'package:nucleartension/widgets/images/image_asset.dart';
import 'package:nucleartension/widgets/labels/label.dart';

class InformationDialog extends StatelessWidget {
  final String title;
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
    required String title,
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
        title: title.toUpperCase(),
        content: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 3),
              child: ImageAsset(
                path: sprite,
                size: 50,
              ),
            ),
            const HBox(12),
            Expanded(
              child: Label(
                text: description,
                color: Palette.textLight,
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
        description: researchType.description,
        sprite: researchType.sprite,
      );

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
      child: AlertDialog(
        titlePadding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
        contentPadding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
        actionsPadding: const EdgeInsets.fromLTRB(5, 5, 5, 2),
        backgroundColor: Palette.backgroundDialog,
        title: Label(
          text: title,
          color: Palette.textLight,
          weight: FontWeight.bold,
        ),
        content: content,
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Palette.textLight,
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
