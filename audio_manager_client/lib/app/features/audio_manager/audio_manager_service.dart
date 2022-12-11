import 'dart:async';
import 'dart:convert';

import 'package:audio_manager_utils/audio_manager_utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../features.dart';

final audioManagerServiceProvider = Provider<AudioManagerService>(DioAudioMangerServiceImpl.new);

abstract class AudioManagerService {
  Stream<List<AudioDevice>> getOutputDevices();
  Future<void> setVolume(double volume);
  Stream<double> getVolume();

  Stream<List<AudioDevice>> getInputDevices();
  Future<void> setMicVolume(double volume);
  Stream<double> getMicVolume();

  Stream<List<ProcessVolume>> getAudioMixer();

  Stream<AudioDevice> getDefaultOutputDevice();
  Stream<AudioDevice> getDefaultInputDevice();

  Future<void> setMixerVolume(int deviceId, double volume);
  Future<void> setDefaultDevice(String deviceId);
}

class DioAudioMangerServiceImpl extends AudioManagerService {
  final DioClient dio;
  final Ref ref;

  DioAudioMangerServiceImpl(this.ref) : dio = ref.watch(dioProvider);

  @override
  Stream<List<AudioDevice>> getOutputDevices() async* {
    final websocket = ref.watch(webSocketHelperProvider('output-devices'));
    await websocket.connect();

    await for (final event in websocket.onData()) {
      final data = (jsonDecode(event) as List).cast<Map<String, dynamic>>();

      yield data.map(AudioDevice.fromJson).toList();
    }
  }

  @override
  Stream<double> getVolume() async* {
    final websocket = ref.watch(webSocketHelperProvider('volume'));
    await websocket.connect();

    await for (final event in websocket.onData()) {
      yield double.parse(event);
    }
  }

  @override
  Stream<List<ProcessVolume>> getAudioMixer() async* {
    final websocket = ref.watch(webSocketHelperProvider('audio-mixer'));
    await websocket.connect();

    await for (final event in websocket.onData()) {
      final data = (jsonDecode(event) as List).cast<Map<String, dynamic>>();

      yield data.map(ProcessVolume.fromJson).toList();
    }
  }

  @override
  Stream<AudioDevice> getDefaultInputDevice() async* {
    final websocket = ref.watch(webSocketHelperProvider('default-input-device'));
    await websocket.connect();

    await for (final event in websocket.onData()) {
      yield AudioDevice.fromJson(jsonDecode(event));
    }
  }

  @override
  Stream<AudioDevice> getDefaultOutputDevice() async* {
    final websocket = ref.watch(webSocketHelperProvider('default-output-device'));
    await websocket.connect();

    await for (final event in websocket.onData()) {
      yield AudioDevice.fromJson(jsonDecode(event));
    }
  }

  @override
  Stream<List<AudioDevice>> getInputDevices() async* {
    final websocket = ref.watch(webSocketHelperProvider('input-devices'));
    await websocket.connect();

    await for (final event in websocket.onData()) {
      final data = (jsonDecode(event) as List).cast<Map<String, dynamic>>();

      yield data.map(AudioDevice.fromJson).toList();
    }
  }

  @override
  Stream<double> getMicVolume() async* {
    final websocket = ref.watch(webSocketHelperProvider('mic-volume'));
    await websocket.connect();

    await for (final event in websocket.onData()) {
      yield double.parse(event);
    }
  }

  @override
  Future<void> setDefaultDevice(String deviceId) =>
      dio.post('/default-device', data: {'deviceId': deviceId});

  @override
  Future<void> setMicVolume(double volume) => dio.post('/mic-volume', data: {'volume': volume});

  @override
  Future<void> setMixerVolume(int deviceId, double volume) =>
      dio.post('/mixer-volume', data: {'deviceId': deviceId, 'volume': volume});
  @override
  Future<void> setVolume(double volume) => dio.post('/volume', data: {'volume': volume});
}
