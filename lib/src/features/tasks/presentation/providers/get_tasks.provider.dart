import 'package:drift_flutter/src/core/utils/custom_error.util.dart';
import 'package:drift_flutter/src/features/tasks/data/repository/task_impl.repository.dart';
import 'package:drift_flutter/src/features/tasks/domain/usecase/get_tasks.usecase.dart';
import 'package:drift_flutter/src/features/tasks/presentation/DTO/task.dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_tasks.provider.g.dart';

typedef GetTasksProviderData = List<TaskDto>;

@riverpod
Future<GetTasksProviderData> getTasks(GetTasksRef ref) async {
  final tasksRepository = ref.watch(taskImplProvider);

  try {
    final result = await GetTasksUsecase(tasksRepository)();
    return result.map((task) => TaskDto.fromEntity(task)).toList();
  } catch (e) {
    // maybe try logging errors to some service
    throw const AppError(message: "Something went wrong");
  }
}
