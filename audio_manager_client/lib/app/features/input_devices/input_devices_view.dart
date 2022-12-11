import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/shared.dart';
import '../features.dart';

class InputDevicesView extends ConsumerWidget {
  const InputDevicesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final devices = ref.watch(inputDevicesProvider);
    final volume = ref.watch(micVolumeProvider);
    return DevicesView(
      volume: volume.when(
        data: (value) => value,
        loading: () => 0,
        error: (error, stack) => 0,
      ),
      title: 'Input devices',
      devices: devices,
      onVolumeChanged: ref.read(audioManagerControllerProvider).setInputDeviceVolumn,
    );
  }
}
