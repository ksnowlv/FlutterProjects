import 'package:base_demo/pages/widget/button_widget.dart';
import 'package:base_demo/pages/widget/image_widget.dart';
import 'package:base_demo/pages/widget/switch_checkBox_widget.dart';
import 'package:base_demo/pages/widget/text_widget.dart';
import 'package:flutter/material.dart';
    

enum WidgetPageType {
  text, //文本框
  button, //按钮
  image, //图片框及图片
  switchCheckbox, //单选开关,复选框
  textField, //输入控件
  progressIndicator,//进度指示器
}

class WidgetPage extends StatefulWidget {

  final WidgetPageType pageType;
  final String pageTitle;

  const WidgetPage({super.key, required this.pageType, required this.pageTitle});

  @override
  State<WidgetPage> createState() => _WidgetPageState();
}

class _WidgetPageState extends State<WidgetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pageTitle),
      ),
      body: Center(child: _widgetFromType(widget.pageType),),
    );
  }

    Widget? _widgetFromType(WidgetPageType pageType) {
    switch (pageType) {
      case WidgetPageType.text:
        return  const TextWidget();

      case WidgetPageType.button:
        return const ButtonWidget();

      case WidgetPageType.image:
        return const ImageWidget();

      case WidgetPageType.switchCheckbox:
        return  const SwitchCheckBoxWidget();

      case WidgetPageType.textField:
        return null;

      default:
        return const Text('没有该页面');
    }
  }
}