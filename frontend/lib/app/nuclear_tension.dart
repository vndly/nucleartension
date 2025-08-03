import 'package:flutter/material.dart';
import 'package:nucleartension/app/constants.dart';
import 'package:nucleartension/presentation/screens/splash_screen.dart';
import 'package:nucleartension/utils/navigation.dart';
import 'package:nucleartension/utils/palette.dart';

class NuclearTension extends StatelessWidget {
  const NuclearTension();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nuclear Tension',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        primaryColor: Palette.primary,
        primarySwatch: Palette.primary,
        scaffoldBackgroundColor: Palette.backgroundScreen,
        fontFamily: Constants.FONT_NAME,
      ),
      navigatorKey: Navigation.getRoutes.key,
      navigatorObservers: [Navigation.getRoutes.routeObserver],
      home: SplashScreen.instance(),
    );
  }
}
