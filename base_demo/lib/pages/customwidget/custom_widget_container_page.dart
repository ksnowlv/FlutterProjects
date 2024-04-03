import 'package:base_demo/pages/customwidget/custom_widget_page.dart';
import 'package:flutter/material.dart';

class CustomWidgetContainerPage extends StatefulWidget {
  const CustomWidgetContainerPage({super.key});

  @override
  State<CustomWidgetContainerPage> createState() => _CustomWidgetContainerPageState();
}

class _CustomWidgetContainerPageState extends State<CustomWidgetContainerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('自定义组件'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: CustomWidgetPageType.values
            .map<Widget>((pageType) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        child: Text(_titleFromPageType(pageType)),
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


  String _titleFromPageType(CustomWidgetPageType pageType) {
    Map<CustomWidgetPageType, String> titleMap = {
      CustomWidgetPageType.gradientButton: '自定义按钮GradientButton',
      CustomWidgetPageType.turnBox: '自定义TurnBox',
      CustomWidgetPageType.customPaint: 'CustomPaint',
      CustomWidgetPageType.customCheckbox: 'CustomCheckbox',
      CustomWidgetPageType.doneWidget: 'DoneWidget',
      CustomWidgetPageType.waterMark: '水印组件WaterMark',
    };

    return titleMap[pageType] ?? "没有该模块";
  }

  void _showWidgetPage(BuildContext context, CustomWidgetPageType pageType) async {
    if (!context.mounted) {
      return;
    }

    final result = 
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
        
      return CustomWidgetPage(
          pageType: pageType, pageTitle: _titleFromPageType(pageType));
    }
    ));

    debugPrint('result: $result');
  }
}
