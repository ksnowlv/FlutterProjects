import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BoxConstraintsDemoWidget extends StatelessWidget {
  const BoxConstraintsDemoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: 300,
            height: 20,
            child: Text('使用SizedBox部件定义特定大小的部件', style: TextStyle(color: Colors.green))
          ),

          const SizedBox(height: 10,),

          const Text('使用 ConstrainedBox 部件强制施加特定约束'),
          ConstrainedBox(constraints: const BoxConstraints(
            minWidth: 100,
            maxWidth: 150,
            minHeight: 30,
            maxHeight: 50,
            ),

            child: ElevatedButton(
              child: const Text('where are you going?'),
              onPressed: () {

              },

              ),
          ),

          Container(height: 10,),
          const Text('使用 Container 部件对子部件应用具体的约束条件'),
          Container(
            constraints: const BoxConstraints(
              minWidth: 100,
              maxWidth: 150,
              minHeight: 30,
              maxHeight: 50,
            ),

            child: ElevatedButton(
              onPressed: () {

              },

              child:  const Text('Container 约束条件'),
            ),
          ),

          Container(
            height: 10,
          ),

          const Text('使用 FractionallySizedBox 部件按比例指定大小'),

          SizedBox(
            width: 400,
            height: 100,

            child: FractionallySizedBox(
              widthFactor: 0.5,
              heightFactor: 0.5,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('你去哪里了？我去上学了'),
              ),
            ),
          ),

          const Text('使用LayoutBuilder可以根据父部件的约束条件来构建部件'),

          LayoutBuilder(builder: (context, constraints) {
            return const LayoutBuilderCustomWidget(200, 100);
          },
          ),
        ],
      ),
    );
  }
}

class LayoutBuilderCustomWidget extends StatelessWidget {
  final double maxWidth;
  final double maxHeight;

  const LayoutBuilderCustomWidget(this.maxWidth, this.maxHeight, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: maxWidth , // 使用maxWidth的80%
      height: maxHeight, // 使用maxHeight的50%
      color: Colors.blue,
      child: const Center(
        child: Text(
          'Custom Widget using maxWidth and maxHeight',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
