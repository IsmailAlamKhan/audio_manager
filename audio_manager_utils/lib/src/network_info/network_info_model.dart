import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_info_model.freezed.dart';

@freezed
class NetworkInfo with _$NetworkInfo {
  const factory NetworkInfo.connected({
    required String wifiIpAddress,
    required String wifiName,
  }) = _NetworkInfo;

  const factory NetworkInfo.disconnected() = _Disconnected;
}
