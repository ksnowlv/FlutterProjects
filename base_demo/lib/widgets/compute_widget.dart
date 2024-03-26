import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ComputeWidget extends StatefulWidget {
  const ComputeWidget({super.key});

  @override
  ComputeWidgetState createState() => ComputeWidgetState();
}

class ComputeWidgetState extends State<ComputeWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            
            onPressed: () async {
               DateTime startTime = DateTime.now();
               int res = await compute(sumResult, 100000);
              Duration timeDifference = DateTime.now().difference(startTime);
              debugPrint('使用单个计算函数 1~100000 total:$res, timecost:$timeDifference');
            },
            child: const Text('compute函数:使用单个计算函数')),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
            onPressed: () async {
              DateTime startTime = DateTime.now();
              int res = await compute((final int n) {
                int sum = 0;
                for (int i = 0; i < n; ++i) {
                  sum += i;
                }
                return sum;
              }, 100000);
              Duration timeDifference = DateTime.now().difference(startTime);

              debugPrint('使用闭包形式传递参数 1~100000 total:$res  timecost:$timeDifference');
            },
            child: const Text('compute函数:使用闭包形式传递参数')),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
            onPressed: () async {
              DateTime startTime = DateTime.now();
              int res = await parallelCompute();
              Duration timeDifference = DateTime.now().difference(startTime);
              debugPrint('使用compute进行并行计算 1~100000 total:$res timecost:$timeDifference');
            },
            child: const Text('compute函数:使用compute进行并行计算')),
      ],
    );
  }

  Future<int> parallelCompute() async {
    final results = await Future.wait([
      compute(sumResult, 30000),
      compute(sumResult, 30000),
      compute(sumResult, 30000),
      compute(sumResult, 10000),
    ]);

    int sum = 0;
    for (var result in results) {
      sum += result;
    }

    return sum;
  }
}

int sumResult(final int n) {
  int sum = 0;
  for (int i = 0; i < n; ++i) {
    sum += i;
  }
  return sum;
}
