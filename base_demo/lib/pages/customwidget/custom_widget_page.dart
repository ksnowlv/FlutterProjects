import 'package:base_demo/pages/customwidget/gradient_button_route.dart';
import 'package:base_demo/pages/customwidget/gradient_circular_progress_route.dart';
import 'package:base_demo/pages/functional/color_theme_widget.dart';
import 'package:base_demo/pages/functional/future_stream_builder_widget.dart';
import 'package:base_demo/pages/functional/shared_data_widget.dart';
import 'package:base_demo/pages/functional/state_shared_widget.dart';
import 'package:base_demo/pages/mine/value_listenable_builder_page.dart';
import 'package:flutter/material.dart';


enum CustomWidgetPageType {
  gradientButton, // 自定义按钮GradientButton
  turnBox, //自定义TurnBox
  customPaint, //CustomPaint
  customCheckbox, //CustomCheckbox
  gradientCircularProgressIndicator,//圆形背景渐变进度条
  doneWidget, //DoneWidget
  waterMark, //水印组件WaterMark
}

class  CustomWidgetPage extends StatefulWidget {

  final CustomWidgetPageType pageType;
  final String pageTitle;

  const  CustomWidgetPage({super.key, required this.pageType, required this.pageTitle});

  @override
  State<CustomWidgetPage> createState() => _CustomWidgetPageState();
}

class _CustomWidgetPageState extends State<CustomWidgetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pageTitle),
      ),
      body: Center(child: _widgetFromType(widget.pageType),),
    );
  }

    Widget _widgetFromType(CustomWidgetPageType pageType) {
    switch (pageType) {
      case CustomWidgetPageType.gradientButton:
        return const GradientButtonRoute();
      case CustomWidgetPageType.turnBox:
        return const InheritedContainerWidget();
      case CustomWidgetPageType.customPaint:
        return const StateSharedWidget(); 
      case CustomWidgetPageType.gradientCircularProgressIndicator:
      return const GradientCircularProgressRoute(); 

      case CustomWidgetPageType.customCheckbox:
        return const ColorThemeWidget();
      case CustomWidgetPageType.doneWidget:
        return const ValueListenableBuilderPage();

      case CustomWidgetPageType.waterMark:
        return const FutureStreamBuilderWidget();
      default:
        return Text('没有该模块:$pageType');
    }
  }
}