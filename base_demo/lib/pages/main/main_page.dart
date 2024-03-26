import 'package:base_demo/pages/home/home_page.dart';
import 'package:base_demo/pages/mine/mine_page.dart';
import 'package:base_demo/pages/study/study_page.dart';
import 'package:flutter/material.dart';
    
class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title});

  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<String> _titles = ['首页', '学习', '我的'];
  final List<Widget> _pages = [
    HomePage(title: '首页'),
    const StudyPage(title: '学习'),
    const MinePage(title: '我的'),
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