import 'package:base_demo/pages/scroll_widget/main_tabbarview.dart';
import 'package:base_demo/pages/scroll_widget/mynestedscrollview_page.dart';
import 'package:base_demo/pages/scroll_widget/scroll_page.dart';
import 'package:flutter/material.dart';

class ScrollContainerPage extends StatefulWidget {
  final String title;
  const ScrollContainerPage({super.key, required this.title});

  @override
  State<ScrollContainerPage> createState() => _ScrollContainerPageState();
}

class _ScrollContainerPageState extends State<ScrollContainerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemExtent: 60,
        itemCount: ScrollPageType.values.length,
        itemBuilder: (BuildContext context, int index) {
          final pageType = ScrollPageType.values[index];
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  child: Text(_titleFromPageType(pageType)),
                  onPressed: () {
                    _showWidgetPage(context, pageType);
                  }),
            ],
          );
        },
      ),
    );
  }

  String _titleFromPageType(ScrollPageType pageType) {
    Map<ScrollPageType, String> titleMap = {
      ScrollPageType.singleChildScrollView: 'SingleChildScrollView',
      ScrollPageType.listView: 'listView',
      ScrollPageType.listViewWithSelectable: 'list_view_with_selectable_items',
      ScrollPageType.animatedList: 'AnimatedList',
      ScrollPageType.gridView: 'GridView',
      ScrollPageType.pageView: 'PageView',
      ScrollPageType.tabBarView: 'TabBarView',
      ScrollPageType.nestedScrollView: 'NestedScrollView',
    };

    return titleMap[pageType] ?? "没有该布局";
  }

  void _showWidgetPage(BuildContext context, ScrollPageType pageType) async {
    if (!context.mounted) {
      return;
    }

    final result =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      if (pageType == ScrollPageType.tabBarView) {
        return const MainTabBarView();
      } else if (pageType == ScrollPageType.nestedScrollView) {
        return const MyNestedScrollViewPage();
      }

      return ScrollPage(
          pageType: pageType, pageTitle: _titleFromPageType(pageType));
    }));

    debugPrint('result: $result');
  }
}
