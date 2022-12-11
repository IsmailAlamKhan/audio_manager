// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_manager_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AudioDevice _$$_AudioDeviceFromJson(Map<String, dynamic> json) =>
    _$_AudioDevice(
      id: json['id'] as String,
      name: json['name'] as String,
      iconPath: json['iconPath'] as String,
      icon: const Uint8ListConverter().fromJson(json['icon'] as List?),
      isActive: json['isActive'] as bool,
    );

Map<String, dynamic> _$$_AudioDeviceToJson(_$_AudioDevice instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'iconPath': instance.iconPath,
      'icon': const Uint8ListConverter().toJson(instance.icon),
      'isActive': instance.isActive,
    };

_$_ProcessVolume _$$_ProcessVolumeFromJson(Map<String, dynamic> json) =>
    _$_ProcessVolume(
      processId: json['processId'] as int,
      processPath: json['processPath'] as String,
      peakVolume: (json['peakVolume'] as num).toDouble(),
      maxVolume: (json['maxVolume'] as num).toDouble(),
      icon: const Uint8ListConverter().fromJson(json['icon'] as List?),
    );

Map<String, dynamic> _$$_ProcessVolumeToJson(_$_ProcessVolume instance) =>
    <String, dynamic>{
      'processId': instance.processId,
      'processPath': instance.processPath,
      'peakVolume': instance.peakVolume,
      'maxVolume': instance.maxVolume,
      'icon': const Uint8ListConverter().toJson(instance.icon),
    };
