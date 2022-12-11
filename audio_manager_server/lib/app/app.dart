import 'package:audio_manager_utils/audio_manager_utils.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:window_manager/window_manager.dart';

import 'features/features.dart';

class App {
  static Future<void> run() async {
    WidgetsFlutterBinding.ensureInitialized();
    await windowManager.ensureInitialized();
    const size = Size(400, 400);
    WindowOptions windowOptions = const WindowOptions(
      size: size,
      minimumSize: size,
      maximumSize: size,

      // backgroundColor: Colors.transparent,
      skipTaskbar: false,
      titleBarStyle: TitleBarStyle.normal,
      title: 'Audio Manager',
    );
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
    final providerContainer = ProviderContainer();
    final networkInfo = await providerContainer.read(networkInfoProvider.future);
    final server = providerContainer.read(serverControllerProvider);
    server.init(networkInfo);
    runApp(UncontrolledProviderScope(container: providerContainer, child: const _App()));
  }
}

class _App extends ConsumerWidget {
  const _App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      theme: AppTheme.lightThemeData(),
      darkTheme: AppTheme.darkThemeData(),
      home: const HomeView(),
    );
  }
}
