import 'package:audio_manager_utils/audio_manager_utils.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../features.dart';

final audioManagerControllerProvider = ChangeNotifierProvider<AudioManagerController>(
  AudioManagerController.new,
);

class AudioManagerController extends ChangeNotifier {
  final debounce = Debouncer(milliseconds: 500);
  final AudioManagerService service;
  AudioManagerController(Ref ref) : service = ref.read(audioManagerServiceProvider);

  Future<void> setOutputDeviceVolumn(double value) => service.setVolume(value);

  Future<void> setInputDeviceVolumn(double value) => service.setMicVolume(value);

  Future<void> setDefaultDevice(AudioDevice device) => service.setDefaultDevice(device.id);

  Future<void> setAudioMixerVolume(ProcessVolume process, double value) =>
      service.setMixerVolume(process.processId, value);
}
