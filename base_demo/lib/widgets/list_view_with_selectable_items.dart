import 'package:flutter/material.dart';
    
class ListViewWithSelectableItems extends StatefulWidget {
  const ListViewWithSelectableItems({super.key});

  @override
  ListViewWithSelectableItemsState createState() => ListViewWithSelectableItemsState();
}

class ListViewWithSelectableItemsState extends State<ListViewWithSelectableItems> {
  int _selectedItemIndex = -1;

  List<String> items = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Container(
          color: _selectedItemIndex == index ? Colors.blue : Colors.white, // 设置选中和未选中状态的背景颜色
          child: ListTile(
            title: Text(items[index]),
            onTap: () {
              setState(() {
                _selectedItemIndex = index; // 更新选中的索引
              });
            },
          ),
        );
      },
    );
  }
}