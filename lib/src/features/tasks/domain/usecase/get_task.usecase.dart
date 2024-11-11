import 'package:drift_flutter/src/core/usecase/usecase.dart';
import 'package:drift_flutter/src/core/utils/data_state.util.dart';
import 'package:drift_flutter/src/features/tasks/domain/entity/task.entity.dart';

class GetTaskUsecase extends Usecase<Future<DataState<TaskEntity>>, int> {
  @override
  Future<DataState<TaskEntity>> call({required int params}) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
