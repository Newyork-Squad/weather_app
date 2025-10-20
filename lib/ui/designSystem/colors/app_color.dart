import 'package:flutter/material.dart';


class AppColors {
  AppColors._();

  static const light = AppColorScheme(
    backgroundPrimary: Color(0xFF87CEFA),
    backgroundSecondary: Color(0xFFFFFFFF),
    shadePrimary: Color(0xFF060414),
    shadeSecondary: Color(0xDE060414),
    shadeTertiary: Color(0x99060414),
    shadeQuaternary: Color(0xFF323232),
    surfacePrimary: Color(0xB3FFFFFF),
    surfaceSecondary: Color(0x14060414),
    brand: Color(0xFF87CEFA),
    strokePrimary: Color(0x14FFFFFF),
    strokeSecondary: Color(0x3D060414),
    glow: Color(0xFF00619D)
  );

  static const dark = AppColorScheme(
    backgroundPrimary: Color(0xFF060414),
    backgroundSecondary: Color(0xFF0D0C19),
    shadePrimary: Color(0xFFFFFFFF),
    shadeSecondary: Color(0xDEFFFFFF),
    shadeTertiary: Color(0x99060414),
    shadeQuaternary: Color(0xFFFFFFFF),
    surfacePrimary: Color(0xB3060414),
    surfaceSecondary: Color(0x14060414),
    brand: Color(0xFF87CEFA),
    strokePrimary: Color(0x14FFFFFF),
    strokeSecondary: Color(0x3DFFFFFF),
    glow: Color(0xFFC0B7FF)
  );
}

class AppColorScheme {
  final Color backgroundPrimary;
  final Color backgroundSecondary;
  final Color shadePrimary;
  final Color shadeSecondary;
  final Color shadeTertiary;
  final Color shadeQuaternary;
  final Color surfacePrimary;
  final Color surfaceSecondary;
  final Color brand;
  final Color strokePrimary;
  final Color strokeSecondary;
  final Color glow;

  const AppColorScheme({
    required this.backgroundPrimary,
    required this.backgroundSecondary,
    required this.shadePrimary,
    required this.shadeSecondary,
    required this.shadeTertiary,
    required this.shadeQuaternary,
    required this.surfacePrimary,
    required this.surfaceSecondary,
    required this.brand,
    required this.strokePrimary,
    required this.strokeSecondary,
    required this.glow
  });
}