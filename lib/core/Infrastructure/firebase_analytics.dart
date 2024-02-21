import 'package:firebase_analytics/firebase_analytics.dart';

class FireBaseAnalytics {
  logSelectResort({required String resortName}) async {
    print("logSelectResort");
    try {
      await FirebaseAnalytics.instance.logSelectContent(
        contentType: "Resort",
        itemId: resortName,
      );
    } catch (e) {
      print(e);
    }
  }

  logEventResort({required String resortName}) async {
    print("logSelectResort");
    try {
      await FirebaseAnalytics.instance
          .logEvent(name: "open_resort", parameters: {
        'resort_name': resortName,
      });
    } catch (e) {
      print(e);
    }
  }
}
