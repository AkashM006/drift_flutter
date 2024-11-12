import 'package:drift_flutter/src/features/shared/data/data_sources/db/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// ignore: depend_on_referenced_packages
import 'package:drift_db_viewer/drift_db_viewer.dart';

class DriftDbScreen extends ConsumerWidget {
  const DriftDbScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(dbProvider);

    return DriftDbViewer(
      db,
    );
  }
}
