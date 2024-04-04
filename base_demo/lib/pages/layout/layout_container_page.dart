import 'package:base_demo/pages/layout/layout_page.dart';
import 'package:flutter/material.dart';

class LayoutContainerPage extends StatefulWidget {
  final String title;
  const LayoutContainerPage({super.key, required this.title});

  @override
  State<LayoutContainerPage> createState() => _LayoutContainerPageState();
}

class _LayoutContainerPageState extends State<LayoutContainerPage> {
  final Map<LayoutPageType, String> _titleMap = {
    LayoutPageType.constraintLayout: '约束布局',
    LayoutPageType.linearLayout: '线性布局',
    LayoutPageType.flexibleLayout: '弹性布局',
    LayoutPageType.flowLayout: '流式布局',
    LayoutPageType.stackLayout: '层叠布局',
    LayoutPageType.alignRelativeLayout: '对齐相对布局',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView.builder(
          itemExtent: 60,
          padding: const EdgeInsets.all(20.0),
          itemCount: LayoutPageType.values.length ,
          itemBuilder: (BuildContext context, int index) { 
            final pageType = LayoutPageType.values[index];
            return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => _showLayoutPage(context, pageType),
                      child: Text(
                        _getPageTypeText(pageType),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                );

           },
          
              
             
        ),
      ),
    );
  }

  String _getPageTypeText(LayoutPageType pageType) {
    return _titleMap[pageType] ?? "没有该布局";
  }

  void _showLayoutPage(BuildContext context, LayoutPageType pageType) async {
    if (!context.mounted) {
      return;
    }

    final result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => LayoutPage(
                  pageType: pageType,
                  pageTitle: _getPageTypeText(pageType),
                )));

    debugPrint('result: $result');
  }
}
