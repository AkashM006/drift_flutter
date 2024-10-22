import 'package:drift_flutter/src/core/utils/custom_error.util.dart';
import 'package:drift_flutter/src/core/utils/data_state.util.dart';
import 'package:flutter/material.dart';

abstract class BaseDbRepository {
  const BaseDbRepository();
  @protected
  Future<DataState<T>> safeExecute<T>(Future<T> Function() callback) async {
    try {
      final result = await callback();
      return DataSuccess(data: result);
    } catch (e) {
      final error = e as CustomError;
      return DataFailure(error: error);
    }
  }
}
