import 'package:base_demo/pages/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetxWidget extends StatefulWidget {
  const GetxWidget({super.key});

  @override
  GetxWidgetState createState() => GetxWidgetState();
}

class GetxWidgetState extends State<GetxWidget> {
  final CounterController counterController = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Obx(() => Text('点击了${counterController.counter.value}次')),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
            onPressed: () {
              counterController.increment();
            },
            child: const Text('+')),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
            onPressed: () {
              counterController.decrement();
            },
            child: const Text('+')
            ),

            ElevatedButton(onPressed: () {

              Get.to(() => const DetailPage(data: 'getx widget'), arguments: '参数传递');

            }, child: const Text('跳转详情页面'))
      ],
    );
  }
}

// 控制器类，用于管理计数器状态
class CounterController extends GetxController {
  var counter = 0.obs; // 通过obs将变量变为响应式变量

  void increment() {
    counter.value++; // 使用.value来访问obs变量的值
  }

  void decrement() {
    counter.value--; // 使用.value来访问obs变量的值
  }
}
