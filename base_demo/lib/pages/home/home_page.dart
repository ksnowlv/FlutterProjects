// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:base_demo/bloc/counter_cubit.dart';
import 'package:base_demo/pages/detail_page.dart';
import 'package:base_demo/pages/layout/align_widget.dart';
import 'package:base_demo/pages/layout/box_constraints_demo_widget.dart';
import 'package:base_demo/pages/layout/flex_widget.dart';
import 'package:base_demo/pages/layout/layout_container_page.dart';
import 'package:base_demo/pages/layout/layout_page.dart';
import 'package:base_demo/pages/layout/row_column_widget.dart';
import 'package:base_demo/pages/layout/wrap_flow_widget.dart';
import 'package:base_demo/widgets/animated_list_widget.dart';
import 'package:base_demo/widgets/animations_widget.dart';
import 'package:base_demo/widgets/compute_widget.dart';
import 'package:base_demo/widgets/counter_widget.dart';
import 'package:base_demo/widgets/custom_render_object_widget.dart';
import 'package:base_demo/widgets/event_bus_widget.dart';
import 'package:base_demo/widgets/flutte_secure_storage_widget.dart';
import 'package:base_demo/widgets/flutte_secure_storage_widget.dart';
import 'package:base_demo/widgets/flutter_toast_widget.dart';
import 'package:base_demo/widgets/future_widget.dart';
import 'package:base_demo/widgets/getx_widget.dart';
import 'package:base_demo/widgets/goods_list_widget.dart';
import 'package:base_demo/widgets/grid_view_widget.dart';
import 'package:base_demo/widgets/hive_widget.dart';
import 'package:base_demo/widgets/image_cache_widget.dart';
import 'package:base_demo/widgets/imagepicker_widget.dart';
import 'package:base_demo/widgets/isolate_widget.dart';
import 'package:base_demo/widgets/photo_view_widget.dart';
import 'package:base_demo/widgets/provider_widget.dart';
import 'package:base_demo/widgets/shared_preferences.widget.dart';
import 'package:base_demo/widgets/single_child_scrollview_page.dart';

enum HomePageRouteType {
  baseWidget, //基础组件
  layoutWidget, //基础组件
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
    HomePageRouteType.layoutWidget: '基础组件',
    HomePageRouteType.scrollWidget: '滚动组件',
    HomePageRouteType.functionalWidget: '功能性组件',
    HomePageRouteType.animationWidget: '动画组件',
    HomePageRouteType.fileWidget: '自定义组件',
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
        return const LayoutContainerPage();
      case HomePageRouteType.layoutWidget:
        return const LayoutContainerPage();

      case HomePageRouteType.scrollWidget:
        return const LayoutContainerPage();
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
