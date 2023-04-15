// ignore_for_file: lines_longer_than_80_chars

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';

class AnalyticsLogger {
  AnalyticsLogger({
    required FirebaseAnalytics logger,
  }) : _logger = logger;

  final FirebaseAnalytics _logger;

  // ignore: unused_element
  Future<void> _logEvent({
    required String name,
    Map<String, dynamic>? parameters,
  }) async {
    if (kDebugMode) {
      print('AnalyticsLogger: logging event $name');
    }
    final eventData = <String, dynamic>{
      'date_time': DateTime.now().toIso8601String()
    }..addAll(parameters ?? {});

    await _logger.logEvent(name: name, parameters: eventData);
  }

  Future<void> logScreenView({required String screenName}) async {
    if (kDebugMode) {
      print('AnalyticsLogger: logging screen $screenName');
    }
    await _logger.logScreenView(screenName: screenName);
  }
}
