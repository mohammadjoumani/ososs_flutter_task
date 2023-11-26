import 'package:flutter/material.dart';
import 'package:ososs_flutter_task/core/utils/resource/routes_manager.dart';

GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();

class OsossApp extends StatelessWidget {
  const OsossApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      title: 'Ossos Flutter Task',
      // locale: ENGLISH_LOCAL,
      // supportedLocales: const [ENGLISH_LOCAL, ARABIC_LOCAL],
      // localizationsDelegates: const [
      //   AppLocalizations.delegate,
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate
      // ],
      // localeResolutionCallback: (deviceLocale, supportedLocales) {
      //   for (var locale in supportedLocales) {
      //     if (deviceLocale != null &&
      //         deviceLocale.languageCode == locale.languageCode) {
      //       return deviceLocale;
      //     }
      //   }
      //   return supportedLocales.first;
      // },
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
      // theme: state.locale == ARABIC_LOCAL
      //     ? ArabicLightModeTheme().themeData
      //     : EnglishLightModeTheme().themeData,
    );
  }
}
