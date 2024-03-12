import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nucleartension/app/nuclear_tension.dart';
import 'package:nucleartension/utils/error_handler.dart';
import 'package:nucleartension/utils/locator.dart';

Future main() async {
  runZonedGuarded(() async {
    await Locator.load();
    runApp(const NuclearTension());
  }, ErrorHandler.onError);
}
