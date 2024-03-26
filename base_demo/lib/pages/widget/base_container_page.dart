import 'package:base_demo/pages/widget/widget_page.dart';
import 'package:flutter/material.dart';

class BaseContainerPage extends StatefulWidget {
  const BaseContainerPage({super.key});

  @override
  State<BaseContainerPage> createState() => _BaseContainerPageState();
}

class _BaseContainerPageState extends State<BaseContainerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: WidgetPageType.values
            .map<Widget>((pageType) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        child: Text(_getPageTypeText(pageType)),
                        onPressed: () {
                          _showWidgetPage(context, pageType);
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ))
            .toList(),
      ),
    );
  }

  String _getPageTypeText(WidgetPageType pageType) {
    Map<WidgetPageType, String> titleMap = {
      WidgetPageType.text: '文本框',
      WidgetPageType.button: '按钮',
      WidgetPageType.image: '图片框及图片',
      WidgetPageType.switchSelect: '单选开关',
      WidgetPageType.checkbox: '复选框',
      WidgetPageType.textField: '输入控件',
      WidgetPageType.progressIndicator: '进度指示器',
    };

    return titleMap[pageType] ?? "没有该布局";
  }

  void _showWidgetPage(BuildContext context, WidgetPageType pageType) async {
    if (!context.mounted) {
      return;
    }

    final result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => WidgetPage(
                  pageType: pageType,
                  pageTitle: _getPageTypeText(pageType),
                )));

    debugPrint('result: $result');
  }
}
