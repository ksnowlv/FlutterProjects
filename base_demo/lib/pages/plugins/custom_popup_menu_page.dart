import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:popup_menu/popup_menu.dart';

class CustomPopupMenuPage extends StatefulWidget {
  const CustomPopupMenuPage({super.key});

  @override
  State<CustomPopupMenuPage> createState() => _CustomPopupMenuPageState();
}

class ItemModel {
  String title;
  IconData icon;

  ItemModel(this.title, this.icon);
}

class _CustomPopupMenuPageState extends State<CustomPopupMenuPage> {
  List<ItemModel> menuItems = [
    ItemModel('复制', Icons.content_copy),
    ItemModel('粘贴', Icons.content_paste),
    ItemModel('转发', Icons.send),
    ItemModel('收藏', Icons.collections),
    ItemModel('删除', Icons.delete),
    ItemModel('分享', Icons.share),
    ItemModel('搜索', Icons.search),
  ];

  final GlobalKey btnKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('CustomPopupMenu'),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomPopupMenu(
              menuBuilder: _buildSingleClickMenu,
              pressType: PressType.singleClick,
              child: Container(
                padding: const EdgeInsets.all(15),
                constraints: const BoxConstraints(
                    minWidth: 50, maxWidth: 240, minHeight: 50),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 204, 101, 225),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: const Text('测试CustomPopupMenu'),
              ),
            ),
            const SizedBox(height: 20),
            PopupMenuButton(
              shadowColor: const Color(0xff98e165),
              color: const Color(0xFF4C4C4C),
              onSelected: (value) {
                debugPrint('PopupMenuButton selected:$value');
              },
              itemBuilder: (context) => _buildPopupMenuItems(context),
              onOpened: () {
                debugPrint('PopupMenuButton onOpened');
              },
              child: const Text('测试PopupMenuButton'),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
                key: btnKey,
                onPressed: () => _showPopupMenu(context),
                child: const Text('显示popup_menu'))
          ],
        )));
  }

  Widget _buildSingleClickMenu() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Container(
        width: 220,
        color: const Color(0xFF4C4C4C),
        child: GridView.count(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          crossAxisCount: 4,
          crossAxisSpacing: 0,
          mainAxisSpacing: 10,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: menuItems
              .map((item) => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        item.icon,
                        size: 20,
                        color: Colors.white,
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 2),
                        child: Text(
                          item.title,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ],
                  ))
              .toList(),
        ),
      ),
    );
  }

  List<PopupMenuEntry<String>> _buildPopupMenuItems(BuildContext context) {
    return menuItems.map((ItemModel item) {
      return PopupMenuItem<String>(
        value: item.title,
        child: Row(
          children: <Widget>[
            Icon(
              item.icon,
              size: 20,
              color: Colors.white,
            ),
            Container(
              margin: const EdgeInsets.only(top: 2, left: 10),
              child: Text(
                item.title,
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ],
        ),
      );
    }).toList();
  }

  void _showPopupMenu(BuildContext context) {
    List<MenuItem> popupMenuItems = menuItems.map((item) {
      return MenuItem(
          title: item.title,
          image: Icon(
            item.icon,
            size: 20,
            color: Colors.white,
          ),
          textStyle: const TextStyle(color: Colors.white, fontSize: 12));
    }).toList();

    final popupMenu = PopupMenu(
      items: popupMenuItems,
      onClickMenu: (MenuItemProvider item) {
        debugPrint('Selected:${item.menuTitle}');
      },
      onDismiss: () {
        debugPrint('Menu is dismissed');
      },
      context: context,
    );
    popupMenu.show(widgetKey: btnKey);
  }
}
