import 'dart:html';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:nucleartension/platform/empty_url_strategy.dart';
import 'package:nucleartension/platform/platform_base.dart';

class PlatformMethods extends PlatformMethodsBase {
  @override
  void updateUrlStrategy() => setUrlStrategy(EmptyUrlStrategy());

  @override
  void disableContextualMenu() =>
      window.document.onContextMenu.listen((evt) => evt.preventDefault());
}
