import 'package:base_demo/common/hive_manage.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HiveWidget extends StatefulWidget {
  const HiveWidget({super.key});

  @override
  HiveWidgetState createState() => HiveWidgetState();
}

class HiveWidgetState extends State<HiveWidget> {
  String _name = '';
  int _age = 0;


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("name:$_name, age: $_age"),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
            onPressed: () {

              setState(() {
                _name = 'ksnowlv';
                _age = 10;
              });

              var box = HiveManage.getBox();
              box.put('name', _name);
              box.put('age', _age);
              debugPrint('hive write name: $_name, age: $_age');
            },
            child: const Text('save')),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
            onPressed: () {
              var box = HiveManage.getBox();

              setState(() {
                _name = box.get('name');
                _age = box.get('age');

                debugPrint('hive read: name: $_name, age: $_age');
              });
            },
            child: const Text('read')),
        const SizedBox(
          height: 20,
        ),
        const Text('网络json文件播放Lottie动画示例'),
        SizedBox(
          width: 300, // 替换为适当的宽度
          height: 200, // 替换为适当的高度
          child: Lottie.network(
              'https://lottie.host/818be078-1686-4e92-b663-251c4d97e4c0/qNnbLZil3p.json'),
        ),
        const Text('本地json文件播放Lottie动画示例'),
        SizedBox(
          width: 300, // 替换为适当的宽度
          height: 200, // 替换为适当的高度
          child: Lottie.asset('lottiefile/animation - 1710978871330.json',
              onLoaded: (composition) {
                debugPrint('composition:${composition.duration}');
              }),
        )
      ],
    ));
  }
}
