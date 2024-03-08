import 'package:flutter/material.dart';
    
class MainTabBarView extends StatelessWidget {

  const MainTabBarView({ super.key });
  
  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 4,
     child:      Scaffold(
      appBar: AppBar(
        title: const Text('flutter app'),
        bottom: const TabBar(
          tabs: [
            Tab(text: '首页',),
            Tab(text: '通讯录',) ,
            Tab(text: '发现',),
            Tab(text: '我的',)
          ],
        ),
      ),
      body: const TabBarView(
        children: [
          HomeTab(), 
          ContactsTab(), 
          DiscoverTab(),
          MineTab(), 

        ],
      ),
    ));
  }

}

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('首页'),
    );
  }
}

class ContactsTab extends StatelessWidget {
  const ContactsTab({super.key});


  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('通讯录'),
    );
  }
}

class DiscoverTab extends StatelessWidget {
  const DiscoverTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('发现'),
    );
  }
}

class MineTab extends StatelessWidget {
  const MineTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('我的'),
    );
  }
}
