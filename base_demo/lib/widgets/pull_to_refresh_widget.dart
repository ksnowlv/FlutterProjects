import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PullToRefreshWidget extends StatefulWidget {
  const PullToRefreshWidget({super.key});

  @override
  PullToRefreshWidgetState createState() => PullToRefreshWidgetState();
}

class PullToRefreshWidgetState extends State<PullToRefreshWidget> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  List<String> _items = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"];
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('支持下拉的列表'),
      ),
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: const WaterDropHeader(
          complete: Text(
            '刷新完成',
            style: TextStyle(color: Colors.blue),
          ),
          failed: Text(
            '刷新失败',
            style: TextStyle(color: Colors.red),
          ),
        ),
        footer: CustomFooter(
          builder: (context, mode) {
            Widget body;

            if (mode == LoadStatus.idle) {
              body = const Text('卡拉刷新');
            } else if (mode == LoadStatus.loading) {
              body = const CupertinoActivityIndicator();
            } else if (mode == LoadStatus.failed) {
              body = const Text('加载失败，请重试');
            } else if (mode == LoadStatus.canLoading) {
              body = const Text('释放加载更多');
            } else {
              body = const Text('没有更多数据了');
            }
            debugPrint('mode:$mode');

            return SizedBox(
              height: 40,
              child: Center(
                child: body,
              ),
            );
          },
        ),
        controller: _refreshController,
        onRefresh: _onRefresh, // 下拉刷新
        onLoading: _onLoading, // 上拉加载更多
        child: ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(title: Text('列表项 显示内容:${_items[index]} '));
            },
            itemCount: _items.length),
      ),
    );
  }

  void _onRefresh() async {
    await Future.delayed(const Duration(milliseconds: 500));

    _items.clear();

    for (int i = 0; i < 10; i++) {
      _items.add('${i + 1}');
    }

    ++_count;

    if (mounted) setState(() {});

    if (_count > 3) {
      _refreshController.refreshFailed();
      _count = 0;
    } else {
      _refreshController.refreshCompleted();
    }
  }

  void _onLoading() async {
    await Future.delayed(const Duration(milliseconds: 500));

    int count = _items.length + 1;

    for (int i = 0; i < 10; i++) {
      _items.add('${i + count}');
    }

    if (mounted) setState(() {});

    _refreshController.loadComplete();
  }
}
