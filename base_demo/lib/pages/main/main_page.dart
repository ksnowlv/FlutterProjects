import 'package:base_demo/pages/home/home_page.dart';
import 'package:base_demo/pages/mine/mine_page.dart';
import 'package:base_demo/pages/plugins/plugins_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title});

  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  static final List<String> _titles = ['首页', '插件', '我的'];
  final List<Widget> _pages = [
    HomePage(title: _titles[0]),
    PluginsPage(title: _titles[1]),
    MinePage(title: _titles[2]),
  ];

  int _curIndex = 0;
  String _pageTitle = '';

  @override
  void initState() {
    super.initState();

    _pageTitle = _titles[_curIndex];
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
            icon: Image.asset('assets/images/home.png', width: 60),
            label: _titles[0],
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/plugin.png', width: 60),
            label: _titles[1],
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/mine.png', width: 60),
            label: _titles[2],
          ),
        ],
      ),
    );
  }
}
