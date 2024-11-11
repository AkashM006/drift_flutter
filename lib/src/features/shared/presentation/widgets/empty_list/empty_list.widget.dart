import 'package:drift_flutter/src/core/constants/app_offsets.dart';
import 'package:drift_flutter/src/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EmptyListWidget extends StatelessWidget {
  const EmptyListWidget({
    super.key,
    required this.text,
    required this.buttonText,
    required this.targetPage,
  });

  final String text;
  final String buttonText;
  final PAGES targetPage;

  @override
  Widget build(BuildContext context) {
    void onAdd() {
      context.push(targetPage.path);
    }

    return Center(
      child: ConstrainedBox(
        constraints: AppOffsets.messageWidthConstaint,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: onAdd,
              child: Text(buttonText),
            ),
          ],
        ),
      ),
    );
  }
}
