// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_task.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getTaskHash() => r'66a6d52f7f467c5930b04f53736e1693bd19d796';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [getTask].
@ProviderFor(getTask)
const getTaskProvider = GetTaskFamily();

/// See also [getTask].
class GetTaskFamily extends Family<AsyncValue<TaskDto>> {
  /// See also [getTask].
  const GetTaskFamily();

  /// See also [getTask].
  GetTaskProvider call(
    int id,
  ) {
    return GetTaskProvider(
      id,
    );
  }

  @override
  GetTaskProvider getProviderOverride(
    covariant GetTaskProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getTaskProvider';
}

/// See also [getTask].
class GetTaskProvider extends AutoDisposeFutureProvider<TaskDto> {
  /// See also [getTask].
  GetTaskProvider(
    int id,
  ) : this._internal(
          (ref) => getTask(
            ref as GetTaskRef,
            id,
          ),
          from: getTaskProvider,
          name: r'getTaskProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getTaskHash,
          dependencies: GetTaskFamily._dependencies,
          allTransitiveDependencies: GetTaskFamily._allTransitiveDependencies,
          id: id,
        );

  GetTaskProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<TaskDto> Function(GetTaskRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetTaskProvider._internal(
        (ref) => create(ref as GetTaskRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<TaskDto> createElement() {
    return _GetTaskProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetTaskProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetTaskRef on AutoDisposeFutureProviderRef<TaskDto> {
  /// The parameter `id` of this provider.
  int get id;
}

class _GetTaskProviderElement extends AutoDisposeFutureProviderElement<TaskDto>
    with GetTaskRef {
  _GetTaskProviderElement(super.provider);

  @override
  int get id => (origin as GetTaskProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
