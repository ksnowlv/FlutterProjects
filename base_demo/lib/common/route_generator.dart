import 'package:base_demo/pages/customwidget/custom_widget_container_page.dart';
import 'package:base_demo/pages/functional/functional_container_page.dart';
import 'package:base_demo/pages/home/file_page.dart';
import 'package:base_demo/pages/home/home_page.dart';
import 'package:base_demo/pages/keys/keys_container_page.dart';
import 'package:base_demo/pages/layout/layout_container_page.dart';
import 'package:base_demo/pages/net_page/net_container_page.dart';
import 'package:base_demo/pages/scroll_widget/scroll_container_page.dart';
import 'package:base_demo/pages/widget/base_container_page.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    
    final arguments = settings.arguments as Map<String,dynamic>?;

    debugPrint('---RouteGenerator RouteSettings: ${settings.name} ， arguments $arguments');

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage(title: "Home"));
      case '/home/baseWidget':
        return MaterialPageRoute(
            builder: (_) =>
                BaseContainerPage(title: arguments?['title']?? ""));
      case '/home/layoutWidget':
        return MaterialPageRoute(
            builder: (_) => LayoutContainerPage(
                  title: arguments?['title']?? "",
                ));
      case '/home/scrollWidget':
        return MaterialPageRoute(
            builder: (_) => ScrollContainerPage(title: arguments?['title']?? ""));
      case '/home/functionalWidget':
        return MaterialPageRoute(
            builder: (_) => FunctionalContainerPage(
                  title: arguments?['title']?? "",
                ));
      case '/home/animationWidget':
        return MaterialPageRoute(
            builder: (_) => LayoutContainerPage(title: arguments?['title']?? ""));
      case '/home/customWidget':
        return MaterialPageRoute(
            builder: (_) => CustomWidgetContainerPage(title: arguments?['title']?? ""));
      case '/home/fileWidget':
        return MaterialPageRoute(
            builder: (_) =>  FilePage(title: arguments?['title']?? ""));
      case '/home/netWidget':
        return MaterialPageRoute(
            builder: (_) => NetContainerPage(title: arguments?['title']?? ""));
      case '/home/extensionWidget':
        return MaterialPageRoute(
            builder: (_) => LayoutContainerPage(title: arguments?['title']?? ""));
      case '/home/keys':
        return MaterialPageRoute(
            builder: (_) => KeysContainerPage(title: arguments?['title']?? ""));

      default:
        debugPrint('---RouteGenerator RouteSettings:2 ${settings.name}');debugPrint('---RouteGenerator RouteSettings: ${settings.name}');
        return onUnknownRoute(RouteSettings(name: '${settings.name}'));
    }
  }

  static Route onUnknownRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: const Text('UnknownRoute'),
          centerTitle: true,
        ),
        body: Center(
          child: Text('找不到${settings.name}页面， 404,稍候再试'),
        ),
      ),
    );
  }
}
