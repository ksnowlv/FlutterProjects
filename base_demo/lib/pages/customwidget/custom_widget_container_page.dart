import 'package:base_demo/pages/customwidget/custom_widget_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomWidgetContainerPage extends StatefulWidget {
  final String title;
  const CustomWidgetContainerPage({super.key, required this.title});

  @override
  State<CustomWidgetContainerPage> createState() =>
      _CustomWidgetContainerPageState();
}

class _CustomWidgetContainerPageState extends State<CustomWidgetContainerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemExtent: 60,
        padding: const EdgeInsets.all(20),
        itemCount: CustomWidgetPageType.values.length,
        itemBuilder: (BuildContext context, int index) {
          final pageType = CustomWidgetPageType.values[index];
          return _buildListItem(pageType, context);
        },
      ),
    );
  }

  Widget _buildListItem(CustomWidgetPageType pageType, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          child: Text(_titleFromPageType(pageType)),
          onPressed: () {
            _showWidgetPage(context, pageType);
          },
        ),
      ],
    );
  }

  String _titleFromPageType(CustomWidgetPageType pageType) {
    Map<CustomWidgetPageType, String> titleMap = {
      CustomWidgetPageType.gradientButton: '自定义按钮GradientButton',
      CustomWidgetPageType.turnBox: '自定义TurnBox',
      CustomWidgetPageType.customPaint: 'CustomPaint',
      CustomWidgetPageType.gradientCircularProgressIndicator: '圆形背景渐变进度条',
      CustomWidgetPageType.customCheckbox: 'CustomCheckbox',
      CustomWidgetPageType.doneWidget: 'DoneWidget',
      CustomWidgetPageType.waterMark: '水印组件WaterMark',
    };

    return titleMap[pageType] ?? "没有该模块";
  }

  void _showWidgetPage(
      BuildContext context, CustomWidgetPageType pageType) async {
    if (!context.mounted) {
      return;
    }

    final result =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return CustomWidgetPage(
          pageType: pageType, pageTitle: _titleFromPageType(pageType));
    }));

    debugPrint('result: $result');
  }
}
