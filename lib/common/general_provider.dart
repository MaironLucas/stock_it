import 'package:domain/exceptions.dart';
import 'package:domain/logger.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:stock_it/common/analytics_logger.dart';
import 'package:stock_it/common/analytics_observer.dart';
import 'package:stock_it/main.dart';
import 'package:stock_it/presentation/common/app_theme/app_theme.dart';
import 'package:stock_it/presentation/common/app_theme/light_app_theme.dart';

final errorLoggerProvider = Provider<ErrorLogger>(
  (ref) => Log().logError,
);

final appThemeProvider = Provider<AppTheme>(
  (_) => LightAppTheme(),
);

final _firebaseAnalyticsProvider =
    Provider<FirebaseAnalytics>((ref) => FirebaseAnalytics.instance);

final analyticsLoggerProvider = Provider<AnalyticsLogger>((ref) {
  final firebaseAnalytics =
      ref.watch<FirebaseAnalytics>(_firebaseAnalyticsProvider);
  return AnalyticsLogger(logger: firebaseAnalytics);
});

final analyticsObserverProvider = Provider<AnalyticsObserver>((ref) {
  final analyticsLogger = ref.watch(analyticsLoggerProvider);
  return AnalyticsObserver(logger: analyticsLogger);
});

final isarProvider = Provider<Isar>(
  (_) => throw DatabaseNotStartedException(),
);
