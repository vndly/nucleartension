import 'package:nucleartension/utils/environment.dart';
import 'package:nucleartension/utils/log.dart';

class ErrorHandler {
  static Future process(Object exception) {
    Log.error(exception.toString(), exception);

    /*return FirebaseCrashlytics.instance.recordError(
      exception,
      null,
      reason: exception.toString(),
    );*/

    return Future.value();
  }

  static void onError(Object error, StackTrace stackTrace) {
    if (Environment.hasCrashReports) {
      //FirebaseCrashlytics.instance.recordError(error, stackTrace, fatal: true);
    } else {
      Log.uncaughtError(error, stackTrace);
    }
  }
}
