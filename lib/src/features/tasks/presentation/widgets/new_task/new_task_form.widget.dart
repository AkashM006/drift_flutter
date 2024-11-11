import 'package:drift_flutter/src/core/constants/size.dart';
import 'package:drift_flutter/src/core/utils/data_state.util.dart';
import 'package:drift_flutter/src/features/shared/presentation/widgets/custom_loader/custom_loader.widget.dart';
import 'package:drift_flutter/src/features/tasks/presentation/dto/task.dto.dart';
import 'package:drift_flutter/src/features/tasks/presentation/providers/add_task/add_task.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewTaskFormWidget extends ConsumerStatefulWidget {
  const NewTaskFormWidget({
    super.key,
    this.task,
  });

  final TaskDto? task;

  @override
  ConsumerState<NewTaskFormWidget> createState() => _NewTaskFormWidgetState();
}

class _NewTaskFormWidgetState extends ConsumerState<NewTaskFormWidget> {
  final _formKey = GlobalKey<FormState>();

  TaskDto task = TaskDto.init();

  bool get isEdit => widget.task != null;

  void handleSubmit() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    _formKey.currentState!.save();

    ref.read(addTaskProvider.notifier).go(task);
  }

  @override
  void initState() {
    super.initState();
    if (isEdit) {
      task = widget.task!;
    }
  }

  @override
  Widget build(BuildContext context) {
    final addTaskStatus = ref.watch(addTaskProvider);

    final isAddLoading = addTaskStatus != null && addTaskStatus is DataLoading;

    final isLoading = isAddLoading;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 500),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  label: Text("Title"),
                  border: OutlineInputBorder(),
                ),
                textCapitalization: TextCapitalization.sentences,
                enabled: !isLoading,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Title is required";
                  }
                  return null;
                },
                onSaved: (newValue) {
                  task = task.copyWith(name: newValue);
                },
                initialValue: task.name,
              ),
              SizedBox(
                height: SizeConfig.safeBlockVertical * 2,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text("Description"),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Description is required";
                  }
                  return null;
                },
                enabled: !isLoading,
                textCapitalization: TextCapitalization.sentences,
                onSaved: (newValue) {
                  task = task.copyWith(description: newValue);
                },
                initialValue: task.description,
              ),
              SizedBox(
                height: SizeConfig.safeBlockVertical * 3,
              ),
              isLoading
                  ? const CustomLoaderWidget()
                  : FilledButton(
                      onPressed: isLoading ? null : handleSubmit,
                      child: const Text("Submit"),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
