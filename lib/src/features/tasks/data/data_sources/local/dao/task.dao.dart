import 'package:drift/drift.dart';
import 'package:drift_flutter/src/features/shared/data/data_sources/db/database.dart';
import 'package:drift_flutter/src/features/tasks/data/data_sources/local/schema/task.schema.dart';

part 'task.dao.g.dart';

@DriftAccessor(tables: [Tasks])
class TaskDao extends DatabaseAccessor<AppDatabase> with _$TaskDaoMixin {
  TaskDao(super.db);

  Future<List<Task>> getTasks() {
    return select(tasks).get();
  }

  Future<void> addTask(TasksCompanion task) {
    return into(tasks).insert(task);
  }
}
