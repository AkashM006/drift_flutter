import 'package:flutter/material.dart';

class ButtonLoaderWidget extends StatelessWidget {
  const ButtonLoaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 25,
      width: 25,
      child: CircularProgressIndicator(
        strokeWidth: 1,
      ),
    );
  }
}
