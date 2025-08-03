import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nucleartension/app/nuclear_tension.dart';
import 'package:nucleartension/environments/environment_local.dart';
import 'package:nucleartension/utils/error_handler.dart';
import 'package:nucleartension/utils/locator.dart';

void main() {
  runZonedGuarded(() async {
    await Locator.load(LocalEnvironment());
    runApp(const NuclearTension());
  }, ErrorHandler.onUncaughtError);
}
