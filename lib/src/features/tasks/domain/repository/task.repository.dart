import 'package:drift_flutter/src/core/utils/data_state.util.dart';
import 'package:drift_flutter/src/features/tasks/domain/entity/task.entity.dart';

abstract class TaskRepository {
  Future<List<TaskEntity>> getTasks();
  Future<DataState<void>> addTask(TaskEntity task);
  Future<DataState<TaskEntity>> getTask(int id);
  Future<DataState<void>> editTask(TaskEntity newTask);
  Future<DataState<void>> deleteTask(int taskId);
}
