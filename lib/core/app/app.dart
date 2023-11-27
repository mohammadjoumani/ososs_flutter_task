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
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
    );
  }
}
