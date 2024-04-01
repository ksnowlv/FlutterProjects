// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:base_demo/pages/scroll_widget/scroll_container_page.dart';
import 'package:base_demo/pages/widget/base_container_page.dart';
import 'package:flutter/material.dart';

import 'package:base_demo/pages/detail_page.dart';
import 'package:base_demo/pages/layout/layout_container_page.dart';

enum HomePageRouteType {
  baseWidget, //基础组件
  layoutWidget, //布局组件
  scrollWidget, //滚动组件
  functionalWidget, //功能性组件
  animationWidget, //动画
  customWidget, //自定义组件
  fileWidget, // 文件组件
  netWidget, //网络组件
  extensionWidget, //包和插件组件
}

class HomePage extends StatelessWidget {
  final Map<HomePageRouteType, String> _widgetMap = {
    HomePageRouteType.baseWidget: '基础组件',
    HomePageRouteType.layoutWidget: '布局组件',
    HomePageRouteType.scrollWidget: '滚动组件',
    HomePageRouteType.functionalWidget: '功能性组件',
    HomePageRouteType.animationWidget: '动画组件',
    HomePageRouteType.customWidget: '自定义组件',
    HomePageRouteType.fileWidget: '文件组件',
    HomePageRouteType.netWidget: '网络组件',
    HomePageRouteType.extensionWidget: '包和插件组件',
  };

  HomePage({
    super.key,
    required this.title,
  });

  final String title;

  void _onButtonPressed(BuildContext context) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const DetailPage(
                  data: 'Hello from main',
                )));

    if (!context.mounted) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('receive result:$result')),
    );
  }

  void _onShowPage(
      BuildContext context, HomePageRouteType pageRouteType) async {
    if (!context.mounted) {
      return;
    }

    final result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => _getWidgetPage(pageRouteType)));
    debugPrint('result:$result');
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: HomePageRouteType.values
          .map<Widget>((pageType) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () => _onShowPage(context, pageType),
                      child: Text(
                        _getPageTypeText(pageType),
                        style: const TextStyle(fontSize: 18),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ))
          .toList(),
    );
  }

  String _getPageTypeText(HomePageRouteType pageRouteType) {
    return _widgetMap[pageRouteType] ?? "没有该模块";
  }

  Widget _getWidgetPage(HomePageRouteType pageRouteType) {
    switch (pageRouteType) {
      case HomePageRouteType.baseWidget:
        return const BaseContainerPage();
      case HomePageRouteType.layoutWidget:
        return const LayoutContainerPage();

      case HomePageRouteType.scrollWidget:
        return const ScrollContainerPage();
      case HomePageRouteType.functionalWidget:
        return const LayoutContainerPage();

      case HomePageRouteType.animationWidget:
        return const LayoutContainerPage();
      case HomePageRouteType.customWidget:
        return const LayoutContainerPage();

      case HomePageRouteType.fileWidget:
        return const LayoutContainerPage();
      case HomePageRouteType.netWidget:
        return const LayoutContainerPage();

      case HomePageRouteType.extensionWidget:
        return const LayoutContainerPage();

      default:
        return Text('没有该模块:$pageRouteType');
    }
  }
}
