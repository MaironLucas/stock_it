import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stock_it/common/general_provider.dart';

part 'assets_paths/app_assets_paths.dart';
part 'colors/app_colors.dart';
part 'text_styles/app_text_styles.dart';

abstract class AppTheme {
  static AppTheme of(WidgetRef ref) {
    return ref.watch<AppTheme>(appThemeProvider);
  }

  AppColors get colors;

  AppTextStyles get textStyles;

  AppAssetsPaths get assets;
}
