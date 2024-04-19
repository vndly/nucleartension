import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/utils/localizations.dart';
import 'package:nucleartension/utils/navigation.dart';
import 'package:nucleartension/utils/palette.dart';
import 'package:nucleartension/widgets/labels/label.dart';

class CustomSnackbar {
  const CustomSnackbar._();

  static const Duration DURATION_SHORT = Duration(seconds: 1);

  static const Duration DURATION_MEDIUM = Duration(seconds: 3);

  static const Duration DURATION_LONG = Duration(seconds: 5);

  static void _show({
    required Widget widget,
    required Duration duration,
  }) {
    final SnackBar snackBar = SnackBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      behavior: SnackBarBehavior.floating,
      dismissDirection: DismissDirection.none,
      padding: EdgeInsets.zero,
      duration: duration,
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(Navigation.context).size.height / 2,
      ),
      content: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: Palette.borderSeparator,
              width: 0.5,
            ),
            color: Palette.backgroundSnackbar,
          ),
          child: widget,
        ),
      ),
    );

    Delayed.post(() {
      try {
        ScaffoldMessenger.of(Navigation.context).showSnackBar(snackBar);
      } catch (e) {
        // ignore
      }
    });
  }

  static void defcon(int value) => _show(
        widget: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.warning,
              color: Palette.error,
              size: 30,
            ),
            const HBox(10),
            Label(
              text: Localized.get.snackDefcon(value),
              color: Palette.error,
              size: 20,
              weight: FontWeight.bold,
            ),
          ],
        ),
        duration: DURATION_MEDIUM,
      );
}
