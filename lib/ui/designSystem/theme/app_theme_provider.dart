import 'package:flutter/widgets.dart';
import '../colors/app_color.dart';
import '../typography/app_typography.dart';
import '../theme/weather_theme.dart';

class AppThemeProvider extends StatelessWidget {
  final Brightness brightness;
  final Widget child;

  const AppThemeProvider({
    super.key,
    required this.brightness,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final colors =
    brightness == Brightness.dark ? AppColors.dark : AppColors.light;

    final typography = AppTypography(brightness);

    return MyWeatherTheme(
      brightness: brightness,
      colors: colors,
      typography: typography,
      child: child,
    );
  }
}
