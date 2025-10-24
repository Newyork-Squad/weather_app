import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../designSystem/theme/weather_theme.dart';

class CurrentWeather extends StatefulWidget {
  const CurrentWeather({
    super.key,
    required this.temperature,
    required this.weatherIcon,
    required this.weatherMessage,
    required this.maxTemp,
    required this.minTemp,
  });

  final double temperature;
  final String weatherIcon;
  final String weatherMessage;
  final double maxTemp;
  final double minTemp;

  @override
  State<CurrentWeather> createState() => _CurrentWeatherState();
}

class _CurrentWeatherState extends State<CurrentWeather> {
  @override
  Widget build(BuildContext context) {
    final theme = MyWeatherTheme.of(context);
    const maxHeight = 400.0;
    const minHeight = 215.0;
    const titleWidth = 166.0;
    return SliverAppBar(
      floating: false,
      collapsedHeight: 140,
      expandedHeight: maxHeight,
      backgroundColor: Colors.transparent,
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          double currentHeight = constraints.biggest.height;
          double screenWidth = MediaQuery.of(context).size.width;
          double shrinkPercentage =
              (currentHeight - minHeight) / (maxHeight - minHeight);
          double detailsRightPadding =
              ((screenWidth / 2 - titleWidth / 2) * shrinkPercentage).clamp(
                12.0,
                double.infinity,
              );
          double imageWidth = 255.0;
          double imageLeftPadding =
              ((screenWidth / 2 - imageWidth / 2) * shrinkPercentage).clamp(
                12.0,
                double.infinity,
              );

          return FlexibleSpaceBar(
            centerTitle: true,
            titlePadding: EdgeInsets.only(top: 0, left: 0, bottom: 0, right: 0),
            expandedTitleScale: 1.0,
            // Prevents default scaling
            title: Stack(
              fit: StackFit.expand,
              children: [
                Positioned(
                  left: imageLeftPadding,
                  bottom: (currentHeight - minHeight - 20).clamp(
                    -30,
                    double.infinity,
                  ),
                  child: Transform.scale(
                    alignment: Alignment.topLeft,
                    scale: shrinkPercentage.clamp(0.8, 1.0),
                    child: SizedBox(
                      width: imageWidth,
                      height: 215,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: imageWidth * 0.9,
                            height: 200,
                            alignment: Alignment.bottomCenter,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.transparent,
                              boxShadow: [
                                BoxShadow(
                                  color: theme.colors.glow.withValues(
                                    alpha: 0.2,
                                  ),
                                  blurRadius: 40,
                                  spreadRadius: 0,
                                ),
                              ],
                            ),
                          ),
                          Image(
                            image: AssetImage(widget.weatherIcon),
                            width: imageWidth * 0.95,
                            height: 215,
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: detailsRightPadding,
                  bottom: 24,
                  child: WeatherInfoColumn(
                    temperature: widget.temperature,
                    weatherMessage: widget.weatherMessage,
                    maxTemp: widget.maxTemp,
                    minTemp: widget.minTemp,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class WeatherInfoColumn extends StatefulWidget {
  final double temperature;
  final String weatherMessage;
  final double maxTemp;
  final double minTemp;

  const WeatherInfoColumn({
    super.key,
    required this.temperature,
    required this.weatherMessage,
    required this.maxTemp,
    required this.minTemp,
  });

  @override
  State<WeatherInfoColumn> createState() => _WeatherInfoColumnState();
}

class _WeatherInfoColumnState extends State<WeatherInfoColumn> {
  @override
  Widget build(BuildContext context) {
    final theme = MyWeatherTheme.of(context);
    final alphaShadePrimaryColor = theme.colors.shadePrimary.withValues(
      alpha: 0.6,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          '${widget.temperature.toInt()}°C',
          style: theme.typography.textTheme.headlineLarge?.copyWith(
            color: theme.colors.shadePrimary,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: Text(
            widget.weatherMessage,
            style: theme.typography.textTheme.labelLarge?.copyWith(
              color: alphaShadePrimaryColor,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: theme.colors.shadePrimary.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 22.5,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: SvgPicture.asset(
                    'assets/icons/ic_arrow_up.svg',
                    width: 12,
                    height: 12,
                    colorFilter: ColorFilter.mode(
                      alphaShadePrimaryColor,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                Text(
                  '${widget.maxTemp}°C',
                  style: theme.typography.textTheme.labelLarge?.copyWith(
                    color: alphaShadePrimaryColor,
                  ),
                ),
                RotatedBox(
                  quarterTurns: 1,
                  child: Icon(
                    Icons.horizontal_rule,
                    color: alphaShadePrimaryColor,
                    size: 18,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: SvgPicture.asset(
                    'assets/icons/ic_arrow_down.svg',
                    width: 12,
                    height: 12,
                    colorFilter: ColorFilter.mode(
                      alphaShadePrimaryColor,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                Text(
                  '${widget.minTemp}°C',
                  style: theme.typography.textTheme.labelLarge?.copyWith(
                    color: alphaShadePrimaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
