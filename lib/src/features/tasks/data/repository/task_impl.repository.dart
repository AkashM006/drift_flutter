import 'package:drift_flutter/src/core/utils/data_state.util.dart';
import 'package:drift_flutter/src/features/shared/data/repository/base.repository.dart';
import 'package:drift_flutter/src/features/tasks/data/data_sources/services/task.service.dart';
import 'package:drift_flutter/src/features/tasks/data/model/task.model.dart';
import 'package:drift_flutter/src/features/tasks/domain/entity/task.entity.dart';
import 'package:drift_flutter/src/features/tasks/domain/repository/task.repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'task_impl.repository.g.dart';

class TaskImpl extends BaseRepository implements TaskRepository {
  final TaskService _taskService;

  TaskImpl(this._taskService);

  @override
  Future<List<TaskEntity>> getTasks() async {
    final result = await _taskService.getTasks();

    return result.map((model) => model.toEntity()).toList();
  }

  @override
  Future<DataState<void>> addTask(TaskEntity task) async {
    return safeExecute(
      () => _taskService.addTask(
        TaskModel.fromEntity(task),
      ),
    );
  }
}

@riverpod
TaskImpl taskImpl(TaskImplRef ref) {
  final taskService = ref.watch(taskServiceProvider);

  return TaskImpl(taskService);
}
