import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:win32audio/win32audio.dart';

final audioManagerServiceProvider =
    Provider<AudioManagerService>((ref) => Win32AudioMangerServiceImpl());

abstract class AudioManagerService {
  Future<List<AudioDevice>> getOutputDevices();
  Stream<List<AudioDevice>> getOutputDevicesStream();
  Future<void> setVolume(double volume);
  Future<double> getVolume();
  Stream<double> getVolumeStream();

  Future<List<AudioDevice>> getInputDevices();
  Stream<List<AudioDevice>> getInputDevicesStream();
  Future<void> setMicVolume(double volume);
  Future<double> getMicVolume();
  Stream<double> getMicVolumeStream();

  Future<List<ProcessVolume>> getAudioMixer();
  Stream<List<ProcessVolume>> getAudioMixerStream();

  Future<AudioDevice> getDefaultOutputDevice();
  Stream<AudioDevice> getDefaultOutputDeviceStream();
  Future<AudioDevice> getDefaultInputDevice();
  Stream<AudioDevice> getDefaultInputDeviceStream();

  Future<void> setMixerVolume(int deviceId, double volume);
  Future<void> setDefaultDevice(String deviceId);
}

class Win32AudioMangerServiceImpl extends AudioManagerService {
  static const period = Duration(seconds: 1);
  @override
  Future<List<ProcessVolume>> getAudioMixer() async => await Audio.enumAudioMixer() ?? [];

  @override
  Future<AudioDevice> getDefaultInputDevice() async =>
      (await Audio.getDefaultDevice(AudioDeviceType.input))!;

  @override
  Future<AudioDevice> getDefaultOutputDevice() async =>
      (await Audio.getDefaultDevice(AudioDeviceType.output))!;

  @override
  Future<List<AudioDevice>> getInputDevices() async =>
      await Audio.enumDevices(AudioDeviceType.input) ?? [];

  @override
  Future<double> getMicVolume() => Audio.getVolume(AudioDeviceType.input);

  @override
  Future<List<AudioDevice>> getOutputDevices() async =>
      (await Audio.enumDevices(AudioDeviceType.output)) ?? [];

  @override
  Future<double> getVolume() => Audio.getVolume(AudioDeviceType.output);

  @override
  Future<void> setDefaultDevice(String deviceId) => Audio.setDefaultDevice(
        deviceId,
      );

  @override
  Future<void> setMicVolume(double volume) => Audio.setVolume(volume, AudioDeviceType.input);

  @override
  Future<void> setMixerVolume(int deviceId, double volume) =>
      Audio.setAudioMixerVolume(deviceId, volume);

  @override
  Future<void> setVolume(double volume) => Audio.setVolume(volume, AudioDeviceType.output);

  @override
  Stream<List<AudioDevice>> getOutputDevicesStream() {
    return Stream.periodic(period, (i) => i).asyncMap((event) => getOutputDevices());
  }

  @override
  Stream<List<AudioDevice>> getInputDevicesStream() {
    return Stream.periodic(period, (i) => i).asyncMap((event) => getInputDevices());
  }

  @override
  Stream<List<ProcessVolume>> getAudioMixerStream() {
    return Stream.periodic(period, (i) => i).asyncMap((event) => getAudioMixer());
  }

  @override
  Stream<AudioDevice> getDefaultOutputDeviceStream() {
    return Stream.periodic(period, (i) => i).asyncMap((event) => getDefaultOutputDevice());
  }

  @override
  Stream<AudioDevice> getDefaultInputDeviceStream() {
    return Stream.periodic(period, (i) => i).asyncMap((event) => getDefaultInputDevice());
  }

  @override
  Stream<double> getVolumeStream() {
    return Stream.periodic(period, (i) => i).asyncMap((event) => getVolume());
  }

  @override
  Stream<double> getMicVolumeStream() {
    return Stream.periodic(period, (i) => i).asyncMap((event) => getMicVolume());
  }
}

final _iconCache = <String, Uint8List>{};

Future<Uint8List?> _getIcon(String path) async {
  Uint8List? icon;
  if (_iconCache.containsKey(path)) {
    icon = _iconCache[path]!;
  } else {
    icon = await WinIcons().extractFileIcon(path);
    if (icon != null) _iconCache[path] = icon;
  }
  return icon;
}

extension AudioDeviceListExtended on Stream<List<AudioDevice>> {
  Stream<String> toJson() async* {
    await for (var event in this) {
      final devices = <Map<String, dynamic>>[];
      for (var element in event) {
        final json = element.toMap();
        Uint8List? icon = await _getIcon(element.iconPath);
        if (icon != null) json['icon'] = icon;
        devices.add(json);
      }
      yield jsonEncode(devices);
    }
  }
}

extension ProcessVolumeExtended on Stream<List<ProcessVolume>> {
  Stream<String> toJson() async* {
    await for (var event in this) {
      final devices = <Map<String, dynamic>>[];
      for (var element in event) {
        final json = element.toMap();
        Uint8List? icon = await _getIcon(element.processPath);
        if (icon != null) json['icon'] = icon;
        devices.add(json);
      }
      yield jsonEncode(devices);
    }
  }
}

extension AudioDeviceExtended on Stream<AudioDevice> {
  Stream<String> toJson() async* {
    await for (var event in this) {
      final json = event.toMap();
      Uint8List? icon = await _getIcon(event.iconPath);
      if (icon != null) json['icon'] = icon;
      yield jsonEncode(json);
    }
  }
}
