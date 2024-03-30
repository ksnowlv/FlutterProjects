import 'package:base_demo/pages/mine/task/model/task.dart';
import 'package:base_demo/pages/mine/task/view_models/task_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskView extends StatelessWidget {
  const TaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('tasks'),
      ),
      body: Consumer<TaskViewModel>(
        builder: (context, taskViewModel, child) {
          return ListView.builder(
            itemCount: taskViewModel.tasks.length,
            itemBuilder: (context, index) {
              Task task = taskViewModel.tasks[index];
              return ListTile(
                title: Text(task.title),
                leading: Checkbox(
                  value: task.isCompleted,
                  onChanged: (value) {
                    taskViewModel.toggleTaskCompletion(index);
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<TaskViewModel>(context, listen: false)
              .addTask('New Task');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
