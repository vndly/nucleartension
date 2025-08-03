import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:nucleartension/environments/environment.dart';
import 'package:nucleartension/utils/navigation.dart';
import 'package:nucleartension/utils/platform.dart';

final GetIt locator = GetIt.instance;

class Locator {
  static Future load(Environment environment) async {
    WidgetsFlutterBinding.ensureInitialized();

    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    if (Platform.isWeb) {
      await Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: 'AIzaSyAr2WTK2z3FRzu_oKnA2_58v8Ygl0rP4a4',
          authDomain: 'nucleartension.firebaseapp.com',
          databaseURL:
              'https://nucleartension-default-rtdb.europe-west1.firebasedatabase.app',
          projectId: 'nucleartension',
          storageBucket: 'nucleartension.firebasestorage.app',
          messagingSenderId: '764831568218',
          appId: '1:764831568218:web:09555397ad2df1c32d6363',
          measurementId: 'G-0ZXEYMZPHP',
        ),
      );
    } else {
      await Firebase.initializeApp();

      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
      FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
      PlatformDispatcher.instance.onError = (error, stack) {
        FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
        return true;
      };
    }

    locator.registerSingleton<Environment>(environment);
    locator.registerSingleton<Navigation>(Navigation());

    await environment.configure();
  }
}
