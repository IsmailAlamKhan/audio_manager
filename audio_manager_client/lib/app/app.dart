import 'package:audio_manager_utils/audio_manager_utils.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'features/features.dart';

class App {
  static Future<void> run() async {
    WidgetsFlutterBinding.ensureInitialized();
    AppLogger.init();
    NavigatorService.init();
    final container = ProviderContainer();
    await container.read(localStorageProvider).init();

    runApp(UncontrolledProviderScope(container: container, child: const _App()));
  }
}

class _App extends ConsumerWidget {
  const _App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      navigatorKey: NavigatorService.instance.navigatorKey(false),
      theme: AppTheme.lightThemeData(),
      darkTheme: AppTheme.darkThemeData(),
      builder: (context, child) {
        return GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: NavigationEventListener(
            navigator: NavigatorService.instance.navigatorKey(false),
            child: child!,
          ),
        );
      },
      home: const ConnectView(),
    );
  }
}
