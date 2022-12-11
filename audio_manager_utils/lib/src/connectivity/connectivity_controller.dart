// 🎯 Dart imports:
import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../utils/utils.dart';
import 'connectivity.dart';

typedef OnConnectivityChanged = void Function(bool canDoApiCalls);

final connectivityControllerProvider =
    StateNotifierProvider<ConnectivityController, ConnectivityResult>(
  ConnectivityController.new,
);

class ConnectivityController extends StateController<ConnectivityResult> {
  final ConnectivityService _connectivityService;

  ConnectivityController(Ref ref)
      : _connectivityService = ref.read(connectivityServiceProvider),
        super(ConnectivityResult.inital);

  bool get hasInternet => state != ConnectivityResult.none;

  ConnectivityResult get connectivityResult => state;

  String ip = '';
  Future<void> init() async {
    state = await _connectivityService.checkConnectivity();
    if (state != ConnectivityResult.none) {
      ip = await _connectivityService.getIp() ?? '';
    }

    _connectivityService.onConnectivityChanged.listen((event) async {
      state = event;
      logInfo('Connectivity status changed to ${event.name}');
      if (state != ConnectivityResult.none) {
        ip = await _connectivityService.getIp() ?? '';
      }
    });

    addListener((state) {
      logWarning('Connectivity status changed to ${state.name}');
    });
  }
}
