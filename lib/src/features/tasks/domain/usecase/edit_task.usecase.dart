import 'package:drift_flutter/src/core/usecase/usecase.dart';
import 'package:drift_flutter/src/core/utils/data_state.util.dart';
import 'package:drift_flutter/src/features/tasks/domain/entity/task.entity.dart';

class EditTaskUsecase extends Usecase<Future<DataState<void>>, TaskEntity> {
  @override
  Future<DataState<void>> call({required TaskEntity params}) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
