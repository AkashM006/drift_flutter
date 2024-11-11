import 'package:drift_flutter/src/features/tasks/presentation/DTO/task.dto.dart';
import 'package:flutter/material.dart';

class TasksListWidget extends StatelessWidget {
  const TasksListWidget({
    super.key,
    required this.taskList,
  });

  final List<TaskDto> taskList;

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
