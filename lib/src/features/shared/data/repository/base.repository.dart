import 'package:drift_flutter/src/core/utils/custom_error.util.dart';
import 'package:drift_flutter/src/core/utils/data_state.util.dart';
import 'package:flutter/material.dart';

abstract class BaseRepository {
  const BaseRepository();
  @protected
  Future<DataState<T>> safeExecute<T>(Future<T> Function() callback) async {
    try {
      final result = await callback();
      return DataSuccess(result);
    } catch (e) {
      final error = AppError(message: e.toString());
      return DataFailure(error);
    }
  }
}