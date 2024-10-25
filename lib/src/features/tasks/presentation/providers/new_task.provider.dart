import 'package:drift_flutter/src/core/utils/data_state.util.dart';
import 'package:drift_flutter/src/features/tasks/data/repository/task_impl.repository.dart';
import 'package:drift_flutter/src/features/tasks/domain/entity/task.entity.dart';
import 'package:drift_flutter/src/features/tasks/domain/usecase/add_task.usecase.dart';
import 'package:drift_flutter/src/features/tasks/presentation/providers/get_tasks.provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'new_task.provider.g.dart';

@riverpod
class AddTask extends _$AddTask {
  @override
  DataState<void>? build() {
    return null;
  }

  void go(TaskEntity task) async {
    state = DataLoading();

    final taskRepository = ref.read(taskImplProvider);

    final result = await AddTaskUsecase(taskRepository)(params: task);

    state = result.fold(
      onSuccess: (data) {
        ref.invalidate(getTasksProvider);
        return DataSuccess(data);
      },
      onFailure: (error) => DataFailure(error),
    );
  }
}
