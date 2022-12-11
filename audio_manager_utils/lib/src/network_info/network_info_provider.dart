import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../audio_manager_utils.dart';

part 'network_info_provider.g.dart';

@Riverpod(keepAlive: true)
Future<NetworkInfo> networkInfo(Ref ref) async {
  final connectivity = ref.watch(connectivityControllerProvider);
  if (connectivity == ConnectivityResult.none) {
    return const NetworkInfo.disconnected();
  }
  final networkInfoService = ref.read(networkInfoServiceProvider);
  return networkInfoService.getNetworkInfo();
}
