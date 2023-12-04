import 'package:flutter/material.dart';

import '../pages/pages.dart';

class AppRoutes {
  static const initialRoute = '/home';

  static Map<String, Widget Function(BuildContext)> routes = {
    '/heroroster': (BuildContext context) => const HeroRosterScreen(),
    '/home': (BuildContext context) => HomePage(),
  };

  static Route<dynamic>? Function(RouteSettings)? onGenerateRoute =
      (RouteSettings settings) {
    print(settings);

    return MaterialPageRoute(
        builder: (context) =>
            AlertDialog(title: Text('Unknown route: ${settings.name}')));
  };

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    return routes;
  }
}
