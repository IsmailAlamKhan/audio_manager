// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audio_manager_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AudioDevice _$AudioDeviceFromJson(Map<String, dynamic> json) {
  return _AudioDevice.fromJson(json);
}

/// @nodoc
mixin _$AudioDevice {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get iconPath => throw _privateConstructorUsedError;
  @Uint8ListConverter()
  Uint8List? get icon => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AudioDeviceCopyWith<AudioDevice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AudioDeviceCopyWith<$Res> {
  factory $AudioDeviceCopyWith(
          AudioDevice value, $Res Function(AudioDevice) then) =
      _$AudioDeviceCopyWithImpl<$Res, AudioDevice>;
  @useResult
  $Res call(
      {String id,
      String name,
      String iconPath,
      @Uint8ListConverter() Uint8List? icon,
      bool isActive});
}

/// @nodoc
class _$AudioDeviceCopyWithImpl<$Res, $Val extends AudioDevice>
    implements $AudioDeviceCopyWith<$Res> {
  _$AudioDeviceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? iconPath = null,
    Object? icon = freezed,
    Object? isActive = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      iconPath: null == iconPath
          ? _value.iconPath
          : iconPath // ignore: cast_nullable_to_non_nullable
              as String,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AudioDeviceCopyWith<$Res>
    implements $AudioDeviceCopyWith<$Res> {
  factory _$$_AudioDeviceCopyWith(
          _$_AudioDevice value, $Res Function(_$_AudioDevice) then) =
      __$$_AudioDeviceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String iconPath,
      @Uint8ListConverter() Uint8List? icon,
      bool isActive});
}

