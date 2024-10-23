abstract class TaskEntity {
  int get id;
  String get name;
  String get description;

  const TaskEntity({
    required int id,
    required String name,
    required String description,
  });

  TaskEntity copyWith({
    int id,
    String name,
    String description,
  });
}
