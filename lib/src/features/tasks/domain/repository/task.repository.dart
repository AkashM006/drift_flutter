import 'package:drift_flutter/src/core/utils/data_state.util.dart';
import 'package:drift_flutter/src/features/tasks/domain/entity/task.entity.dart';

abstract class TaskRepository {
  Future<DataState<List<TaskEntity>>> getTasks();
}
