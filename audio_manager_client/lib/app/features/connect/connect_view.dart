import 'package:audio_manager_utils/audio_manager_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../features.dart';

class ConnectView extends HookConsumerWidget {
  const ConnectView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(connectControllerProvider);
    final env = ref.watch(envControllerProvider);

    final tec = useTextEditingController(text: env.ip);
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        tec.text = env.ip;
      });
    }, [env]);
    return Scaffold(
      appBar: AppBar(title: const Text('Connect')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text('Open the app on your PC and enter the IP address below'),
                const SizedBox(height: 16),
                TextField(
                  controller: tec,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'IP Address',
                  ),
                ),
                const SizedBox(height: 16),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => controller.connect(tec.text),
                  child: const Text('Connect'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
