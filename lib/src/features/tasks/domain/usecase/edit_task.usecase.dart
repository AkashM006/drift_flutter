import 'package:drift_flutter/src/core/usecase/usecase.dart';
import 'package:drift_flutter/src/core/utils/data_state.util.dart';
import 'package:drift_flutter/src/features/tasks/domain/entity/task.entity.dart';
import 'package:drift_flutter/src/features/tasks/domain/repository/task.repository.dart';

class EditTaskUsecase extends Usecase<Future<DataState<void>>, TaskEntity> {
  final TaskRepository _taskRepository;

  EditTaskUsecase(this._taskRepository);

  @override
  Future<DataState<void>> call({required TaskEntity params}) {
    return _taskRepository.editTask(params);
  }
}
