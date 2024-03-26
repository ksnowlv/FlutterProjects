// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:base_demo/common/logger.dart';
import 'package:flutter/material.dart';

class OrderListPage extends StatelessWidget {
  const OrderListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('订单列表'),
      ),
      body: PageView(
        children: const [
          CachedPage(text: '全部'),
          CachedPage(text: '已完成'),
          CachedPage(text: '已退款'),
          CachedPage(text: '处理中')
        ],
      ),
    );
  }
}

class CachedPage extends StatefulWidget {
  final String text;

  const CachedPage({
    super.key,
    required this.text,
  });

  @override
  CachedPageState createState() => CachedPageState();
}

class CachedPageState extends State<CachedPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    XLogger.getLogger().d('CachedPageState:${widget.text}');
    super.build(context);
    return Center(
      child: Text(
        widget.text,
        style: const TextStyle(fontSize: 24),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
