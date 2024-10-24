import 'package:drift_flutter/src/features/tasks/domain/entity/task.entity.dart';

abstract class TaskRepository {
  Future<List<TaskEntity>> getTasks();
}
