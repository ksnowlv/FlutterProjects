import 'package:base_demo/pages/layout/align_widget.dart';
import 'package:base_demo/pages/layout/box_constraints_demo_widget.dart';
import 'package:base_demo/pages/layout/flex_widget.dart';
import 'package:base_demo/pages/layout/row_column_widget.dart';
import 'package:base_demo/pages/layout/stack_positioned_widget.dart';
import 'package:base_demo/pages/layout/wrap_flow_widget.dart';
import 'package:flutter/material.dart';

// 声明一个枚举类型
enum LayoutPageType {
  constraintLayout, //约束布局
  linearLayout, //线性布局
  flexibleLayout, //弹性布局
  flowLayout, //流式布局
  stackLayout, //层叠布局
  alignRelativeLayout, //对齐相对布局
}

class LayoutPage extends StatefulWidget {
  final LayoutPageType pageType;
  final String pageTitle;
  const LayoutPage({super.key, required this.pageType, required this.pageTitle});

  @override
  State<LayoutPage> createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pageTitle),
      ),
      body: Center(
        child: _widgetFromType(widget.pageType),
      ),
    );
  }

  Widget _widgetFromType(LayoutPageType pageType) {
    switch (pageType) {
      case LayoutPageType.constraintLayout:
        return const BoxConstraintsDemoWidget();

      case LayoutPageType.linearLayout:
        return const RowColumnWidget();

      case LayoutPageType.flexibleLayout:
        return const FlexWidget();

      case LayoutPageType.flowLayout:
        return const WrapFlowWidget();

      case LayoutPageType.stackLayout:
        return const StackPositionedWidget();

      case LayoutPageType.alignRelativeLayout:
        return const AlignWidget();

      default:
        return const Text('没有该页面');
    }
  }
}
