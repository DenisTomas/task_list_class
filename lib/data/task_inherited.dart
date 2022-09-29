import 'package:aula_projeto_inicial/components/task.dart';
import 'package:flutter/material.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final List<Task> taskList = [
    Task('Learn Flutter',
        'assets/images/st,small,507x507-pad,600x600,f8f8f8.jpg', 5),
    Task('Play Bass', 'assets/images/new_bass_comp.jpg', 5),
    Task('Clean the House', 'assets/images/shutterstock_557357668.webp', 3),
    Task('Cook Lunch', 'assets/images/chef-cooking-dinner-at-table-in-kitchen-vector-32060450.jpg', 2),
    Task('Sleep', 'assets/images/283fb478-5554-44aa-b37f-7917a90f38d7.jpg', 4),
  ];

  void newTask(String name, String photo, int difficulty) {
    taskList.add(Task(name, photo, difficulty),);
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaksInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
