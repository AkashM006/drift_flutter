import 'package:drift_flutter/src/core/utils/data_state.util.dart';
import 'package:drift_flutter/src/core/utils/text_truncate.util.dart';
import 'package:drift_flutter/src/features/tasks/presentation/dto/task.dto.dart';
import 'package:drift_flutter/src/features/tasks/presentation/providers/delete_task/delete_task.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TaskDetailAppbarWidget extends ConsumerWidget
    implements PreferredSizeWidget {
  const TaskDetailAppbarWidget({
    super.key,
    required this.task,
  });

  final TaskDto task;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void onDelete() {
      ref.read(deleteTaskProvider.notifier).go(task.id);
    }

    final deleteTaskStatus = ref.watch(deleteTaskProvider);

    final isLoading = deleteTaskStatus?.isLoading ?? false;

    return AppBar(
      title: Text(truncateWithEllipsis(task.name)),
      actions: [
        IconButton(
          onPressed: isLoading ? null : onDelete,
          icon: const Icon(Icons.delete),
          color: Theme.of(context).colorScheme.error,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
