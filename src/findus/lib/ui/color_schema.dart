import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class SchemaConstants {
  static ThemeData findusLightSchema = FlexThemeData.light(
    colors: const FlexSchemeColor(
      primary: Color(0xffe65100),
      primaryContainer: Color(0xffffcc80),
      secondary: Color(0xff8bc34a),
      secondaryContainer: Color(0xffe4eaff),
      tertiary: Color(0xff2962ff),
      tertiaryContainer: Color(0xffcbd6ff),
      appBarColor: Color(0xffe4eaff),
      error: Color(0xffb00020),
    ),
    usedColors: 2,
    surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
    blendLevel: 20,
    appBarOpacity: 0.95,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 20,
      blendOnColors: false,
    ),
    useMaterial3ErrorColors: true,
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    // To use the playground font, add GoogleFonts package and uncomment
    // fontFamily: GoogleFonts.notoSans().fontFamily,
  );
  static ThemeData findusDarkTheme = FlexThemeData.dark(
    colors: const FlexSchemeColor(
      primary: Color(0xffffb300),
      primaryContainer: Color(0xffc87200),
      secondary: Color(0xff4caf50),
      secondaryContainer: Color(0xffcddc39),
      tertiary: Color(0xffffff00),
      tertiaryContainer: Color(0xff9c810b),
      appBarColor: Color(0xffcddc39),
      error: Color(0xffcf6679),
    ),
    usedColors: 2,
    surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
    blendLevel: 15,
    appBarStyle: FlexAppBarStyle.background,
    appBarOpacity: 0.90,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 30,
    ),
    useMaterial3ErrorColors: true,
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    // To use the playground font, add GoogleFonts package and uncomment
    // fontFamily: GoogleFonts.notoSans().fontFamily,
  );
}
