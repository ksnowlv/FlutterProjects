import 'package:flutter/material.dart';

class FutureWidget extends StatefulWidget {
  const FutureWidget({super.key});

  @override
  FutureWidgetState createState() => FutureWidgetState();
}

class FutureWidgetState extends State<FutureWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: () {
              _fetchLocalData().then((value) {
                debugPrint('获取到的数据：$value');
              }).catchError((error) {
                debugPrint('发生错误：$error');
              });
            },
            child: const Text('Future处理')),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
            onPressed: () async {
              try {
                var f = await _fetchNetData();
                debugPrint('获取到的数据：$f');
              } catch (e) {
                debugPrint(e as String?);
              }
            },
            child: const Text('async/await处理')),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
            onPressed: () async {
              var f = await _fetchData();
              debugPrint('获取到的数据：$f');
            },
            child: const Text('异常处理')),
      ],
    );
  }

  Future<int> _fetchLocalData() {
    return Future.delayed(const Duration(seconds: 1), () {
      // 耗时操作
      return 100;
    });
  }

  Future<int> _fetchNetData() async {
    await Future.delayed(const Duration(seconds: 2));
    // 耗时操作
    return 101;
  }

  Future<int> _fetchData() async {
    try {
      // 耗时操作
      await Future.delayed(const Duration(seconds: 1));
      return 102;
    } catch (error) {
      debugPrint('发生错误：$error');
      return -1;
    }
  }
}
