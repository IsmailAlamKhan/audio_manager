// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_manager_providers.dart';

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

String $getOutputDevicesHash() => r'bfd2e489f9f3417bd0cf89a03de1431c5e6e6114';

/// See also [getOutputDevices].
final getOutputDevicesProvider = AutoDisposeFutureProvider<List<AudioDevice>>(
  getOutputDevices,
  name: r'getOutputDevicesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $getOutputDevicesHash,
);
typedef GetOutputDevicesRef = AutoDisposeFutureProviderRef<List<AudioDevice>>;
String $getInputDevicesHash() => r'3d94f5d210a03ce3e5ec70ec30a8d09ae2a7136a';

/// See also [getInputDevices].
final getInputDevicesProvider = AutoDisposeFutureProvider<List<AudioDevice>>(
  getInputDevices,
  name: r'getInputDevicesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $getInputDevicesHash,
);
typedef GetInputDevicesRef = AutoDisposeFutureProviderRef<List<AudioDevice>>;
String $getAudioMixerHash() => r'0cf88988dcbd789b47f6c223154c022d319a8c83';

/// See also [getAudioMixer].
final getAudioMixerProvider = AutoDisposeFutureProvider<List<ProcessVolume>>(
  getAudioMixer,
  name: r'getAudioMixerProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : $getAudioMixerHash,
);
typedef GetAudioMixerRef = AutoDisposeFutureProviderRef<List<ProcessVolume>>;
String $getDefaultOutputDeviceHash() =>
    r'2546f9f80cd3489e08acfa62be193d0bb21b05cc';

/// See also [getDefaultOutputDevice].
final getDefaultOutputDeviceProvider = AutoDisposeFutureProvider<AudioDevice>(
  getDefaultOutputDevice,
  name: r'getDefaultOutputDeviceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $getDefaultOutputDeviceHash,
);
typedef GetDefaultOutputDeviceRef = AutoDisposeFutureProviderRef<AudioDevice>;
String $getDefaultInputDeviceHash() =>
    r'4502a429d45009d9a1c251dc168d9f5252fd8c62';

/// See also [getDefaultInputDevice].
final getDefaultInputDeviceProvider = AutoDisposeFutureProvider<AudioDevice>(
  getDefaultInputDevice,
  name: r'getDefaultInputDeviceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $getDefaultInputDeviceHash,
);
typedef GetDefaultInputDeviceRef = AutoDisposeFutureProviderRef<AudioDevice>;
String $getVolumeHash() => r'5e58da8a23a341bc104b0fe5ba1043377fbdcb56';

/// See also [getVolume].
final getVolumeProvider = AutoDisposeFutureProvider<double>(
  getVolume,
  name: r'getVolumeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : $getVolumeHash,
);
typedef GetVolumeRef = AutoDisposeFutureProviderRef<double>;
String $getMicVolumeHash() => r'2eafab0ff9f20efeefeefc836c2f5bfe50a18bff';

/// See also [getMicVolume].
final getMicVolumeProvider = AutoDisposeFutureProvider<double>(
  getMicVolume,
  name: r'getMicVolumeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : $getMicVolumeHash,
);
typedef GetMicVolumeRef = AutoDisposeFutureProviderRef<double>;
