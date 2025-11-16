// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$needsAdditionalDetailsHash() =>
    r'1be3ab80442decaaced2c27a30ca51586161d134';

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

/// See also [needsAdditionalDetails].
@ProviderFor(needsAdditionalDetails)
const needsAdditionalDetailsProvider = NeedsAdditionalDetailsFamily();

/// See also [needsAdditionalDetails].
class NeedsAdditionalDetailsFamily extends Family<AsyncValue<bool>> {
  /// See also [needsAdditionalDetails].
  const NeedsAdditionalDetailsFamily();

  /// See also [needsAdditionalDetails].
  NeedsAdditionalDetailsProvider call(
    String userId,
  ) {
    return NeedsAdditionalDetailsProvider(
      userId,
    );
  }

  @override
  NeedsAdditionalDetailsProvider getProviderOverride(
    covariant NeedsAdditionalDetailsProvider provider,
  ) {
    return call(
      provider.userId,
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
  String? get name => r'needsAdditionalDetailsProvider';
}

/// See also [needsAdditionalDetails].
class NeedsAdditionalDetailsProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [needsAdditionalDetails].
  NeedsAdditionalDetailsProvider(
    String userId,
  ) : this._internal(
          (ref) => needsAdditionalDetails(
            ref as NeedsAdditionalDetailsRef,
            userId,
          ),
          from: needsAdditionalDetailsProvider,
          name: r'needsAdditionalDetailsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$needsAdditionalDetailsHash,
          dependencies: NeedsAdditionalDetailsFamily._dependencies,
          allTransitiveDependencies:
              NeedsAdditionalDetailsFamily._allTransitiveDependencies,
          userId: userId,
        );

  NeedsAdditionalDetailsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final String userId;

  @override
  Override overrideWith(
    FutureOr<bool> Function(NeedsAdditionalDetailsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: NeedsAdditionalDetailsProvider._internal(
        (ref) => create(ref as NeedsAdditionalDetailsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _NeedsAdditionalDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is NeedsAdditionalDetailsProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin NeedsAdditionalDetailsRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _NeedsAdditionalDetailsProviderElement
    extends AutoDisposeFutureProviderElement<bool>
    with NeedsAdditionalDetailsRef {
  _NeedsAdditionalDetailsProviderElement(super.provider);

  @override
  String get userId => (origin as NeedsAdditionalDetailsProvider).userId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
