import 'package:flutter/material.dart';
import '../colors/app_color.dart';
import '../typography/app_typography.dart';

class MyWeatherTheme extends InheritedWidget {
  final Brightness brightness;
  final AppColorScheme colors;
  final AppTypography typography;

  const MyWeatherTheme({
    super.key,
    required this.brightness,
    required this.colors,
    required this.typography,
    required super.child,
  });

  static MyWeatherTheme of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<MyWeatherTheme>();
    assert(result != null, 'No AppTheme found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(MyWeatherTheme oldWidget) {
    return brightness != oldWidget.brightness ||
        colors != oldWidget.colors ||
        typography != oldWidget.typography;
  }
}
