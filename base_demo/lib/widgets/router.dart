import 'package:base_demo/widgets/routes_pages.dart';
import 'package:flutter/material.dart';

class XRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case '/first':
        return MaterialPageRoute(builder: (_) => const FirstScreen());

      case '/second':
        return MaterialPageRoute(builder: (_) => const SecondScreen());

      case '/third':
        return MaterialPageRoute(builder: (_) => const ThirdScreen());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                    body: Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('no route define for ${settings.name}'),
                  ),

                )));
    }
  }
}
