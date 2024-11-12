import 'package:drift_flutter/src/core/usecase/usecase.dart';
import 'package:drift_flutter/src/core/utils/data_state.util.dart';

class DeleteTaskUsecase extends Usecase<Future<DataState<void>>, int> {
  @override
  Future<DataState<void>> call({required int params}) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
