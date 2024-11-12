import 'package:drift_flutter/src/core/utils/data_state.util.dart';
import 'package:drift_flutter/src/features/tasks/data/repository/task_impl.repository.dart';
import 'package:drift_flutter/src/features/tasks/domain/usecase/edit_task.usecase.dart';
import 'package:drift_flutter/src/features/tasks/presentation/dto/task.dto.dart';
import 'package:drift_flutter/src/features/tasks/presentation/providers/get_tasks/get_tasks.provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'edit_task.provider.g.dart';

@riverpod
class EditTask extends _$EditTask {
  @override
  DataState<String>? build() {
    return null;
  }

  void go(TaskDto newTask) async {
    final taskRepository = ref.read(taskImplProvider);

    state = DataLoading();

    final result = await EditTaskUsecase(taskRepository)(
      params: newTask.toEntity(),
    );

    state = result.fold(
      onSuccess: (data) {
        ref.invalidate(getTasksProvider);
        return DataSuccess("Updated your tasks successfully!");
      },
      onFailure: (error) => DataFailure(error),
    );
  }
}
