import 'package:drift_flutter/src/core/utils/data_state.util.dart';
import 'package:drift_flutter/src/features/tasks/domain/entity/task.entity.dart';

abstract class TaskRepository {
  Future<List<TaskEntity>> getTasks();
  Future<DataState<void>> addTask();
}
