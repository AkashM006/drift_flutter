import 'package:drift_flutter/src/core/usecase/usecase.dart';
import 'package:drift_flutter/src/core/utils/data_state.util.dart';
import 'package:drift_flutter/src/features/tasks/domain/entity/task.entity.dart';
import 'package:drift_flutter/src/features/tasks/domain/repository/task.repository.dart';

class AddTaskUsecase extends Usecase<Future<DataState<void>>, TaskEntity> {
  final TaskRepository _taskRepository;

  AddTaskUsecase(this._taskRepository);

  @override
  Future<DataState<void>> call({required TaskEntity params}) async {
    return await _taskRepository.addTask(params);
  }
}
