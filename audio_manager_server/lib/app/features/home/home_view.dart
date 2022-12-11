import 'package:audio_manager_utils/audio_manager_utils.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../features.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final networkInfo = ref.watch(networkInfoProvider);
    final server = ref.watch(serverControllerProvider);
    return Scaffold(
      appBar: AppBar(title: const Text("Audio Manager Server")),
      body: Center(
        child: networkInfo.when(
          data: (data) => data.when(
            connected: (wifiIpAddress, wifiName) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Connected to $wifiName ($wifiIpAddress)"),
                const SizedBox(height: 16),
                if (!server.isRunning)
                  ElevatedButton(
                    onPressed: () => server.start(),
                    child: const Text("Start Server"),
                  )
                else
                  ElevatedButton(
                    onPressed: () => server.stop(),
                    child: const Text("Stop Server"),
                  ),
              ],
            ),
            disconnected: () => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("You are not connected to a network please connect and try again"),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => ref.invalidate(networkInfoProvider),
                  child: const Text("Refresh"),
                ),
              ],
            ),
          ),
          loading: () => const CircularProgressIndicator(),
          error: (error, stack) => Text(error.toString()),
        ),
      ),
    );
  }
}
