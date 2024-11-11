import 'package:drift_flutter/src/features/shared/presentation/widgets/custom_error/custom_error.widget.dart';
import 'package:drift_flutter/src/features/shared/presentation/widgets/custom_loader/custom_loader.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AsyncValueBuilderWidget<T> extends StatelessWidget {
  const AsyncValueBuilderWidget({
    super.key,
    required this.asyncValue,
    required this.builder,
  });

  final AsyncValue<T> asyncValue;
  final Widget Function(BuildContext context, T data) builder;

  @override
  Widget build(BuildContext context) {
    return asyncValue.when(
      data: (data) => builder(context, data),
      error: (error, stackTrace) => Center(
        child: CustomErrorWidget(text: error.toString()),
      ),
      loading: () => const Center(
        child: CustomLoaderWidget(),
      ),
    );
  }
}
