import 'package:drift_flutter/src/features/shared/data/data_sources/db/database.dart';
import 'package:drift_flutter/src/features/tasks/data/model/task.model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'task.service.g.dart';

class TaskService {
  final AppDatabase _db;

  TaskService(this._db);

  Future<List<TaskModel>> getTasks() async {
    final result = await _db.taskDao.getTasks();

    return result
        .map(
          (task) => TaskModel(
            id: task.id,
            name: task.name,
            description: task.description,
          ),
        )
        .toList();
  }

  Future<void> addTask(TaskModel task) {
    return _db.taskDao.addTask(task);
  }
}

@riverpod
TaskService taskService(TaskServiceRef ref) {
  final db = ref.watch(dbProvider);

  return TaskService(db);
}
