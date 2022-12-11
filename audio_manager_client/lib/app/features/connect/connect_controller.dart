import 'package:audio_manager_utils/audio_manager_utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../features.dart';

final connectControllerProvider = Provider(ConnectController.new);

class ConnectController with NavigationController {
  final LocalStorage localStorage;
  final EnvController envController;
  final WebSocketHelper webSocketHelper;
  @override
  final EventBus eventBus;

  ConnectController(Ref ref)
      : localStorage = ref.read(localStorageProvider),
        envController = ref.watch(envControllerProvider.notifier),
        webSocketHelper = ref.watch(webSocketHelperProvider('connect')),
        eventBus = ref.read(eventBusProvider) {
    localStorage.get<String?>(LocalStorageKeys.lastConnectedIp).then((value) {
      envController.setIp(value ?? '');
    });
  }

  void connect(String ip) {
    localStorage.set(LocalStorageKeys.lastConnectedIp, ip);
    envController.setIp(ip);
    runAsync(
      action: () async {
        await webSocketHelper.connect();
        pushAndRemoveAll((context) => const HomeView());
      },
      methodName: 'connect',
    );
  }

  void disconnect() {
    envController.setIp('');
    runAsync(
      action: () async {
        WebSocketHelper.closeAll();
        pushAndRemoveAll((context) => const ConnectView());
      },
      methodName: 'disconnect',
    );
  }
}
