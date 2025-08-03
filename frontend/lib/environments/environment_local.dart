import 'package:nucleartension/environments/environment.dart';
import 'package:nucleartension/platform/platform_none.dart'
    if (dart.library.html) 'package:nucleartension/platform/platform_web.dart';

class LocalEnvironment extends Environment {
  @override
  String get name => 'local';

  @override
  Future configure() async {
    final PlatformMethods platformMethods = PlatformMethods();
    platformMethods.disableContextualMenu();
    platformMethods.updateUrlStrategy();
  }
}
