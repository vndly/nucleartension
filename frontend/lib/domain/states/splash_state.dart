import 'package:dafluta/dafluta.dart';
import 'package:nucleartension/utils/navigation.dart';

class SplashState extends BaseState {
  @override
  void onLoad() => Delayed.post(Navigation.homeScreen);
}
