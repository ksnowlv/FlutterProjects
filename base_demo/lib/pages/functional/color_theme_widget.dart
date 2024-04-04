import 'package:base_demo/common/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ColorThemeWidget extends StatefulWidget {
  const ColorThemeWidget({super.key});

  @override
  State<ColorThemeWidget> createState() => _ColorThemeWidgetState();
}

class _ColorThemeWidgetState extends State<ColorThemeWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text(
          'color',
          style: TextStyle(color: Color(0xFFFF00FF)),
        ),
        const Text('color', style: TextStyle(color: Color(0xFF00FF00))),
        const SizedBox(
          height: 20,
        ),
        Container(
          constraints: const BoxConstraints(
            minHeight: 50,
            minWidth: double.infinity,
          ),
          decoration: const BoxDecoration(
            color: Colors.blue,
            boxShadow: [
              //阴影
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 3),
                blurRadius: 3,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
            onPressed: () {
              Provider.of<ThemeManager>(context, listen: false).switchTheme();
            },
            child: const Text('切换主题'))
      ],
    ));
  }
}
