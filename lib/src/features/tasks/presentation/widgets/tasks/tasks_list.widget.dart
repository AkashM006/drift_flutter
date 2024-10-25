import 'package:drift_flutter/src/features/tasks/domain/entity/task.entity.dart';
import 'package:flutter/material.dart';

class TasksListWidget extends StatelessWidget {
  const TasksListWidget({
    super.key,
    required this.taskList,
  });

  final List<TaskEntity> taskList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final task = taskList[index];

        return ListTile(
          title: Text(task.name),
          subtitle: Text(task.description),
        );
      },
      itemCount: taskList.length,
    );
  }
}
