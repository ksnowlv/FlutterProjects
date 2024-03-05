import 'package:base_demo/widgets/detail_page.dart';
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

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('This is Page one111'),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DetailPage(
                            data: 'Hello from PageOne',
                          )));
            },
            child: const Text('go go detail page'),
          ),
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
      child: Text('This is Page two'),
    );
  }
}

class PageMine extends StatelessWidget {
  const PageMine({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('This is Page three'),
    );
  }
}
