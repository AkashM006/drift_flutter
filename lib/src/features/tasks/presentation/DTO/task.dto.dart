import 'package:drift_flutter/src/features/tasks/domain/entity/task.entity.dart';

class TaskDto {
  final int id;
  final String name;
  final String description;

  TaskDto({
    this.id = -1,
    required this.name,
    required this.description,
  });

  factory TaskDto.fromEntity(TaskEntity task) {
    return TaskDto(
      id: task.id,
      name: task.name,
      description: task.description,
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
