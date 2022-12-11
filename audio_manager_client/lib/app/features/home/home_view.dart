import 'package:audio_manager_utils/audio_manager_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../features.dart';

class HomeView extends HookConsumerWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final audioMixer = ref.watch(audioMixerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connected'),
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            tooltip: 'Disconnect',
            onPressed: () {
              ref.read(connectControllerProvider).disconnect();
              Navigator.of(context).pushAndRemoveUntilBuilder((context) => const ConnectView());
            },
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              ListTile(
                title: const Text('Output devices'),
                onTap: () => Navigator.of(context).showDialog(
                  pageBuilder: (context) => const OutputDevicesView(),
                ),
              ),
              ListTile(
                title: const Text('Input devices'),
                onTap: () => Navigator.of(context).showDialog(
                  pageBuilder: (context) => const InputDevicesView(),
                ),
              ),
            ]),
          ),
          SliverAsyncValueBuilder(
            value: audioMixer,
            builder: (context, value) {
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: value.length,
                  (context, index) => ProccessVolumnWidget(proccess: value[index]),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class ProccessVolumnWidget extends HookConsumerWidget {
  const ProccessVolumnWidget({super.key, required this.proccess});

  final ProcessVolume proccess;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final proccess = useState(this.proccess);
    useEffect(() {
      proccess.value = this.proccess;
    }, [this.proccess]);
    return Column(
      children: [
        ListTile(
          title: Text(
            proccess.value.name,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          leading: FileIconViewer(icon: proccess.value.icon),
          subtitle: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackHeight: 2,
              trackShape: const CustomTrackShape(),
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 12),
            ),
            child: Slider(
              value: proccess.value.maxVolume,
              onChanged: (value) {
                proccess.value = proccess.value.copyWith(maxVolume: value);
                ref.read(audioManagerControllerProvider).setAudioMixerVolume(proccess.value, value);
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FAProgressBar(
            currentValue: proccess.value.volume,
            size: 3,
            maxValue: 1,
            progressColor: Theme.of(context).colorScheme.primary,
            formatValueFixed: 2,
            // minHeight: 2,
          ),
        ),
      ],
    );
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  const CustomTrackShape();
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight ?? 0.0;
    final double trackLeft = offset.dx;
    final double trackTop = offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
