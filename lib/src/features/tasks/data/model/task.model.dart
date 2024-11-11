import 'package:drift/drift.dart';
import 'package:drift_flutter/src/features/shared/data/data_sources/db/database.dart';
import 'package:drift_flutter/src/features/tasks/domain/entity/task.entity.dart';

class TaskModel {
  final int _id;
  final String _name;
  final String _description;

  TaskModel({
    required id,
    required name,
    required description,
  })  : _id = id,
        _name = name,
        _description = description;

  String get description => _description;

  int get id => _id;

  String get name => _name;

  factory TaskModel.fromEntity(TaskEntity taskEntity) {
    return TaskModel(
      id: taskEntity.id,
      name: taskEntity.name,
      description: taskEntity.description,
    );
  }

  factory TaskModel.fromDbModel(Task task) {
    return TaskModel(
      id: task.id,
      name: task.name,
      description: task.description,
    );
  }

  TasksCompanion toCompanion() {
    return TasksCompanion(
      name: Value(name),
      description: Value(description),
    );
  }

  TaskEntity toEntity() {
    return TaskEntity(
      id: id,
      name: name,
      description: description,
    );
  }
}
