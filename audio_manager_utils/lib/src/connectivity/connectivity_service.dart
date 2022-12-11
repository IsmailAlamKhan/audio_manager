import 'package:connectivity_plus/connectivity_plus.dart' as connectivity;
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:network_info_plus/network_info_plus.dart';

enum ConnectivityResult {
  bluetooth,

  wifi,

  ethernet,

  mobile,

  none,
  inital
}

final connectivityServiceProvider = Provider<ConnectivityService>((_) => ConnectivityServiceImpl());

abstract class ConnectivityService {
  Future<ConnectivityResult> checkConnectivity();
  Stream<ConnectivityResult> get onConnectivityChanged;

  Future<String?> getIp();
}

class ConnectivityServiceImpl implements ConnectivityService {
  final _connectivity = connectivity.Connectivity();
  final networkInfo = NetworkInfo();

  ConnectivityResult _getFromConnectivity(connectivity.ConnectivityResult connectivityResult) {
    return ConnectivityResult.values[connectivityResult.index];
  }

  @override
  Future<ConnectivityResult> checkConnectivity() async =>
      _getFromConnectivity(await _connectivity.checkConnectivity());

  @override
  Stream<ConnectivityResult> get onConnectivityChanged =>
      _connectivity.onConnectivityChanged.map(_getFromConnectivity);

  @override
  Future<String?> getIp() async {
    if (kIsWeb) return null;
    return networkInfo.getWifiIP();
  }
}
