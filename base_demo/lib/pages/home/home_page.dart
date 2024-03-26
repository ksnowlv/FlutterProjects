import 'package:base_demo/bloc/counter_cubit.dart';
import 'package:base_demo/pages/layout/layout_container_page.dart';
import 'package:base_demo/pages/layout/layout_page.dart';
import 'package:base_demo/pages/layout/align_widget.dart';
import 'package:base_demo/widgets/animated_list_widget.dart';
import 'package:base_demo/widgets/animations_widget.dart';
import 'package:base_demo/pages/layout/box_constraints_demo_widget.dart';
import 'package:base_demo/widgets/compute_widget.dart';
import 'package:base_demo/widgets/counter_widget.dart';
import 'package:base_demo/widgets/custom_render_object_widget.dart';
import 'package:base_demo/pages/detail_page.dart';
import 'package:base_demo/widgets/event_bus_widget.dart';
import 'package:base_demo/pages/layout/flex_widget.dart';
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
import 'package:base_demo/pages/layout/row_column_widget.dart';
import 'package:base_demo/widgets/shared_preferences.widget.dart';
import 'package:base_demo/widgets/single_child_scrollview_page.dart';
import 'package:base_demo/pages/layout/wrap_flow_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:base_demo/widgets/flutte_secure_storage_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _titles = ['首页', '学习', '我的'];
  final List<Widget> _pages = [
    const PageOne(title: '首页'),
    const PageTwo(title: '学习'),
    const PageMine(title: '我的'),
  ];

  int _curIndex = 0;
  String _pageTitle = '';

  @override
  void initState() {
    super.initState();

    _pageTitle = _titles[0];
  }

  void _onTabTapped(int index) {
    setState(() {
      _curIndex = index;
      _pageTitle = _titles[_curIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pageTitle),
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

  void _onGotoLayoutPage(BuildContext context) async {
    if (!context.mounted) {
      return;
    }

    final result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => const LayoutContainerPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              _onButtonPressed(context);
            },
            child: const Text('go go detail page'),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              _onGotoLayoutPage(context);
            },
            child: const Text('布局类组件'),
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
      // child: SharedPreferencesWidget(),
      //child: WrapFlowWidget() ,
      //child: StackPositionedWidget(),
      // child: AlignWidegt(),
      //child: FlutterToastWidget(),
      //child: ImageCacheWidget(),
      //child: PhotoViewWidget(),
      // child: ImagePickerWidget(),
      // child:GetxWidget(),
      //child:AnimationsWidget(),
      //child: FlutteSecureStorageWidget() ,
      //child: HiveWidget(),
      //child: ProviderWidget(),
      //child: ComputeWidget(),
      // child: IsolateWidget(),
      child: FutureWidget(),
    );

    return BlocProvider(
      create: (context) => CounterCubit(0),
      child: const Center(child: CounterWidget()),
    );
  }
}
