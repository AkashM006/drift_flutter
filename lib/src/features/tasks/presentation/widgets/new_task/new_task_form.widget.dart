import 'package:drift_flutter/src/core/constants/size.dart';
import 'package:flutter/material.dart';

class NewTaskFormWidget extends StatefulWidget {
  const NewTaskFormWidget({super.key});

  @override
  State<NewTaskFormWidget> createState() => _NewTaskFormWidgetState();
}

class _NewTaskFormWidgetState extends State<NewTaskFormWidget> {
  final _formKey = GlobalKey<FormState>();
  String title = "";
  String description = "";

  void handleSubmit() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              label: Text("Title"),
              border: OutlineInputBorder(),
            ),
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
            onSaved: (newValue) {
              description = newValue!;
            },
          ),
          SizedBox(
            height: SizeConfig.safeBlockVertical * 3,
          ),
          FilledButton(
            onPressed: handleSubmit,
            child: const Text("Submit"),
          ),
        ],
      ),
    );
  }
}
