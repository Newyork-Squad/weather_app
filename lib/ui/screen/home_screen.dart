import 'package:flutter/material.dart';
import '../../ui/designSystem/theme/weather_theme.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final theme = MyWeatherTheme.of(context);
    return Column(
      children: <Widget>[
        Container( // Placeholder for yor widget
          height: 100,
          width: 100,
          color: theme.colors.surfacePrimary,
          alignment: Alignment.center,
        ),
      ],
    );
  }
}
