// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:base_demo/pages/customwidget/custom_widget_container_page.dart';
import 'package:base_demo/pages/functional/functional_container_page.dart';
import 'package:base_demo/pages/home/file_page.dart';
import 'package:base_demo/pages/keys/keys_container_page.dart';
import 'package:base_demo/pages/net_page/net_container_page.dart';
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
  keys, //Flutter Keys
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
    HomePageRouteType.keys: 'Flutter Keys',
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

    final routerName = _routerFromPageType(pageRouteType);
    final title = _titleFromPageType(pageRouteType);
  
    if (routerName.isEmpty|| title.isEmpty) {
      return;
    }

    if (!context.mounted) {
      return;
    }
    
    await Navigator.pushNamed(context, routerName, arguments: {"title": title, "pageType": pageRouteType.name,});
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemExtent: 60,
      itemCount: HomePageRouteType.values.length,
      itemBuilder: (BuildContext context, int index) {
        final pageType = HomePageRouteType.values[index];
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () => _onShowPage(context, pageType),
                child: Text(
                  _titleFromPageType(pageType),
                  // style: const TextStyle(fontSize: 18),
                )),
          ],
        );
      },
    );
  }

  String _titleFromPageType(HomePageRouteType pageRouteType) {
    return _widgetMap[pageRouteType] ?? "没有该模块";
  }

   String _routerFromPageType(HomePageRouteType pageRouteType) {

    switch (pageRouteType) {
      case HomePageRouteType.baseWidget:
        return '/home/baseWidget';
      case HomePageRouteType.layoutWidget:
        return  '/home/layoutWidget';

      case HomePageRouteType.scrollWidget:
        return '/home/scrollWidget';
       
      case HomePageRouteType.functionalWidget:
        return '/home/functionalWidget';

      case HomePageRouteType.animationWidget:
        return '/home/animationWidget';
      case HomePageRouteType.customWidget:
        return '/home/customWidget';
      
      case HomePageRouteType.fileWidget:
        return '/home/fileWidget';
      case HomePageRouteType.netWidget:
        return '/home/netWidget';

      case HomePageRouteType.extensionWidget:
        return '/home/extensionWidget';
      case HomePageRouteType.keys:
        return '/home/keys';  

      default:
        return '没有该模块:$pageRouteType';
    }
  }
}
