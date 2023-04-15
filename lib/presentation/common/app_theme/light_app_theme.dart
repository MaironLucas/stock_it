import 'package:stock_it/presentation/common/app_theme/app_theme.dart';

part 'colors/light_colors.dart';
part 'text_styles/light_text_styles.dart';
part 'assets_paths/light_assets_paths.dart';

class LightAppTheme implements AppTheme {
  @override
  AppAssetsPaths get assets => LightAssetsPaths();

  @override
  AppColors get colors => LightColors();

  @override
  AppTextStyles get textStyles => LightTextStyles();
}