/// @nodoc
class __$$_AudioDeviceCopyWithImpl<$Res>
    extends _$AudioDeviceCopyWithImpl<$Res, _$_AudioDevice>
    implements _$$_AudioDeviceCopyWith<$Res> {
  __$$_AudioDeviceCopyWithImpl(
      _$_AudioDevice _value, $Res Function(_$_AudioDevice) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? iconPath = null,
    Object? icon = freezed,
    Object? isActive = null,
  }) {
    return _then(_$_AudioDevice(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      iconPath: null == iconPath
          ? _value.iconPath
          : iconPath // ignore: cast_nullable_to_non_nullable
              as String,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AudioDevice implements _AudioDevice {
  const _$_AudioDevice(
      {required this.id,
      required this.name,
      required this.iconPath,
      @Uint8ListConverter() this.icon,
      required this.isActive});

  factory _$_AudioDevice.fromJson(Map<String, dynamic> json) =>
      _$$_AudioDeviceFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String iconPath;
  @override
  @Uint8ListConverter()
  final Uint8List? icon;
  @override
  final bool isActive;

  @override
  String toString() {
    return 'AudioDevice(id: $id, name: $name, iconPath: $iconPath, icon: $icon, isActive: $isActive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AudioDevice &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.iconPath, iconPath) ||
                other.iconPath == iconPath) &&
            const DeepCollectionEquality().equals(other.icon, icon) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, iconPath,
      const DeepCollectionEquality().hash(icon), isActive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AudioDeviceCopyWith<_$_AudioDevice> get copyWith =>
      __$$_AudioDeviceCopyWithImpl<_$_AudioDevice>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AudioDeviceToJson(
      this,
    );
  }
}

abstract class _AudioDevice implements AudioDevice {
  const factory _AudioDevice(
      {required final String id,
      required final String name,
      required final String iconPath,
      @Uint8ListConverter() final Uint8List? icon,
      required final bool isActive}) = _$_AudioDevice;

  factory _AudioDevice.fromJson(Map<String, dynamic> json) =
      _$_AudioDevice.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get iconPath;
  @override
  @Uint8ListConverter()
  Uint8List? get icon;
  @override
  bool get isActive;
  @override
  @JsonKey(ignore: true)
  _$$_AudioDeviceCopyWith<_$_AudioDevice> get copyWith =>
      throw _privateConstructorUsedError;
}

ProcessVolume _$ProcessVolumeFromJson(Map<String, dynamic> json) {
  return _ProcessVolume.fromJson(json);
}

/// @nodoc
mixin _$ProcessVolume {
  int get processId => throw _privateConstructorUsedError;
  String get processPath => throw _privateConstructorUsedError;
  double get peakVolume => throw _privateConstructorUsedError;
  double get maxVolume => throw _privateConstructorUsedError;
  @Uint8ListConverter()
  Uint8List? get icon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProcessVolumeCopyWith<ProcessVolume> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProcessVolumeCopyWith<$Res> {
  factory $ProcessVolumeCopyWith(
          ProcessVolume value, $Res Function(ProcessVolume) then) =
      _$ProcessVolumeCopyWithImpl<$Res, ProcessVolume>;
  @useResult
  $Res call(
      {int processId,
      String processPath,
      double peakVolume,
      double maxVolume,
      @Uint8ListConverter() Uint8List? icon});
}

/// @nodoc
class _$ProcessVolumeCopyWithImpl<$Res, $Val extends ProcessVolume>
    implements $ProcessVolumeCopyWith<$Res> {
  _$ProcessVolumeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? processId = null,
    Object? processPath = null,
    Object? peakVolume = null,
    Object? maxVolume = null,
    Object? icon = freezed,
  }) {
    return _then(_value.copyWith(
      processId: null == processId
          ? _value.processId
          : processId // ignore: cast_nullable_to_non_nullable
              as int,
      processPath: null == processPath
          ? _value.processPath
          : processPath // ignore: cast_nullable_to_non_nullable
              as String,
      peakVolume: null == peakVolume
          ? _value.peakVolume
          : peakVolume // ignore: cast_nullable_to_non_nullable
              as double,
      maxVolume: null == maxVolume
          ? _value.maxVolume
          : maxVolume // ignore: cast_nullable_to_non_nullable
              as double,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProcessVolumeCopyWith<$Res>
    implements $ProcessVolumeCopyWith<$Res> {
  factory _$$_ProcessVolumeCopyWith(
          _$_ProcessVolume value, $Res Function(_$_ProcessVolume) then) =
      __$$_ProcessVolumeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int processId,
      String processPath,
      double peakVolume,
      double maxVolume,
      @Uint8ListConverter() Uint8List? icon});
}

/// @nodoc
class __$$_ProcessVolumeCopyWithImpl<$Res>
    extends _$ProcessVolumeCopyWithImpl<$Res, _$_ProcessVolume>
    implements _$$_ProcessVolumeCopyWith<$Res> {
  __$$_ProcessVolumeCopyWithImpl(
      _$_ProcessVolume _value, $Res Function(_$_ProcessVolume) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? processId = null,
    Object? processPath = null,
    Object? peakVolume = null,
    Object? maxVolume = null,
    Object? icon = freezed,
  }) {
    return _then(_$_ProcessVolume(
      processId: null == processId
          ? _value.processId
          : processId // ignore: cast_nullable_to_non_nullable
              as int,
      processPath: null == processPath
          ? _value.processPath
          : processPath // ignore: cast_nullable_to_non_nullable
              as String,
      peakVolume: null == peakVolume
          ? _value.peakVolume
          : peakVolume // ignore: cast_nullable_to_non_nullable
              as double,
      maxVolume: null == maxVolume
          ? _value.maxVolume
          : maxVolume // ignore: cast_nullable_to_non_nullable
              as double,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProcessVolume extends _ProcessVolume {
  const _$_ProcessVolume(
      {required this.processId,
      required this.processPath,
      required this.peakVolume,
      required this.maxVolume,
      @Uint8ListConverter() this.icon})
      : super._();

  factory _$_ProcessVolume.fromJson(Map<String, dynamic> json) =>
      _$$_ProcessVolumeFromJson(json);

  @override
  final int processId;
  @override
  final String processPath;
  @override
  final double peakVolume;
  @override
  final double maxVolume;
  @override
  @Uint8ListConverter()
  final Uint8List? icon;

  @override
  String toString() {
    return 'ProcessVolume(processId: $processId, processPath: $processPath, peakVolume: $peakVolume, maxVolume: $maxVolume, icon: $icon)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProcessVolume &&
            (identical(other.processId, processId) ||
                other.processId == processId) &&
            (identical(other.processPath, processPath) ||
                other.processPath == processPath) &&
            (identical(other.peakVolume, peakVolume) ||
                other.peakVolume == peakVolume) &&
            (identical(other.maxVolume, maxVolume) ||
                other.maxVolume == maxVolume) &&
            const DeepCollectionEquality().equals(other.icon, icon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, processId, processPath,
      peakVolume, maxVolume, const DeepCollectionEquality().hash(icon));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProcessVolumeCopyWith<_$_ProcessVolume> get copyWith =>
      __$$_ProcessVolumeCopyWithImpl<_$_ProcessVolume>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProcessVolumeToJson(
      this,
    );
  }
}

abstract class _ProcessVolume extends ProcessVolume {
  const factory _ProcessVolume(
      {required final int processId,
      required final String processPath,
      required final double peakVolume,
      required final double maxVolume,
      @Uint8ListConverter() final Uint8List? icon}) = _$_ProcessVolume;
  const _ProcessVolume._() : super._();

  factory _ProcessVolume.fromJson(Map<String, dynamic> json) =
      _$_ProcessVolume.fromJson;

  @override
  int get processId;
  @override
  String get processPath;
  @override
  double get peakVolume;
  @override
  double get maxVolume;
  @override
  @Uint8ListConverter()
  Uint8List? get icon;
  @override
  @JsonKey(ignore: true)
  _$$_ProcessVolumeCopyWith<_$_ProcessVolume> get copyWith =>
      throw _privateConstructorUsedError;
}
