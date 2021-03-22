import 'package:firebase_analytics/firebase_analytics.dart';
import '../core/event_logger.dart';

class DefaultFirebaseLogger implements EventLogger {
  @override
  logEvent(String event) async {
    FirebaseAnalytics _analytics = FirebaseAnalytics();
    await _analytics.logEvent(name: event, parameters: null);
  }
}
