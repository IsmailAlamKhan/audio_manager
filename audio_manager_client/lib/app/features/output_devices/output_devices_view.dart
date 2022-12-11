import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/shared.dart';
import '../features.dart';

class OutputDevicesView extends ConsumerWidget {
  const OutputDevicesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final outputDevices = ref.watch(outputDevicesProvider);
    final volume = ref.watch(volumeProvider);
    return DevicesView(
      volume: volume.when(
        data: (value) => value,
        loading: () => 0,
        error: (error, stack) => 0,
      ),
      title: 'Output devices',
      devices: outputDevices,
      onVolumeChanged: ref.read(audioManagerControllerProvider).setOutputDeviceVolumn,
    );
  }
}
