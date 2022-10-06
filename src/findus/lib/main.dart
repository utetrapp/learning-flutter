import 'package:flutter/material.dart';
import 'ui/color_schema.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'ui/screens/home/home_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'ui/screens/home/cubit/home_cubit.dart';
import 'routes.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // localization
        onGenerateTitle: (context) => LocalizedStrings.of(context)!.appTitle,
        supportedLocales: LocalizedStrings.supportedLocales,
        localizationsDelegates: LocalizedStrings.localizationsDelegates,
        theme: SchemaConstants.findusLightSchema,
        darkTheme: SchemaConstants.findusDarkTheme,
        // Use dark or light theme based on system setting.
        themeMode: ThemeMode.system,
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
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute);
  }
}
