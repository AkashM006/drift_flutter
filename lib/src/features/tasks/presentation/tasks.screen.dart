import 'package:drift_flutter/src/core/constants/size.dart';
import 'package:drift_flutter/src/features/shared/presentation/widgets/bottom_navigation_bar/bottom_navigation_bar.widget.dart';
import 'package:drift_flutter/src/features/shared/presentation/widgets/custom_error/custom_error.widget.dart';
import 'package:drift_flutter/src/features/shared/presentation/widgets/custom_loader/custom_loader.widget.dart';
import 'package:drift_flutter/src/features/tasks/presentation/providers/get_tasks.provider.dart';
import 'package:drift_flutter/src/features/tasks/presentation/widgets/tasks/tasks_list.widget.dart';
import 'package:drift_flutter/src/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class TasksScreen extends ConsumerWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(getTasksProvider);

    void handleCreate() {
      context.push(PAGES.taskCreate.path);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tasks",
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(
        currentPage: PAGES.home,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: handleCreate,
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: tasks.when(
          data: (data) {
            if (data.isEmpty) {
              return ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: SizeConfig.safeBlockHorizontal * 70,
                ),
                child: Text(
                  "You have no tasks yet. Add one to see it here",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontStyle: FontStyle.italic,
                      ),
                  textAlign: TextAlign.center,
                ),
              );
            }

            return TasksListWidget(taskList: data);
          },
          error: (error, stackTrace) =>
              CustomErrorWidget(text: error.toString()),
          loading: () => const CustomLoaderWidget(),
        ),
      ),
    );
  }
}
