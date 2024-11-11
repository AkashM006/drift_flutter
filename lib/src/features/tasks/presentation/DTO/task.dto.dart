import 'package:drift_flutter/src/features/tasks/domain/entity/task.entity.dart';

class TaskDto {
  final int _id;
  final String _name;
  final String _description;

  int get id => _id;
  String get name => _name;
  String get description => _description;

  TaskDto({
    int id = -1,
    required String name,
    required String description,
  })  : _id = id,
        _name = name,
        _description = description;

  factory TaskDto.fromEntity(TaskEntity task) {
    return TaskDto(
      id: task.id,
      name: task.name,
      description: task.description,
    );
  }

  factory TaskDto.init() {
    return TaskDto(
      name: "",
      description: "",
    );
  }

  TaskEntity toEntity() {
    return TaskEntity(
      id: id,
      name: name,
      description: description,
    );
  }

  TaskDto copyWith({
    String? name,
    String? description,
  }) {
    return TaskDto(
      name: name ?? _name,
      description: description ?? _description,
    );
  }

  @override
  bool operator ==(covariant TaskDto other) {
    return id == other.id &&
        name == other.name &&
        description == other.description;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ description.hashCode;
}
