import 'package:base_demo/pages/mine/task/view/task_view.dart';
import 'package:base_demo/pages/mine/task/view_models/task_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskController extends StatelessWidget {
  const TaskController({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskViewModel(),
      child: const TaskView(),
    );
  }
}
