import 'package:drift_flutter/src/features/tasks/data/repository/task_impl.repository.dart';
import 'package:drift_flutter/src/features/tasks/domain/usecase/get_tasks.usecase.dart';
import 'package:drift_flutter/src/features/tasks/presentation/dto/task.dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_tasks.provider.g.dart';

typedef GetTasksProviderData = List<TaskDto>;

@riverpod
Future<GetTasksProviderData> getTasks(GetTasksRef ref) async {
  final tasksRepository = ref.watch(taskImplProvider);

  final result = await GetTasksUsecase(tasksRepository)();
  return result.map((task) => TaskDto.fromEntity(task)).toList();
}
