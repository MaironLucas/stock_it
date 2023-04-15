import 'package:domain/exceptions.dart';
import 'package:domain/logger.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:stock_it/main.dart';
import 'package:stock_it/presentation/common/app_theme/app_theme.dart';
import 'package:stock_it/presentation/common/app_theme/light_app_theme.dart';

final errorLoggerProvider = Provider<ErrorLogger>(
  (ref) => Log().logError,
);

final appThemeProvider = Provider<AppTheme>(
  (_) => LightAppTheme(),
);

final isarProvider = Provider<Isar>(
  (_) => throw DatabaseNotStartedException(),
);
