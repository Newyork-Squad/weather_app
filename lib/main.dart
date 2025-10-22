import 'package:flutter/material.dart';
import 'package:weather_app/ui/designSystem/theme/AppThemeProvider.dart';
import 'package:weather_app/ui/screen/home_screen.dart';

void main() {
  runApp(
    const AppThemeProvider(
      brightness: Brightness.dark,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: MyHomePage(),
      ),
    );
  }
}