import 'package:drift/drift.dart';
import 'package:drift_flutter/src/core/utils/custom_error.util.dart';
import 'package:drift_flutter/src/core/utils/error_msg.util.dart';
import 'package:drift_flutter/src/features/shared/data/data_sources/db/database.dart';
import 'package:drift_flutter/src/features/tasks/data/data_sources/local/schema/task.schema.dart';
import 'package:drift_flutter/src/features/tasks/data/model/task.model.dart';

part 'task.dao.g.dart';

@DriftAccessor(tables: [Tasks])
class TaskDao extends DatabaseAccessor<AppDatabase> with _$TaskDaoMixin {
  TaskDao(super.db);

  Future<List<TaskModel>> getTasks() async {
    try {
      final result = await select(tasks).get();
      return result.map((task) => TaskModel.fromDbModel(task)).toList();
    } catch (e) {
      final errorMsg = somethingWentWrongMsg("getting your tasks");
      throw AppError(message: errorMsg);
    }
  }

  Future<void> addTask(TaskModel task) async {
    try {
      await into(tasks).insert(task.toCompanion());
    } catch (e) {
      final errorMsg = somethingWentWrongMsg("adding your task");
      throw AppError(message: errorMsg);
    }
  }
}
