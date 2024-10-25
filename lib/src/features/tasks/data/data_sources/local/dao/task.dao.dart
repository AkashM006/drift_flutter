import 'package:drift/drift.dart';
import 'package:drift_flutter/src/features/shared/data/data_sources/db/database.dart';
import 'package:drift_flutter/src/features/tasks/data/data_sources/local/schema/task.schema.dart';
import 'package:drift_flutter/src/features/tasks/data/model/task.model.dart';

part 'task.dao.g.dart';

@DriftAccessor(tables: [Tasks])
class TaskDao extends DatabaseAccessor<AppDatabase> with _$TaskDaoMixin {
  TaskDao(super.db);

  Future<List<Task>> getTasks() {
    return select(tasks).get();
  }

  Future<void> addTask(TaskModel task) {
    return into(tasks).insert(
      TasksCompanion(
        name: Value(task.name),
        description: Value(task.description),
      ),
    );
  }
}
