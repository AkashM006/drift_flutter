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
  Future<List<TaskEntity>> getTasks() async {
    final result = await _taskService.getTasks();
    return result;
  }

  @override
  Future<DataState<void>> addTask(TaskEntity task) async {
    return safeExecute(
      () => _taskService.addTask(task),
    );
  }

  @override
  Future<DataState<TaskEntity>> getTask(int id) {
    return safeExecute(
      () => _taskService.getTask(id),
    );
  }

  @override
  Future<DataState<void>> editTask(TaskEntity newTask) {
    return safeExecute(
      () => _taskService.editTask(newTask),
    );
  }

  @override
  Future<DataState<void>> deleteTask(int taskId) {
    // TODO: implement deleteTask
    throw UnimplementedError();
  }
}

@riverpod
TaskImpl taskImpl(TaskImplRef ref) {
  final taskService = ref.watch(taskServiceProvider);

  return TaskImpl(taskService);
}
