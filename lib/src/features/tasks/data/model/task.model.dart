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

  TaskModel copyWith({int? id, String? name, String? description}) {
    return TaskModel(
      id: id ?? _id,
      name: name ?? _name,
      description: description ?? _description,
    );
  }

  TaskEntity toEntity() {
    return TaskEntity(
      id: _id,
      name: _name,
      description: _description,
    );
  }

  factory TaskModel.fromEntity(TaskEntity taskEntity) {
    return TaskModel(
      id: taskEntity.id,
      name: taskEntity.name,
      description: taskEntity.description,
    );
  }

  String get description => _description;

  int get id => _id;

  String get name => _name;
}
