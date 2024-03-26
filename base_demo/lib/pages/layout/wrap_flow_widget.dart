import 'package:flutter/material.dart';

class WrapFlowWidget extends StatelessWidget {
  const WrapFlowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Wrap(
          spacing: 10.0, // 主轴(水平)方向间距
          runSpacing: 20.0, // 纵轴（垂直）方向间距
          alignment: WrapAlignment.start, //沿主轴方向居中
          children: <Widget>[
            ElevatedButton(
              onPressed: () {},
              child: const Text("测试按钮1"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("测试按钮2"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("测试按钮3"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("测试按钮4"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("测试按钮5"),
            ),
          ],
        ),
        // Container(
        //   width: 300,
        //   height: 300,
        //   color: Colors.grey[200],
        //   child: const CustomFlowWidget(), // 嵌入自定义的Flow布局控件
        // ),

        Flow(
          delegate: MyFlowDelegate(
              margin: const EdgeInsets.all(
            10,
          )),
          children: [
            Container(
              width: 100,
              height: 60,
              color: Colors.red,
            ),
            Container(
              width: 100,
              height: 60,
              color: Colors.blue,
            ),
            Container(
              width: 100,
              height: 60,
              color: Colors.green,
            ),
            Container(
              width: 150,
              height: 60,
              color: Colors.purple,
            ),
            Container(
              width: 150,
              height: 60,
              color: Colors.black,
            ),
            Container(
              width: 150,
              height: 70,
              color: Colors.orange,
            ),
            Container(
              width: 50,
              height: 60,
              color: Colors.blueGrey,
            ),
            Container(
              width: 50,
              height: 60,
              color: Colors.greenAccent,
            ),
            Container(
              width: 50,
              height: 60,
              color: Colors.redAccent,
            ),
            Container(
              width: 50,
              height: 60,
              color: Colors.cyan,
            ),
          ],
        ),
      ],
    );
  }
}

class MyFlowDelegate extends FlowDelegate {
  double width = 0;
  double height = 0;
  EdgeInsets margin;

  MyFlowDelegate({this.margin = EdgeInsets.zero});

  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    //计算每一个子widget的位置
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i)!.width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i)!.height + margin.top + margin.bottom;
        //绘制子widget(有优化)
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x += context.getChildSize(i)!.width + margin.left + margin.right;
      }
    }
  }

  @override
  Size getSize(BoxConstraints constraints) {
    // 指定Flow的大小，简单起见我们让宽度尽可能大，但高度指定为200，
    // 实际开发中我们需要根据子元素所占用的具体宽高来设置Flow大小
    return const Size(double.infinity, 380.0);
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) {
    return true;
  }
}
