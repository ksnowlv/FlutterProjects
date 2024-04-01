import 'package:flutter/material.dart';

class AnimatedListWidget extends StatefulWidget {
  const AnimatedListWidget({super.key});

  @override
  AnimatedListWidgetState createState() => AnimatedListWidgetState();
}

class AnimatedListWidgetState extends State<AnimatedListWidget> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final List<String> _listItems = ['Item 1', 'Item 2', 'Item 3']; // 初始列表项

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedList(
          key: _listKey,
          initialItemCount: _listItems.length,
          itemBuilder: (context, index, animation) {
            return _buildItem(_listItems[index], animation, index);
          },
        ),
        _buildAddBtn(),
      ],
    );
  }

  // 创建一个 “+” 按钮，点击后会向列表中插入一项
  Widget _buildAddBtn() {
    return Positioned(
      bottom: 30,
      right: 20,
      child: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          // 添加一个列表项
          var index = _listItems.length + 1;
          _listItems.add('item $index');
          // 告诉列表项有新添加的列表项
          _listKey.currentState!.insertItem(_listItems.length - 1);
        },
      ),
    );
  }

  Widget _buildItem(String item, Animation<double> animation, int index) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(-1, 0),
        end: Offset.zero,
      ).animate(animation),
      child: ListTile(
        title: Text(item),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            _removeItem(index);
          },
        ),
      ),
    );
  }

  void _removeItem(int index) {
    final removedItem = _listItems.removeAt(index);
    _listKey.currentState!.removeItem(
      index,
      (context, animation) {
        return _buildItem(removedItem, animation, index);
      },
    );
  }
}
