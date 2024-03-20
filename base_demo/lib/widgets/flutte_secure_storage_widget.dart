import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class FlutteSecureStorageWidget extends StatefulWidget {
  const FlutteSecureStorageWidget({super.key});

  @override
  FlutteSecureStorageWidgetState createState() =>
      FlutteSecureStorageWidgetState();
}

class FlutteSecureStorageWidgetState extends State<FlutteSecureStorageWidget> {
  final storage = const FlutterSecureStorage();

  String _phone = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: () async {
              await storage.write(key: 'phone', value: '15210795183');
            },
            child: const Text('save')),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
            onPressed: () async {
              String phone = await storage.read(key: 'phone') ?? '';
              setState(() {
                _phone = phone;
                debugPrint('读取到的phone：$_phone');
              });
            },
            child: const Text('read')),
        const SizedBox(
          height: 20,
        ),
        Text('phone:$_phone'),
      ],
    );
  }
}
