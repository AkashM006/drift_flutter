import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomAppbarWidget<T> extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppbarWidget({
    super.key,
    required this.asyncData,
    required this.builder,
  });

  final AsyncValue<T> asyncData;
  final PreferredSizeWidget Function(BuildContext context, T data) builder;

  @override
  Widget build(BuildContext context) {
    return asyncData.when(
      data: (data) => builder(context, data),
      error: (error, stackTrace) => AppBar(
        title: const Text("Error"),
      ),
      loading: () => AppBar(
        title: const Text("Loading..."),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
