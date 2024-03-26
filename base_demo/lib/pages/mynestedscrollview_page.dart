import 'package:flutter/material.dart';

class MyNestedScrollViewPage extends StatelessWidget {
  const MyNestedScrollViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200,
              floating: false,
              pinned: false,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text('NestedScrollView Demo'),
                // background: Image.asset(
                //   'images/bk.png',
                //   fit: BoxFit.cover,
                // ),

                background: Container(
                  decoration: const BoxDecoration(
                    color: Colors.blue, // 背景颜色
                  ),
                ),
              ),
            ),
          ];
        },
      body: ListView.builder(
            itemCount: 50,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                color: Colors.green,
                child: ListTile(
                  title: Text('Item $index'),
                ),
              );
            },
            //避免listView与headerSliver之间出现空白
            padding: const EdgeInsets.only(top: 0),
          ),
      ),
    );
  }
}
