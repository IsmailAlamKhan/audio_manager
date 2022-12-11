import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:win32audio/win32audio.dart';

import '../features.dart';

part 'audio_manager_providers.g.dart';

@riverpod
Future<List<AudioDevice>> getOutputDevices(Ref ref) {
  final audioManagerService = ref.watch(audioManagerServiceProvider);
  return audioManagerService.getOutputDevices();
}

@riverpod
Future<List<AudioDevice>> getInputDevices(Ref ref) {
  final audioManagerService = ref.watch(audioManagerServiceProvider);
  return audioManagerService.getInputDevices();
}

@riverpod
Future<List<ProcessVolume>> getAudioMixer(Ref ref) {
  final audioManagerService = ref.watch(audioManagerServiceProvider);
  return audioManagerService.getAudioMixer();
}

@riverpod
Future<AudioDevice> getDefaultOutputDevice(Ref ref) {
  final audioManagerService = ref.watch(audioManagerServiceProvider);
  return audioManagerService.getDefaultOutputDevice();
}

@riverpod
Future<AudioDevice> getDefaultInputDevice(Ref ref) {
  final audioManagerService = ref.watch(audioManagerServiceProvider);
  return audioManagerService.getDefaultInputDevice();
}

@riverpod
Future<double> getVolume(Ref ref) {
  final audioManagerService = ref.watch(audioManagerServiceProvider);
  return audioManagerService.getVolume();
}

@riverpod
Future<double> getMicVolume(Ref ref) {
  final audioManagerService = ref.watch(audioManagerServiceProvider);
  return audioManagerService.getMicVolume();
}
