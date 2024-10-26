import 'package:drift_flutter/src/core/utils/custom_error.util.dart';
import 'package:drift_flutter/src/features/tasks/data/repository/task_impl.repository.dart';
import 'package:drift_flutter/src/features/tasks/domain/entity/task.entity.dart';
import 'package:drift_flutter/src/features/tasks/domain/usecase/get_tasks.usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_tasks.provider.g.dart';

typedef GetTasksProviderData = List<TaskEntity>;

@riverpod
Future<GetTasksProviderData> getTasks(GetTasksRef ref) async {
  final tasksRepository = ref.watch(taskImplProvider);

  try {
    final result = await GetTasksUsecase(tasksRepository)();
    return result;
  } catch (e) {
    // maybe try logging errors to some service
    throw const AppError(message: "Something went wrong");
  }
}
