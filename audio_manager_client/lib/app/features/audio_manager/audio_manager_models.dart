import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'audio_manager_models.freezed.dart';
part 'audio_manager_models.g.dart';

@freezed
class AudioDevice with _$AudioDevice {
  const AudioDevice._();
  const factory AudioDevice({
    required String id,
    required String name,
    required String iconPath,
    @Uint8ListConverter() Uint8List? icon,
    required bool isActive,
  }) = _AudioDevice;
  factory AudioDevice.fromJson(Map<String, dynamic> json) => _$AudioDeviceFromJson(json);
}

@freezed
class ProcessVolume with _$ProcessVolume {
  const ProcessVolume._();
  const factory ProcessVolume({
    required int processId,
    required String processPath,
    required double peakVolume,
    required double maxVolume,
    @Uint8ListConverter() Uint8List? icon,
  }) = _ProcessVolume;
  String get name => processPath.split('\\').last;

  double get volume => peakVolume * maxVolume;

  factory ProcessVolume.fromJson(Map<String, dynamic> json) => _$ProcessVolumeFromJson(json);
}

class Uint8ListConverter implements JsonConverter<Uint8List?, List?> {
  const Uint8ListConverter();

  @override
  Uint8List? fromJson(List? json) => json != null ? Uint8List.fromList(json.cast<int>()) : null;

  @override
  List? toJson(Uint8List? object) => object?.toList();
}
