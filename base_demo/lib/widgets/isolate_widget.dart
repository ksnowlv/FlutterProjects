import 'package:flutter/material.dart';
import 'dart:isolate';

class IsolateWidget extends StatefulWidget {
  const IsolateWidget({super.key});

  @override
  IsolateWidgetState createState() => IsolateWidgetState();
}

class IsolateWidgetState extends State<IsolateWidget> {
  late ReceivePort _receivePort;
  String _message = '';
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    initIsolate();
  }

  @override
  void dispose() {
    super.dispose();
    _receivePort.close();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('message: $_message'),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(onPressed: () {

            setState(() {
              _counter++;
            });

           _receivePort.sendPort.send('Hello from main:$_counter');
        }, child: const Text('Isolate使用')),
      ],
    );
  }

  void initIsolate() async {
    // 创建接收端口
    _receivePort = ReceivePort();
    // 将接收端口的发送端口发送到Isolate
    // 监听来自Isolate的消息
    SendPort sendPort = _receivePort.sendPort;
    Isolate isolate = await Isolate.spawn(entryPoint, sendPort);
    _receivePort.listen((message) {
      debugPrint('Message from isolate: $message');
      if (message is String) {
        setState(() {
          // 更新UI
           _message = message;
        });
      }
    });
  }
}

void entryPoint(SendPort sendPort) {
  // 在这里执行耗时任务
  String result = 'Result of time-consuming task';
  sendPort.send(result);
}
