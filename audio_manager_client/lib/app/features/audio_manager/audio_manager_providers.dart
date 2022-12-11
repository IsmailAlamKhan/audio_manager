import 'package:audio_manager_utils/audio_manager_utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../features.dart';

final outputDevicesProvider = StreamProvider<List<AudioDevice>>((Ref ref) {
  final audioManagerService = ref.watch(audioManagerServiceProvider);

  return audioManagerService.getOutputDevices().handleError((Object error, StackTrace stackTrace) {
    logError('outputDevicesProvider', error: error, stackTrace: stackTrace);
  });
});

final inputDevicesProvider = StreamProvider<List<AudioDevice>>((Ref ref) {
  final audioManagerService = ref.watch(audioManagerServiceProvider);

  return audioManagerService.getInputDevices().handleError((Object error, StackTrace stackTrace) {
    logError('inputDevicesProvider', error: error, stackTrace: stackTrace);
  });
});

final audioMixerProvider = StreamProvider<List<ProcessVolume>>((Ref ref) {
  final audioManagerService = ref.watch(audioManagerServiceProvider);

  return audioManagerService.getAudioMixer().handleError((Object error, StackTrace stackTrace) {
    logError('AudioMixerProvider', error: error, stackTrace: stackTrace);
  });
});
final defaultOutputDeviceProvider = StreamProvider<AudioDevice>((Ref ref) {
  final audioManagerService = ref.watch(audioManagerServiceProvider);

  return audioManagerService
      .getDefaultOutputDevice()
      .handleError((Object error, StackTrace stackTrace) {
    logError('defaultOutputDeviceProvider', error: error, stackTrace: stackTrace);
  });
});

final defaultInputDeviceProvider = StreamProvider<AudioDevice>((Ref ref) {
  final audioManagerService = ref.watch(audioManagerServiceProvider);

  return audioManagerService
      .getDefaultInputDevice()
      .handleError((Object error, StackTrace stackTrace) {
    logError('defaultInputDeviceProvider', error: error, stackTrace: stackTrace);
  });
});

final volumeProvider = StreamProvider<double>((Ref ref) {
  final audioManagerService = ref.watch(audioManagerServiceProvider);

  return audioManagerService.getVolume().handleError((Object error, StackTrace stackTrace) {
    logError('volumeProvider', error: error, stackTrace: stackTrace);
  });
});

final micVolumeProvider = StreamProvider<double>((Ref ref) {
  final audioManagerService = ref.watch(audioManagerServiceProvider);

  return audioManagerService.getMicVolume().handleError((Object error, StackTrace stackTrace) {
    logError('micVolumeProvider', error: error, stackTrace: stackTrace);
  });
});
