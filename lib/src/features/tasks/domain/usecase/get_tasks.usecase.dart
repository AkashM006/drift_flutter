import 'package:drift_flutter/src/core/usecase/usecase.dart';
import 'package:drift_flutter/src/core/utils/data_state.util.dart';
import 'package:drift_flutter/src/features/tasks/domain/entity/task.entity.dart';

class GetTasksUsecase
    extends Usecase<Future<DataState<List<TaskEntity>>>, void> {
  @override
  Future<DataState<List<TaskEntity>>> call({void params}) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
