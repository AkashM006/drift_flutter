import 'package:drift_flutter/src/features/tasks/domain/entity/task.entity.dart';

class TaskModel extends TaskEntity {
  final int _id;
  final String _name;
  final String _description;

  TaskModel({
    required super.id,
    required super.name,
    required super.description,
  })  : _id = id,
        _name = name,
        _description = description;

  @override
  TaskEntity copyWith({int? id, String? name, String? description}) {
    return TaskModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }

  @override
  String get description => _description;

  @override
  int get id => _id;

  @override
  String get name => _name;
}
