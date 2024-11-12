import 'package:drift_flutter/src/core/constants/app_offsets.dart';
import 'package:drift_flutter/src/core/utils/data_state.util.dart';
import 'package:drift_flutter/src/features/shared/presentation/widgets/async_value_builder/async_value_builder.widget.dart';
import 'package:drift_flutter/src/features/shared/presentation/widgets/custom_appbar/custom_appbar.widget.dart';
import 'package:drift_flutter/src/features/shared/presentation/widgets/snackbar/snackbar.widget.dart';
import 'package:drift_flutter/src/features/tasks/presentation/providers/delete_task/delete_task.provider.dart';
import 'package:drift_flutter/src/features/tasks/presentation/providers/edit_task/edit_task.provider.dart';
import 'package:drift_flutter/src/features/tasks/presentation/providers/get_task/get_task.provider.dart';
import 'package:drift_flutter/src/features/tasks/presentation/widgets/new_task/new_task_form.widget.dart';
import 'package:drift_flutter/src/features/tasks/presentation/widgets/task_detail/task_detail_appbar.widget.dart';
import 'package:drift_flutter/src/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class TaskDetailScreen extends ConsumerWidget {
  const TaskDetailScreen({
    super.key,
    required this.id,
  });

  final int? id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void onNewTask() {
      context.pushReplacement(PAGES.taskCreate.path);
    }

    if (id == null) {
      return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: ConstrainedBox(
            constraints: AppOffsets.messageWidthConstaint,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Whoops! Looks like your task does not exist. Don't worry create a new one!",
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 25,
                ),
                FilledButton(
                  onPressed: onNewTask,
                  child: const Text("Add Task"),
                )
              ],
            ),
          ),
        ),
      );
    }

    final task = ref.watch(getTaskProvider(id!));

    ref.listen(
      editTaskProvider,
      (previous, next) {
        next?.on(
          success: (data) {
            showSnackBar(context, data);
            context.pop();
          },
          failed: (error) {
            showSnackBar(context, error.toString());
          },
        );
      },
    );

    ref.listen(
      deleteTaskProvider,
      (previous, next) {
        next?.on(
          success: (data) {
            showSnackBar(context, data);
            context.pop();
          },
          failed: (error) {
            showSnackBar(context, error.toString());
          },
        );
      },
    );

    return Scaffold(
      appBar: CustomAppbarWidget(
        asyncData: task,
        builder: (context, data) => TaskDetailAppbarWidget(task: data),
      ),
      body: AsyncValueBuilderWidget(
        asyncValue: task,
        builder: (context, data) => NewTaskFormWidget(
          task: data,
        ),
      ),
    );
  }
}
