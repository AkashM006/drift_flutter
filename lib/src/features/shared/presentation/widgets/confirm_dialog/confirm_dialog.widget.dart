import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ConfirmDialogWidget extends StatelessWidget {
  const ConfirmDialogWidget({
    super.key,
    required this.title,
    required this.content,
  });

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    void onCancel() {
      context.pop(false);
    }

    void onProceed() {
      context.pop(true);
    }

    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(onPressed: onCancel, child: const Text("Cancel")),
        TextButton(onPressed: onProceed, child: const Text("Proceed")),
      ],
    );
  }
}
