import 'package:drift_flutter/src/core/usecase/usecase.dart';
import 'package:drift_flutter/src/core/utils/data_state.util.dart';
import 'package:drift_flutter/src/features/tasks/domain/repository/task.repository.dart';

class DeleteTaskUsecase extends Usecase<Future<DataState<void>>, int> {
  final TaskRepository _taskRepository;

  DeleteTaskUsecase(this._taskRepository);

  @override
  Future<DataState<void>> call({required int params}) {
    return _taskRepository.deleteTask(params);
  }
}
