import 'package:flutter/foundation.dart';
import 'package:nucleartension/utils/locator.dart';
import 'package:nucleartension/utils/platform.dart';

abstract class Environment {
  String get name;

  bool get isDebug => kDebugMode;

  bool get isRelease => kReleaseMode;

  bool get showLogs => isDebug;

  bool get isLocal => name == 'local';

  bool get isRemote => name == 'remote';

  bool hasCrashReports = Platform.isMobileNative;

  String get host => Platform.isWeb ? 'localhost' : '10.0.2.2';

  Future configure() async {}

  static Environment get get => locator<Environment>();
}
