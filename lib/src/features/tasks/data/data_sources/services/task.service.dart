import 'package:drift_flutter/src/features/shared/data/data_sources/db/database.dart';
import 'package:drift_flutter/src/features/tasks/data/model/task.model.dart';
import 'package:drift_flutter/src/features/tasks/domain/entity/task.entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'task.service.g.dart';

class TaskService {
  final AppDatabase _db;

  TaskService(this._db);

  Future<List<TaskEntity>> getTasks() async {
    final result = await _db.taskDao.getTasks();

    return result
        .map(
          (task) => task.toEntity(),
        )
        .toList();
  }

  Future<void> addTask(TaskEntity task) {
    return _db.taskDao.addTask(TaskModel.fromEntity(task));
  }

  Future<TaskEntity> getTask(int id) async {
    final result = await _db.taskDao.getTask(id);
    return result.toEntity();
  }

  Future<void> editTask(TaskEntity newTask) {
    return _db.taskDao.editTask(TaskModel.fromEntity(newTask));
  }
}

@riverpod
TaskService taskService(TaskServiceRef ref) {
  final db = ref.watch(dbProvider);

  return TaskService(db);
}
