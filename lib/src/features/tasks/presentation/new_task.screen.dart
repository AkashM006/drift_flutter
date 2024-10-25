import 'package:drift_flutter/src/core/utils/data_state.util.dart';
import 'package:drift_flutter/src/features/tasks/presentation/providers/new_task.provider.dart';
import 'package:drift_flutter/src/features/tasks/presentation/widgets/new_task/new_task_form.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class NewTaskScreen extends ConsumerWidget {
  const NewTaskScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      addTaskProvider,
      (previous, next) {
        if (next is DataLoading) return;

        if (next is DataSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Added to your task"),
            ),
          );
          context.pop();
          return;
        }

        if (next is DataFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                "Something went wrong when trying to add your task. Please try again later",
              ),
            ),
          );
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("New Task"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: const NewTaskFormWidget(),
        ),
      ),
    );
  }
}
