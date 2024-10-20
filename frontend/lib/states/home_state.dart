import 'package:dafluta/dafluta.dart';
import 'package:nucleartension/utils/navigation.dart';

class HomeState extends BaseState {
  @override
  void onLoad() => Delayed.post(() {
        Navigation.matchScreen(Navigation.context);
      });

  void onContinue() => Navigation.matchScreen(Navigation.context);

  void onSettings() {}

  void onInfo() {}
}
