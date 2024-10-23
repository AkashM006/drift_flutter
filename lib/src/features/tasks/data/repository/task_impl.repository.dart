import 'package:drift_flutter/src/core/utils/data_state.util.dart';
import 'package:drift_flutter/src/features/shared/data/repository/base_db.repository.dart';
import 'package:drift_flutter/src/features/tasks/data/data_sources/services/task.service.dart';
import 'package:drift_flutter/src/features/tasks/domain/entity/task.entity.dart';
import 'package:drift_flutter/src/features/tasks/domain/repository/task.repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'task_impl.repository.g.dart';

class TaskImpl extends BaseDbRepository implements TaskRepository {
  final TaskService _taskService;

  TaskImpl(this._taskService);

  @override
  Future<DataState<List<TaskEntity>>> getTasks() {
    return safeExecute(
      () => _taskService.getTasks(),
    );
  }
}

@riverpod
TaskImpl taskImpl(TaskImplRef ref) {
  final taskService = ref.watch(taskServiceProvider);

  return TaskImpl(taskService);
}
