import 'package:flutter/material.dart';
import 'package:base_demo/pages/scroll_widget/animated_list_widget.dart';
import 'package:base_demo/pages/scroll_widget/goods_list_widget.dart';
import 'package:base_demo/pages/scroll_widget/grid_view_widget.dart';
import 'package:base_demo/pages/scroll_widget/list_view_with_selectable_items.dart';
import 'package:base_demo/pages/scroll_widget/main_tabbarview.dart';
import 'package:base_demo/pages/scroll_widget/mynestedscrollview_page.dart';
import 'package:base_demo/pages/scroll_widget/order_list_page.dart';
import 'package:base_demo/pages/scroll_widget/single_child_scrollview_page.dart';


enum ScrollPageType {
  singleChildScrollView, //SingleChildScrollView
  listView, //ListView
  listViewWithSelectable, //ListView
  animatedList, //AnimatedList
  gridView, //GridView
  pageView, //PageView
  tabBarView, //TabBarView
  nestedScrollView,//NestedScrollView
}

class ScrollPage extends StatefulWidget {

  final ScrollPageType pageType;
  final String pageTitle;

  const ScrollPage({super.key, required this.pageType, required this.pageTitle});

  @override
  State<ScrollPage> createState() => _ScrollPageState();
}

class _ScrollPageState extends State<ScrollPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pageTitle),
      ),
      body: Center(child: _widgetFromType(widget.pageType),),
    );
  }



    Widget _widgetFromType(ScrollPageType pageType) {
    switch (pageType) {
      case ScrollPageType.singleChildScrollView:
        return const XSingleChildScrollView();
      case ScrollPageType.listView:
        return const GoodsListWidget();
      case ScrollPageType.listViewWithSelectable:
        return const ListViewWithSelectableItems();  

      case ScrollPageType.animatedList:
        return const AnimatedListWidget();
      case ScrollPageType.gridView:
        return const GridViewWidget();

      case ScrollPageType.pageView:
        return const OrderListPage();
      case ScrollPageType.tabBarView:
        return const MainTabBarView();

      case ScrollPageType.nestedScrollView:
        return const MyNestedScrollViewPage();
    
      default:
        return Text('没有该模块:$pageType');
    }
  }
}