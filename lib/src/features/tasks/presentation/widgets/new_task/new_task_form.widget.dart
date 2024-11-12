import 'package:drift_flutter/src/core/constants/size.dart';
import 'package:drift_flutter/src/core/utils/data_state.util.dart';
import 'package:drift_flutter/src/features/shared/presentation/widgets/custom_loader/custom_loader.widget.dart';
import 'package:drift_flutter/src/features/tasks/presentation/dto/task.dto.dart';
import 'package:drift_flutter/src/features/tasks/presentation/providers/add_task/add_task.provider.dart';
import 'package:drift_flutter/src/features/tasks/presentation/providers/edit_task/edit_task.provider.dart';
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

  bool get isSubmitedEnabled {
    if (!isEdit) return true;

    return task != widget.task!;
  }

  void handleSubmit() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    _formKey.currentState!.save();

    if (isEdit) {
      ref.read(editTaskProvider.notifier).go(task);
      return;
    }

    ref.read(addTaskProvider.notifier).go(task);
  }

  @override
  void initState() {
    super.initState();
    if (isEdit) {
      task = widget.task!;
    }
  }

  void setName(String? newValue) {
    task = task.copyWith(name: newValue);
  }

  void setDescription(String? newValue) {
    task = task.copyWith(description: newValue);
  }

  @override
  Widget build(BuildContext context) {
    final addTaskStatus = ref.watch(addTaskProvider);
    final editTaskState = ref.watch(editTaskProvider);

    final isAddLoading = addTaskStatus?.isLoading ?? false;
    final isEditLoading = editTaskState?.isLoading ?? false;

    final isLoading = isAddLoading || isEditLoading;

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
                onSaved: setName,
                onChanged: (value) {
                  setState(() {
                    setName(value);
                  });
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
                onSaved: setDescription,
                onChanged: (value) {
                  setState(() {
                    setDescription(value);
                  });
                },
                initialValue: task.description,
              ),
              SizedBox(
                height: SizeConfig.safeBlockVertical * 3,
              ),
              isLoading
                  ? const CustomLoaderWidget()
                  : FilledButton(
                      onPressed: isSubmitedEnabled ? handleSubmit : null,
                      child: const Text("Submit"),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
