import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/ui/designSystem/theme/weather_theme.dart';

class LocationDisplayComponent extends StatelessWidget {
  final String locationName;

  final double fontSize;
  final double iconSize;

  const LocationDisplayComponent({
    super.key,
    required this.locationName,
    this.fontSize = 16.0,
    this.iconSize = 24.0,
  });

  @override
  Widget build(BuildContext context) {
    final theme = MyWeatherTheme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SvgPicture.asset(
          'assets/icons/ic_location.svg',
          width: 14,
          height: 14,
          colorFilter: ColorFilter.mode(
            theme.colors.shadeQuaternary,
            BlendMode.srcIn,
          ),
        ),

        const SizedBox(width: 4.0),

        Text(
          locationName.contains('/') ? locationName.split('/').last : locationName,
          style: theme.typography.textTheme.labelLarge?.copyWith(
            color: theme.colors.shadeQuaternary,
          ),
        ),
      ],
    );
  }
}
