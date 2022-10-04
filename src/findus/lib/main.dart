import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';
import 'ui/color_schema.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'ui/screens/home/home_screen.dart';
import 'logic/localization_logic.dart';

void main() async {
  GetIt.I.registerLazySingleton<LocalizationLogic>(() => LocalizationLogic());
  await localizationLogic.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Findus",
        theme: SchemaConstants.findusLightSchema,
        darkTheme: SchemaConstants.findusDarkTheme,
        // Use dark or light theme based on system setting.
        themeMode: ThemeMode.system,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        builder: (context, child) => ResponsiveWrapper.builder(child,
            maxWidth: 1200,
            minWidth: 480,
            defaultScale: true,
            breakpoints: [
              const ResponsiveBreakpoint.resize(480, name: MOBILE),
              const ResponsiveBreakpoint.autoScale(800, name: TABLET),
              const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
            ],
            background: Container(color: const Color(0xFFF5F5F5))),
        home: const HomeScreen(title: "home"));
  }
}

LocalizationLogic get localizationLogic => GetIt.I.get<LocalizationLogic>();
AppLocalizations get $strings => localizationLogic.strings;
