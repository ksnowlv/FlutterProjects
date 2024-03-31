import 'package:flutter/material.dart';

class StatefulBuilderPage extends StatefulWidget {
  const StatefulBuilderPage({super.key});

  @override
  State<StatefulWidget> createState() => StatefulBuilderPageState();
}

class StatefulBuilderPageState extends State<StatefulWidget> {
  bool _isSelected = false;

  StatefulBuilderPageState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StatefulBuilder局部刷新'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('StatefulBuilder局部刷新,点击checkbox可以看下效果'),
            StatefulBuilder(
              builder: (context, setState) {
                return CheckboxListTile(
                  value: _isSelected,
                  onChanged: (value) {
                    setState(() {
                      _isSelected = value!;
                      debugPrint('selected = $_isSelected');
                    });
                  },
                  title: const Text('This is a checkbox'),
                  controlAffinity:
                      ListTileControlAffinity.leading, // 将控件放置在标题的左侧
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}


//示例使用StatefulBuilder包裹了一个CheckboxListTile。在 CheckboxListTile 中，我们可以更新局部的 _isSelected 状态，而无需创建新的 StatefulWidget。
//StatefulBuilder接收一个builder函数作为参数，这个builder函数会接收一个setState函数作为参数。
//在 builder 函数中，我们可以使用 setState 函数来更新局部状态。当 setState 被调用时，StatefulBuilder 会重新构建其包裹的小部件，从而实现局部刷新。

