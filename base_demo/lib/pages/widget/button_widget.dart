import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {
  const ButtonWidget({super.key});

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ElevatedButton(onPressed: () {}, child: const Text('ElevatedButton')),
          TextButton(
            child: const Text('TextButton'),
            onPressed: () {},
          ),
          OutlinedButton(
            child: const Text('OutlinedButton'),
            onPressed: () {},
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.thumb_up)),
          ElevatedButton.icon(
            onPressed: () {},
            label: const Text('发送'),
            icon: const Icon(Icons.send),
          ),
          OutlinedButton.icon(
            onPressed: () {},
            label: const Text('电话'),
            icon: const Icon(Icons.phone),
          ),
          TextButton.icon(
            onPressed: () {},
            label: const Text('详情'),
            icon: const Icon(Icons.info),
          ),
        ],
      ),
    );
  }
}
