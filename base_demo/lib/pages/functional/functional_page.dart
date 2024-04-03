import 'package:base_demo/dialogs/dialog_page.dart';
import 'package:base_demo/pages/functional/color_theme_widget.dart';
import 'package:base_demo/pages/functional/future_stream_builder_widget.dart';
import 'package:base_demo/pages/functional/pop_scop_widget.dart';
import 'package:base_demo/pages/functional/shared_data_widget.dart';
import 'package:base_demo/pages/functional/state_shared_widget.dart';
import 'package:base_demo/pages/mine/value_listenable_builder_page.dart';
import 'package:flutter/material.dart';
import 'package:base_demo/pages/scroll_widget/animated_list_widget.dart';
import 'package:base_demo/pages/scroll_widget/goods_list_widget.dart';
import 'package:base_demo/pages/scroll_widget/grid_view_widget.dart';
import 'package:base_demo/pages/scroll_widget/list_view_with_selectable_items.dart';
import 'package:base_demo/pages/scroll_widget/main_tabbarview.dart';
import 'package:base_demo/pages/scroll_widget/mynestedscrollview_page.dart';
import 'package:base_demo/pages/scroll_widget/order_list_page.dart';
import 'package:base_demo/pages/scroll_widget/single_child_scrollview_page.dart';


enum FunctionalPageType {
  popScope, // 导航返回拦截
  inheritedWidget, //数据共享
  stateShared, //跨组件状态共享
  colorAndTheme, //颜色和主题
  valueListenableBuilder, //按需rebuild
  futureStreamBuilder, //异步UI更新
  dialog,//对话框
}

class  FunctionalPage extends StatefulWidget {

  final FunctionalPageType pageType;
  final String pageTitle;

  const  FunctionalPage({super.key, required this.pageType, required this.pageTitle});

  @override
  State<FunctionalPage> createState() => _FunctionalPageState();
}

class _FunctionalPageState extends State<FunctionalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pageTitle),
      ),
      body: Center(child: _widgetFromType(widget.pageType),),
    );
  }

    Widget _widgetFromType(FunctionalPageType pageType) {
    switch (pageType) {
      case FunctionalPageType.popScope:
        return const PopScopWidget();
      case FunctionalPageType.inheritedWidget:
        return const InheritedContainerWidget();
      case FunctionalPageType.stateShared:
        return const StateSharedWidget();  

      case FunctionalPageType.colorAndTheme:
        return const ColorThemeWidget();
      case FunctionalPageType.valueListenableBuilder:
        return const ValueListenableBuilderPage();

      case FunctionalPageType.futureStreamBuilder:
        return const FutureStreamBuilderWidget();
      case FunctionalPageType.dialog:
        return const DialogPage();
    
      default:
        return Text('没有该模块:$pageType');
    }
  }
}