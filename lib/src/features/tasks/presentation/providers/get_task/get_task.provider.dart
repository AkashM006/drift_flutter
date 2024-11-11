import 'package:drift_flutter/src/core/utils/data_state.util.dart';
import 'package:drift_flutter/src/features/tasks/data/repository/task_impl.repository.dart';
import 'package:drift_flutter/src/features/tasks/domain/usecase/get_task.usecase.dart';
import 'package:drift_flutter/src/features/tasks/presentation/dto/task.dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_task.provider.g.dart';

@riverpod
Future<TaskDto> getTask(GetTaskRef ref, int id) async {
  final taskRepository = ref.watch(taskImplProvider);

  final result = await GetTaskUsecase(taskRepository)(params: id);

  return result.fold(
    onSuccess: (data) => TaskDto.fromEntity(data),
    onFailure: (error) => throw error,
  );
}
