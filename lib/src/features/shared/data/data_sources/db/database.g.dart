// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [];
}

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dbHash() => r'37db6d043c1f5869ce58d7c69f904ab4cc2704d8';

/// See also [db].
@ProviderFor(db)
final dbProvider = AutoDisposeProvider<AppDatabase>.internal(
  db,
  name: r'dbProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$dbHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DbRef = AutoDisposeProviderRef<AppDatabase>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
