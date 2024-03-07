import 'package:base_demo/common/logger.dart';
import 'package:flutter/material.dart';

class ScrollControllerPage extends StatefulWidget {
  @override
  ScrollControllerPageState createState() {
    return ScrollControllerPageState();
  }
}

class ScrollControllerPageState extends State<ScrollControllerPage> {

  final ScrollController _scrollController = ScrollController();
  bool showToTopButton = false;


  @override
  void initState() {
  
    super.initState();
    _scrollController.addListener(() {

      XLogger.getLogger().d('_scrollController.offset:$_scrollController.offset');

      if(_scrollController.offset < 1000 && showToTopButton) {
        setState(() {
          showToTopButton = false;
        });
      } else if (_scrollController.offset >= 1000 && !showToTopButton) {
        setState(() {
          showToTopButton = true;
        });
      }
      
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('滚动控制')),
      body: Scrollbar(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('item:$index'),
            );
          },
          itemCount: 50,
          itemExtent: 40,
          controller: _scrollController,
        ),
      ),

      floatingActionButton: !showToTopButton ? null: FloatingActionButton(onPressed: () {
        _scrollController.animateTo(0, duration: const Duration(milliseconds: 400), curve: Curves.ease);
      }, child: const Icon(Icons.arrow_upward),
      
      ) ,
    );
  }
}
