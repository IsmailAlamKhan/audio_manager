// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_socket.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

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

String $webSocketHelperHash() => r'14f922989e541f12d336a8d9b690823fb79cbfaf';

/// See also [webSocketHelper].
class WebSocketHelperProvider extends Provider<WebSocketHelper> {
  WebSocketHelperProvider(
    this.path,
  ) : super(
          (ref) => webSocketHelper(
            ref,
            path,
          ),
          from: webSocketHelperProvider,
          name: r'webSocketHelperProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : $webSocketHelperHash,
        );

  final String path;

  @override
  bool operator ==(Object other) {
    return other is WebSocketHelperProvider && other.path == path;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, path.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef WebSocketHelperRef = ProviderRef<WebSocketHelper>;

/// See also [webSocketHelper].
final webSocketHelperProvider = WebSocketHelperFamily();

class WebSocketHelperFamily extends Family<WebSocketHelper> {
  WebSocketHelperFamily();

  WebSocketHelperProvider call(
    String path,
  ) {
    return WebSocketHelperProvider(
      path,
    );
  }

  @override
  Provider<WebSocketHelper> getProviderOverride(
    covariant WebSocketHelperProvider provider,
  ) {
    return call(
      provider.path,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'webSocketHelperProvider';
}
