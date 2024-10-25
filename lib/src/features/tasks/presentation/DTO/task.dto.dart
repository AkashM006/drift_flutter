import 'package:drift_flutter/src/features/tasks/domain/entity/task.entity.dart';

class TaskDto {
  final int id;
  final String name;
  final String description;

  TaskDto({
    required this.id,
    required this.name,
    required this.description,
  });
}

class TaskDtoMapper {
  static TaskDto fromEntity(TaskEntity entity) {
    return TaskDto(
      id: entity.id,
      name: entity.name,
      description: entity.description,
    );
  }

  static TaskEntity toEntity(TaskDto object) {
    return TaskEntity(
      id: object.id,
      name: object.name,
      description: object.description,
    );
  }
}
