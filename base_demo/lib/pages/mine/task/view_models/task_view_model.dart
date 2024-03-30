
import 'package:base_demo/pages/mine/task/model/task.dart';

import 'package:flutter/material.dart';

class TaskViewModel  extends ChangeNotifier {
  final List<Task> _tasks = [];
  List<Task> get tasks => _tasks;

  void addTask(String title) {

    _tasks.add(Task('$title ${_tasks.length} ', false));
    notifyListeners();
  }

  void toggleTaskCompletion(int index) {
    if(index < 0 || index >= _tasks.length ) {
      return;
    }

    //_tasks[index] = Task(_tasks[index].title, !_tasks[index].isCompleted);
    _tasks[index].isCompleted = !_tasks[index].isCompleted;

    debugPrint('tasks $_tasks');
    notifyListeners();
  }
  


}