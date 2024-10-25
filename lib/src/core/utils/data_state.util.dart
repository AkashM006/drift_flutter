import 'package:drift_flutter/src/core/utils/custom_error.util.dart';

abstract class DataState<T> {}

class DataSuccess<T> extends DataState<T> {
  final T data;
  DataSuccess(this.data);
}

class DataFailure<T> extends DataState<T> {
  final CustomError error;
  DataFailure(this.error);
}

class DataLoading<T> extends DataState<T> {}

extension DataStateExtension<T> on DataState<T> {
  R fold<R>({
    required R Function(T data) onSuccess,
    required R Function(CustomError error) onFailure,
  }) {
    if (this is DataSuccess<T>) {
      return onSuccess((this as DataSuccess<T>).data);
    }
    return onFailure((this as DataFailure<T>).error);
  }
}
