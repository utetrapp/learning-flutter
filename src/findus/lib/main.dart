import 'package:flutter/material.dart';
import 'utils/color_schema.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'routes.dart';
import 'injection.dart' as di;
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  di.init();
  await _initialize();
  FlutterNativeSplash.remove();
  runApp(const MyApp());
}

Future _initialize() async {
  //await .... loading assets or whatever takes time
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => MaterialApp.router(
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
        routerDelegate: appRouter.routerDelegate,
        routeInformationParser: appRouter.routeInformationParser,
        routeInformationProvider: appRouter.routeInformationProvider,
      );
}
