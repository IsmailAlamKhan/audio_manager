import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:network_info_plus/network_info_plus.dart' as network_info;

import 'network_info.dart';

final networkInfoServiceProvider = Provider((ref) => NetworkInfoServiceImpl());

abstract class NetworkInfoService {
  Future<NetworkInfo> getNetworkInfo();
}

class NetworkInfoServiceImpl extends NetworkInfoService {
  final networkInfo = network_info.NetworkInfo();
  @override
  Future<NetworkInfo> getNetworkInfo() async {
    try {
      final wifiIpAddress = await networkInfo.getWifiIP();
      final wifiName = await networkInfo.getWifiName();
      return NetworkInfo.connected(wifiName: wifiName!, wifiIpAddress: wifiIpAddress!);
    } on PlatformException catch (e) {
      if (e.code == '5023') {
        return const NetworkInfo.disconnected();
      }
      rethrow;
    }
  }
}
