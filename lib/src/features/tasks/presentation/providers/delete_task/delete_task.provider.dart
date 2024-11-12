import 'package:drift_flutter/src/core/utils/data_state.util.dart';
import 'package:drift_flutter/src/features/tasks/data/repository/task_impl.repository.dart';
import 'package:drift_flutter/src/features/tasks/domain/usecase/delete_task.usecase.dart';
import 'package:drift_flutter/src/features/tasks/presentation/providers/get_tasks/get_tasks.provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'delete_task.provider.g.dart';

@riverpod
class DeleteTask extends _$DeleteTask {
  @override
  DataState<String>? build() => null;

  void go(int taskId) async {
    state = DataLoading();

    final taskRepository = ref.read(taskImplProvider);

    final result = await DeleteTaskUsecase(taskRepository)(params: taskId);

    state = result.fold(
      onSuccess: (data) {
        ref.invalidate(getTasksProvider);
        return DataSuccess("Deleted your task");
      },
      onFailure: (error) => DataFailure(error),
    );
  }
}
