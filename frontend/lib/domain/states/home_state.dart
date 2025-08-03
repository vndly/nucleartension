import 'package:dafluta/dafluta.dart';
import 'package:nucleartension/utils/navigation.dart';

class HomeState extends BaseState {
  @override
  void onLoad() => Delayed.post(Navigation.matchScreen);

  void onContinue() => Navigation.matchScreen();

  void onSettings() {}

  void onInfo() {}
}
