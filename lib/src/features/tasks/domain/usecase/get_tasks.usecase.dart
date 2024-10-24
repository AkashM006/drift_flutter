import 'package:drift_flutter/src/core/usecase/usecase.dart';
import 'package:drift_flutter/src/features/tasks/domain/entity/task.entity.dart';
import 'package:drift_flutter/src/features/tasks/domain/repository/task.repository.dart';

class GetTasksUsecase extends Usecase<Future<List<TaskEntity>>, void> {
  final TaskRepository _taskRepository;

  GetTasksUsecase(this._taskRepository);

  @override
  Future<List<TaskEntity>> call({void params}) {
    return _taskRepository.getTasks();
  }
}
