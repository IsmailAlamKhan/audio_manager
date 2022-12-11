import 'package:audio_manager_utils/audio_manager_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../features/features.dart';

class DevicesView extends HookConsumerWidget {
  const DevicesView({
    super.key,
    required this.devices,
    required this.title,
    required this.volume,
    required this.onVolumeChanged,
  });
  final AsyncValue<List<AudioDevice>> devices;
  final String title;
  final ValueChanged<double> onVolumeChanged;
  final double volume;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final volume = useState(this.volume);
    useEffect(() {
      volume.value = this.volume;
    }, [this.volume]);

    void onVolumeChanged(double value) {
      volume.value = value;
      this.onVolumeChanged(value);
    }

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 500, maxHeight: 700),
        child: AlertDialog(
          title: Text(title),
          scrollable: true,
          content: Column(
            children: [
              Slider(
                value: volume.value,
                onChanged: onVolumeChanged,
              ),
              AsyncValueBuilder(
                value: devices,
                builder: (context, value) {
                  return Column(
                    children: ListTile.divideTiles(
                      context: context,
                      tiles: value.map(
                        (device) => CheckboxListTile(
                          title: Text(device.name),
                          secondary: FileIconViewer(icon: device.icon),
                          value: device.isActive,
                          onChanged: (value) {
                            ref.read(audioManagerControllerProvider).setDefaultDevice(device);
                          },
                        ),
                      ),
                    ).toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
