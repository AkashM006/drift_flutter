import 'package:drift/drift.dart';
import 'package:drift_flutter/src/core/utils/custom_error.util.dart';
import 'package:drift_flutter/src/core/utils/error_handler.util.dart';
import 'package:drift_flutter/src/core/utils/error_msg.util.dart';
import 'package:drift_flutter/src/features/shared/data/data_sources/db/database.dart';
import 'package:drift_flutter/src/features/tasks/data/data_sources/local/schema/task.schema.dart';
import 'package:drift_flutter/src/features/tasks/data/model/task.model.dart';

part 'task.dao.g.dart';

@DriftAccessor(tables: [Tasks])
class TaskDao extends DatabaseAccessor<AppDatabase> with _$TaskDaoMixin {
  TaskDao(super.db);

  Future<List<TaskModel>> getTasks() async {
    return handleError(
      () async {
        final result = await select(tasks).get();
        return result.map((task) => TaskModel.fromDbModel(task)).toList();
      },
      "getting your tasks",
    );
  }

  Future<void> addTask(TaskModel task) async {
    handleError(
      () async {
        await into(tasks).insert(task.toCompanion());
      },
      "adding your task",
    );
  }

  Future<TaskModel> getTask(int id) async {
    return handleError(
      () async {
        final result = await (select(tasks)
              ..where(
                (tbl) => tbl.id.equals(id),
              ))
            .getSingleOrNull();

        if (result == null) {
          final errorMsg = doesNotExistMsg("task you are looking for");
          throw AppError(message: errorMsg);
        }
        return TaskModel.fromDbModel(result);
      },
      "getting your task",
    );
  }

  Future<void> editTask(TaskModel newTask) async {
    return handleError(
      () async {
        final task = await (select(tasks)
              ..where((tbl) => tbl.id.equals(newTask.id)))
            .getSingleOrNull();

        if (task == null) {
          final errorMsg = doesNotExistMsg("task you are trying to update");
          throw AppError(message: errorMsg);
        }

        await (update(tasks)
              ..where(
                (tbl) => tbl.id.equals(newTask.id),
              ))
            .write(newTask.toCompanion());
      },
      "updating your task",
    );
  }
}
