import 'package:flutter/material.dart';

import '../models/fighter_model.dart';
import '../pages/pages.dart';

class AppRoutes {
  static const initialRoute = '/home';

  static Map<String, Widget Function(BuildContext)> routes = {
    '/heroroster': (BuildContext context) => const HeroRosterScreen(),
    '/home': (BuildContext context) => HomePage(),
    '/fight': (BuildContext context) => const FightScreen(),
  };

  static Route<dynamic>? Function(RouteSettings)? onGenerateRoute =
      (RouteSettings settings) {
    print(settings);

    if (settings.name == '/herodetail') {
      // Define what happens if we navigate to the detail page. Since we need a
      // Fighter object, we need to pass it to the HeroDetailScreen constructor.

      final FighterModel fighter = settings.arguments as FighterModel;
      return MaterialPageRoute(
        builder: (context) => HeroDetailScreen(
          fighter: fighter,
        ),
      );
    }

    return MaterialPageRoute(
        builder: (context) =>
            AlertDialog(title: Text('Unknown route: ${settings.name}')));
  };

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    return routes;
  }
}
