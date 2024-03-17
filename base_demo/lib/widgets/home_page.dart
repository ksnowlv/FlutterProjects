import 'package:base_demo/widgets/animated_list_widget.dart';
import 'package:base_demo/widgets/box_constraints_demo_widget.dart';
import 'package:base_demo/widgets/custom_render_object_widget.dart';
import 'package:base_demo/widgets/detail_page.dart';
import 'package:base_demo/widgets/event_bus_widget.dart';
import 'package:base_demo/widgets/flex_widget.dart';
import 'package:base_demo/widgets/goods_list_widget.dart';
import 'package:base_demo/widgets/grid_view_widget.dart';
import 'package:base_demo/widgets/row_column_widget.dart';
import 'package:base_demo/widgets/shared_preferences.widget.dart';
import 'package:base_demo/widgets/single_child_scrollview_page.dart';
import 'package:base_demo/widgets/stack_%20positioned_widget.dart';
import 'package:base_demo/widgets/wrap_flow_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _curIndex = 0;

  final List<Widget> _pages = [
    const PageOne(title: '首页'),
    const PageTwo(title: '学习'),
    const PageMine(title: '我的'),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _curIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom Navigation Example'),
      ),
      body: IndexedStack(
        index: _curIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _curIndex,
        onTap: _onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('images/home.png', width: 60),
            label: '首页',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('images/study.png', width: 60),
            label: '学习',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('images/mine.png', width: 60),
            label: '我的',
          ),
        ],
      ),
    );
  }
}

class PageOne extends StatelessWidget {
  const PageOne({super.key, required this.title});

  final String title;

  void _onButtonPressed(BuildContext context) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const DetailPage(
                  data: 'Hello from PageOne',
                )));

    if (!context.mounted) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('receive result:$result')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('This is Page one111'),
          ElevatedButton(
            onPressed: () {
              _onButtonPressed(context);
            },
            child: const Text('go go detail page'),
          ),
          //  const CustomRenderObjectWidget(),
          //const XSingleChildScrollView(),
          // const Expanded(
          //   child: GoodsListWidget(), // 在这里嵌入MyListViewWidget
          // ),
          // const Expanded(
          //   child: GridViewWidget(),
          // ),
          const Expanded(child: AnimatedListWidget()),
          const EventBusWidget(),
        ],
      ),
    );
  }
}

class PageTwo extends StatelessWidget {
  const PageTwo({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: BoxConstraintsDemoWidget(),
    );
  }
}

class PageMine extends StatelessWidget {
  const PageMine({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return const Center(
      // child: RowColumnWidget()
      //child: FlexWidget(),
      //child: SharedPreferencesWidget(),
      //child: WrapFlowWidget() ,
      child: StackPositionedWidget(),
    );
  }
}
