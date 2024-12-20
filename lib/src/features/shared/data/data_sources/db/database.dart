// database.dart
import 'dart:io';

import 'package:drift/native.dart';
import 'package:drift/drift.dart';
import 'package:drift_flutter/src/features/tasks/data/data_sources/local/dao/task.dao.dart';
import 'package:drift_flutter/src/features/tasks/data/data_sources/local/schema/task.schema.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
// ignore: depend_on_referenced_packages
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [
    Tasks,
  ],
  daos: [
    // list of all daos used in the project
    TaskDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion =>
      1; // the current version of the database, can be incremented when changes made to schema

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        if (from < 2) {
          // await m.createTable(tasks);
        }
      },
    );
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    final cachebase = (await getTemporaryDirectory()).path;
    sqlite3.tempDirectory = cachebase;

    return NativeDatabase.createInBackground(file);
  });
}

@Riverpod(keepAlive: true)
AppDatabase db(DbRef ref) {
  return AppDatabase();
}
