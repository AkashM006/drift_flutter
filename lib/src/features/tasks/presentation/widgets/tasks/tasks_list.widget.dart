import 'package:drift_flutter/src/features/tasks/presentation/dto/task.dto.dart';
import 'package:drift_flutter/src/features/tasks/presentation/providers/get_tasks/get_tasks.provider.dart';
import 'package:drift_flutter/src/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class TasksListWidget extends ConsumerWidget {
  const TasksListWidget({
    super.key,
    required this.taskList,
  });

  final List<TaskDto> taskList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void onTaskClicked(int id) {
      context.pushNamed(PAGES.taskDetail.name, queryParameters: {
        "id": id.toString(),
      });
    }

    return RefreshIndicator(
      onRefresh: () => ref.refresh(getTasksProvider.future),
      child: ListView.builder(
        itemBuilder: (context, index) {
          final task = taskList[index];
          return ListTile(
            title: Text(task.name),
            subtitle: Text(task.description),
            onTap: () => onTaskClicked(task.id),
          );
        },
        itemCount: taskList.length,
      ),
    );
  }
}
