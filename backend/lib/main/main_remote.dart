import 'dart:async';
import 'package:nucleartension/app/nuclear_tension.dart';
import 'package:nucleartension/environments/environment_remote.dart';
import 'package:nucleartension/utils/error_handler.dart';
import 'package:nucleartension/utils/locator.dart';

void main() {
  runZonedGuarded(() async {
    await Locator.load(RemoteEnvironment());
    NuclearTension().start();
  }, ErrorHandler.onUncaughtError);
}
