import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:nucleartension/utils/navigation.dart';
import 'package:nucleartension/utils/palette.dart';
import 'package:nucleartension/widgets/labels/label.dart';

class CustomSnackbar {
  const CustomSnackbar._();

  static const Duration DURATION_SHORT = Duration(seconds: 1);

  static const Duration DURATION_MEDIUM = Duration(seconds: 3);

  static const Duration DURATION_LONG = Duration(seconds: 5);

  static void defcon(int value) {
    final SnackBar snackBar = SnackBar(
      padding: const EdgeInsets.all(0),
      content: SizedBox(
        height: 50,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.warning,
              color: Palette.error,
              size: 20,
            ),
            const HBox(10),
            Label(
              text: 'DEFCON $value',
              color: Palette.textLight,
            ),
          ],
        ),
      ),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(Navigation.context).size.height - 50,
      ),
      backgroundColor: Palette.backgroundSnackbar,
      duration: DURATION_MEDIUM,
    );

    Delayed.post(() {
      try {
        ScaffoldMessenger.of(Navigation.context).showSnackBar(snackBar);
      } catch (e) {
        // ignore
      }
    });
  }
}
