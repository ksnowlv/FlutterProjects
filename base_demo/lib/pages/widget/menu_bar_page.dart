import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:menu_bar/menu_bar.dart';
    
class MenuBarPage extends StatefulWidget {
  const MenuBarPage({super.key});

  @override
  State<MenuBarPage> createState() => _MenuBarPageState();
}

class _MenuBarPageState extends State<MenuBarPage> {

  List<BarButton> _menuBarButtons() {
    return [
      BarButton(
        text: const Text(
          '文件',
          style: TextStyle(color: Colors.white),
        ),
        submenu: SubMenu(
          menuItems: [
            MenuButton(
              onTap: () => debugPrint('Save'),
              text: const Text('保存'),
              shortcutText: 'Ctrl+S',
              shortcut:
                  const SingleActivator(LogicalKeyboardKey.keyS, control: true),
            ),
            MenuButton(
              onTap: () {},
              text: const Text('保存为'),
              shortcutText: 'Ctrl+Shift+S',
            ),
            const MenuDivider(),
            MenuButton(
              onTap: () {},
              text: const Text('打开 文件'),
            ),
            MenuButton(
              onTap: () {},
              text: const Text('打开 文件夹'),
            ),
            const MenuDivider(),
            MenuButton(
              text: const Text('偏好设置'),
              icon: const Icon(Icons.settings),
              submenu: SubMenu(
                menuItems: [
                  MenuButton(
                    onTap: () {},
                    icon: const Icon(Icons.keyboard),
                    text: const Text('快捷键'),
                  ),
                  const MenuDivider(),
                  MenuButton(
                    onTap: () {},
                    icon: const Icon(Icons.extension),
                    text: const Text('扩展'),
                  ),
                  const MenuDivider(),
                  MenuButton(
                    icon: const Icon(Icons.looks),
                    text: const Text('更换主题'),
                    submenu: SubMenu(
                      menuItems: [
                        MenuButton(
                          onTap: () {},
                          icon: const Icon(Icons.light_mode),
                          text: const Text('浅色 主题'),
                        ),
                        const MenuDivider(),
                        MenuButton(
                          onTap: () {},
                          icon: const Icon(Icons.dark_mode),
                          text: const Text('深色 主题'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const MenuDivider(),
            MenuButton(
              onTap: () {},
              shortcutText: 'Ctrl+Q',
              text: const Text('退出'),
              icon: const Icon(Icons.exit_to_app),
            ),
          ],
        ),
      ),
      BarButton(
        text: const Text(
          '编辑',
          style: TextStyle(color: Colors.white),
        ),
        submenu: SubMenu(
          menuItems: [
            MenuButton(
              onTap: () {},
              text: const Text('撤销'),
              shortcutText: 'Ctrl+Z',
            ),
            MenuButton(
              onTap: () {},
              text: const Text('重做'),
              shortcutText: 'Ctrl+Y',
            ),
            const MenuDivider(),
            MenuButton(
              onTap: () {},
              text: const Text('剪贴'),
              shortcutText: 'Ctrl+X',
            ),
            MenuButton(
              onTap: () {},
              text: const Text('复制'),
              shortcutText: 'Ctrl+C',
            ),
            MenuButton(
              onTap: () {},
              text: const Text('粘贴'),
              shortcutText: 'Ctrl+V',
            ),
            const MenuDivider(),
            MenuButton(
              onTap: () {},
              text: const Text('查找'),
              shortcutText: 'Ctrl+F',
            ),
          ],
        ),
      ),
      BarButton(
        text: const Text(
          '帮助',
          style: TextStyle(color: Colors.white),
        ),
        submenu: SubMenu(
          menuItems: [
            MenuButton(
              onTap: () {},
              text: const Text('检查 版本更新'),
            ),
            const MenuDivider(),
            MenuButton(
              onTap: () {},
              text: const Text('查看 许可'),
            ),
            const MenuDivider(),
            MenuButton(
              onTap: () {},
              icon: const Icon(Icons.info),
              text: const Text('关于'),
            ),
          ],
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MenuBarWidget(
        barButtons: _menuBarButtons(), 

        enabled: true,//开启菜单
        barStyle: const MenuStyle(
          padding: MaterialStatePropertyAll(EdgeInsets.zero),
          backgroundColor: MaterialStatePropertyAll(Color(0xFF6b2b6b)),
          maximumSize: MaterialStatePropertyAll(Size(double.infinity, 38.0)),
        ),

            // Style the menu bar buttons. Hover over [ButtonStyle] for all the options
        barButtonStyle:  ButtonStyle(
          padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 6.0)),
          minimumSize: const MaterialStatePropertyAll(Size(0.0, 32.0)),
          textStyle: MaterialStateTextStyle.resolveWith((states) =>  const TextStyle(fontSize:20.0), )
        ),

        // Style the menu and submenu buttons. Hover over [ButtonStyle] for all the options
        menuButtonStyle:  ButtonStyle(
          minimumSize: const MaterialStatePropertyAll(Size.fromHeight(36.0)),
          padding: const MaterialStatePropertyAll(
              EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0)),
          textStyle: MaterialStateTextStyle.resolveWith((states) =>  const TextStyle(fontSize:18.0), )
        ),

        child: Scaffold(
          appBar: AppBar(
            title: const Text('菜单栏示例'),
          ),
        ),
        ),
    );
  }
}