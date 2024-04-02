import 'package:flutter/material.dart';

class PopScopWidget extends StatefulWidget {
  const PopScopWidget({super.key});

  @override
  State<PopScopWidget> createState() => _PopScopWidgetState();
}

class _PopScopWidgetState extends State<PopScopWidget> {
  DateTime? _lastPressedTime;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (didPop) {
          return;
        }
        _exitCurPage();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('1秒内连续按两次返回键退出'),
          ElevatedButton(
              onPressed: () {
                _exitCurPage();
              },
              child: const Text('1秒内连续按两次返回键退出'))
        ],
      ),
    );
  }

  void _exitCurPage() {
    if (_lastPressedTime == null ||
        DateTime.now().difference(_lastPressedTime!) >
            const Duration(seconds: 1)) {
      //两次点击间隔超过1秒则重新计时
      _lastPressedTime = DateTime.now();
      return;
    }

    Navigator.of(context).pop();
  }
}
