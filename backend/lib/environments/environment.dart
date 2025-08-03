import 'package:nucleartension/utils/locator.dart';

abstract class Environment {
  String get name;

  bool get isLocal => name == 'local';

  bool get isRemote => name == 'remote';

  Future configure() async {}

  static Environment get get => locator<Environment>();
}
