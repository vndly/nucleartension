//import 'package:firebase_crashlytics/firebase_crashlytics.dart';
//import 'package:nucleartension/utils/log.dart';

class ErrorHandler {
  static Future process(Object exception) async {
    _logError(exception.toString(), exception, null);

    _logAnalytics(exception);

    /*    await FirebaseCrashlytics.instance.recordError(
        exception,
        null,
        reason: exception.toString(),
        fatal: false,
      );*/
  }

  static Future onUncaughtError(Object exception, StackTrace stackTrace) async {
    _logError('Uncaught Error', exception, stackTrace);

    _logAnalytics(exception);

    /*  await FirebaseCrashlytics.instance.recordError(
        exception,
        stackTrace,
        fatal: true,
      );*/
  }

  static void _logError(
    dynamic message,
    dynamic error,
    StackTrace? stackTrace,
  ) {
    try {
      //Log.error(message, error, stackTrace);
    } catch (e) {
      print(error.toString());
      print('Cannot log error in console');
    }
  }

  static void _logAnalytics(Object exception) {
    // TODO(momo): implement
    /*try {
      Analytics.error(type, exception);
    } catch (e) {
      debugPrint(exception.toString());
      debugPrint('Cannot log error in Firebase Analytics');
    }*/
  }
}
