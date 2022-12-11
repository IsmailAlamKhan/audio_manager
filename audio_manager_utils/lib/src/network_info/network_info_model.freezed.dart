// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'network_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NetworkInfo {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String wifiIpAddress, String wifiName) connected,
    required TResult Function() disconnected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String wifiIpAddress, String wifiName)? connected,
    TResult? Function()? disconnected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String wifiIpAddress, String wifiName)? connected,
    TResult Function()? disconnected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NetworkInfo value) connected,
    required TResult Function(_Disconnected value) disconnected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NetworkInfo value)? connected,
    TResult? Function(_Disconnected value)? disconnected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NetworkInfo value)? connected,
    TResult Function(_Disconnected value)? disconnected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkInfoCopyWith<$Res> {
  factory $NetworkInfoCopyWith(
          NetworkInfo value, $Res Function(NetworkInfo) then) =
      _$NetworkInfoCopyWithImpl<$Res, NetworkInfo>;
}

/// @nodoc
class _$NetworkInfoCopyWithImpl<$Res, $Val extends NetworkInfo>
    implements $NetworkInfoCopyWith<$Res> {
  _$NetworkInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_NetworkInfoCopyWith<$Res> {
  factory _$$_NetworkInfoCopyWith(
          _$_NetworkInfo value, $Res Function(_$_NetworkInfo) then) =
      __$$_NetworkInfoCopyWithImpl<$Res>;
  @useResult
  $Res call({String wifiIpAddress, String wifiName});
}

/// @nodoc
class __$$_NetworkInfoCopyWithImpl<$Res>
    extends _$NetworkInfoCopyWithImpl<$Res, _$_NetworkInfo>
    implements _$$_NetworkInfoCopyWith<$Res> {
  __$$_NetworkInfoCopyWithImpl(
      _$_NetworkInfo _value, $Res Function(_$_NetworkInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wifiIpAddress = null,
    Object? wifiName = null,
  }) {
    return _then(_$_NetworkInfo(
      wifiIpAddress: null == wifiIpAddress
          ? _value.wifiIpAddress
          : wifiIpAddress // ignore: cast_nullable_to_non_nullable
              as String,
      wifiName: null == wifiName
          ? _value.wifiName
          : wifiName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_NetworkInfo implements _NetworkInfo {
  const _$_NetworkInfo({required this.wifiIpAddress, required this.wifiName});

  @override
  final String wifiIpAddress;
  @override
  final String wifiName;

  @override
  String toString() {
    return 'NetworkInfo.connected(wifiIpAddress: $wifiIpAddress, wifiName: $wifiName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NetworkInfo &&
            (identical(other.wifiIpAddress, wifiIpAddress) ||
                other.wifiIpAddress == wifiIpAddress) &&
            (identical(other.wifiName, wifiName) ||
                other.wifiName == wifiName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, wifiIpAddress, wifiName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NetworkInfoCopyWith<_$_NetworkInfo> get copyWith =>
      __$$_NetworkInfoCopyWithImpl<_$_NetworkInfo>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String wifiIpAddress, String wifiName) connected,
    required TResult Function() disconnected,
  }) {
    return connected(wifiIpAddress, wifiName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String wifiIpAddress, String wifiName)? connected,
    TResult? Function()? disconnected,
  }) {
    return connected?.call(wifiIpAddress, wifiName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String wifiIpAddress, String wifiName)? connected,
    TResult Function()? disconnected,
    required TResult orElse(),
  }) {
    if (connected != null) {
      return connected(wifiIpAddress, wifiName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NetworkInfo value) connected,
    required TResult Function(_Disconnected value) disconnected,
  }) {
    return connected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NetworkInfo value)? connected,
    TResult? Function(_Disconnected value)? disconnected,
  }) {
    return connected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NetworkInfo value)? connected,
    TResult Function(_Disconnected value)? disconnected,
    required TResult orElse(),
  }) {
    if (connected != null) {
      return connected(this);
    }
    return orElse();
  }
}

abstract class _NetworkInfo implements NetworkInfo {
  const factory _NetworkInfo(
      {required final String wifiIpAddress,
      required final String wifiName}) = _$_NetworkInfo;

  String get wifiIpAddress;
  String get wifiName;
  @JsonKey(ignore: true)
  _$$_NetworkInfoCopyWith<_$_NetworkInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DisconnectedCopyWith<$Res> {
  factory _$$_DisconnectedCopyWith(
          _$_Disconnected value, $Res Function(_$_Disconnected) then) =
      __$$_DisconnectedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_DisconnectedCopyWithImpl<$Res>
    extends _$NetworkInfoCopyWithImpl<$Res, _$_Disconnected>
    implements _$$_DisconnectedCopyWith<$Res> {
  __$$_DisconnectedCopyWithImpl(
      _$_Disconnected _value, $Res Function(_$_Disconnected) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Disconnected implements _Disconnected {
  const _$_Disconnected();

  @override
  String toString() {
    return 'NetworkInfo.disconnected()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Disconnected);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String wifiIpAddress, String wifiName) connected,
    required TResult Function() disconnected,
  }) {
    return disconnected();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String wifiIpAddress, String wifiName)? connected,
    TResult? Function()? disconnected,
  }) {
    return disconnected?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String wifiIpAddress, String wifiName)? connected,
    TResult Function()? disconnected,
    required TResult orElse(),
  }) {
    if (disconnected != null) {
      return disconnected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NetworkInfo value) connected,
    required TResult Function(_Disconnected value) disconnected,
  }) {
    return disconnected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NetworkInfo value)? connected,
    TResult? Function(_Disconnected value)? disconnected,
  }) {
    return disconnected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NetworkInfo value)? connected,
    TResult Function(_Disconnected value)? disconnected,
    required TResult orElse(),
  }) {
    if (disconnected != null) {
      return disconnected(this);
    }
    return orElse();
  }
}

abstract class _Disconnected implements NetworkInfo {
  const factory _Disconnected() = _$_Disconnected;
}
