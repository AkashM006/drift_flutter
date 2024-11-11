import 'package:drift_flutter/src/core/usecase/usecase.dart';
import 'package:drift_flutter/src/core/utils/data_state.util.dart';
import 'package:drift_flutter/src/features/tasks/domain/entity/task.entity.dart';
import 'package:drift_flutter/src/features/tasks/domain/repository/task.repository.dart';

class GetTaskUsecase extends Usecase<Future<DataState<TaskEntity>>, int> {
  final TaskRepository _taskRepository;

  GetTaskUsecase(this._taskRepository);

  @override
  Future<DataState<TaskEntity>> call({required int params}) {
    return _taskRepository.getTask(params);
  }
}
