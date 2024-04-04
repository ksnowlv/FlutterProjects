import 'package:base_demo/pages/widget/widget_page.dart';
import 'package:flutter/material.dart';

class BaseContainerPage extends StatefulWidget {
  final String title;
  const BaseContainerPage({super.key, required this.title});

  @override
  State<BaseContainerPage> createState() => _BaseContainerPageState();
}

class _BaseContainerPageState extends State<BaseContainerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemExtent: 60,
        itemCount: WidgetPageType.values.length,
        padding: const EdgeInsets.all(20),
        itemBuilder: (context, index) {
          final pageType = WidgetPageType.values[index];

          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  child: Text(_getPageTypeText(pageType)),
                  onPressed: () {
                    _showWidgetPage(context, pageType);
                  }
                  ),
              const SizedBox(
                height: 20,
              ),
            ],
          );
        },
      ),
    );
  }

  String _getPageTypeText(WidgetPageType pageType) {
    Map<WidgetPageType, String> titleMap = {
      WidgetPageType.text: '文本框',
      WidgetPageType.button: '按钮',
      WidgetPageType.image: '图片框及图片',
      WidgetPageType.switchCheckbox: '单选开关/复选框',
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
