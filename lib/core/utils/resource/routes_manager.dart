import 'package:flutter/material.dart';
import 'package:ososs_flutter_task/features/animations/presentation/view/animations_view.dart';
import 'package:ososs_flutter_task/features/home/presentation/view/home_view.dart';
import 'package:ososs_flutter_task/features/pokemons/di/init_pokemons_module.dart';
import 'package:ososs_flutter_task/features/pokemons/presentation/view/pokemons_view.dart';
import 'package:ososs_flutter_task/features/splash/presentation/view/splash_view.dart';

import 'string_manager.dart';

class Routes {
  static const String splashRoute = "/";
  static const String homeRoute = "/home";
  static const String animationsRoute = "/animations";
  static const String pokemonsRoute = "/pokemons";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    final Map arguments = (settings.arguments ?? {}) as Map;
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case Routes.animationsRoute:
        final name = arguments["name"];
        return MaterialPageRoute(builder: (_) => AnimationsView(name: name));
      case Routes.pokemonsRoute:
        initPokemonsModule();
        return MaterialPageRoute(builder: (_) => const PokemonsView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.strNoRouteFound),
        ),
        body: const Center(
          child: Text(
            AppStrings.strNoRouteFound,
            style: TextStyle(
              color: Color(0xFFA0A0A0),
              fontSize: 14,
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          ),
        ),
      ),
    );
  }
}
