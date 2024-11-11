import 'package:drift_flutter/src/core/constants/size.dart';
import 'package:drift_flutter/src/core/utils/data_state.util.dart';
import 'package:drift_flutter/src/features/shared/presentation/widgets/custom_loader/custom_loader.widget.dart';
import 'package:drift_flutter/src/features/tasks/presentation/dto/task.dto.dart';
import 'package:drift_flutter/src/features/tasks/presentation/providers/add_task.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewTaskFormWidget extends ConsumerStatefulWidget {
  const NewTaskFormWidget({super.key});

  @override
  ConsumerState<NewTaskFormWidget> createState() => _NewTaskFormWidgetState();
}

class _NewTaskFormWidgetState extends ConsumerState<NewTaskFormWidget> {
  final _formKey = GlobalKey<FormState>();
  String title = "";
  String description = "";

  void handleSubmit() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    _formKey.currentState!.save();

    final task = TaskDto(
      id: -1,
      name: title,
      description: description,
    );

    ref.read(addTaskProvider.notifier).go(task);
  }

  @override
  Widget build(BuildContext context) {
    final addTaskStatus = ref.watch(addTaskProvider);

    final isAddLoading = addTaskStatus != null && addTaskStatus is DataLoading;

    final isLoading = isAddLoading;

    return Form(
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
              title = newValue!;
            },
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
              description = newValue!;
            },
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
    );
  }
}
