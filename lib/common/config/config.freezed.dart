// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GlobalConfig _$GlobalConfigFromJson(Map<String, dynamic> json) {
  return _GlobalConfig.fromJson(json);
}

/// @nodoc
mixin _$GlobalConfig {
  String get host => throw _privateConstructorUsedError;
  String get port => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GlobalConfigCopyWith<GlobalConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GlobalConfigCopyWith<$Res> {
  factory $GlobalConfigCopyWith(
          GlobalConfig value, $Res Function(GlobalConfig) then) =
      _$GlobalConfigCopyWithImpl<$Res, GlobalConfig>;
  @useResult
  $Res call({String host, String port, String username, String password});
}

/// @nodoc
class _$GlobalConfigCopyWithImpl<$Res, $Val extends GlobalConfig>
    implements $GlobalConfigCopyWith<$Res> {
  _$GlobalConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? host = null,
    Object? port = null,
    Object? username = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      host: null == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
      port: null == port
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GlobalConfigCopyWith<$Res>
    implements $GlobalConfigCopyWith<$Res> {
  factory _$$_GlobalConfigCopyWith(
          _$_GlobalConfig value, $Res Function(_$_GlobalConfig) then) =
      __$$_GlobalConfigCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String host, String port, String username, String password});
}

/// @nodoc
class __$$_GlobalConfigCopyWithImpl<$Res>
    extends _$GlobalConfigCopyWithImpl<$Res, _$_GlobalConfig>
    implements _$$_GlobalConfigCopyWith<$Res> {
  __$$_GlobalConfigCopyWithImpl(
      _$_GlobalConfig _value, $Res Function(_$_GlobalConfig) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? host = null,
    Object? port = null,
    Object? username = null,
    Object? password = null,
  }) {
    return _then(_$_GlobalConfig(
      host: null == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
      port: null == port
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GlobalConfig with DiagnosticableTreeMixin implements _GlobalConfig {
  const _$_GlobalConfig(
      {required this.host,
      required this.port,
      required this.username,
      required this.password});

  factory _$_GlobalConfig.fromJson(Map<String, dynamic> json) =>
      _$$_GlobalConfigFromJson(json);

  @override
  final String host;
  @override
  final String port;
  @override
  final String username;
  @override
  final String password;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GlobalConfig(host: $host, port: $port, username: $username, password: $password)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GlobalConfig'))
      ..add(DiagnosticsProperty('host', host))
      ..add(DiagnosticsProperty('port', port))
      ..add(DiagnosticsProperty('username', username))
      ..add(DiagnosticsProperty('password', password));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GlobalConfig &&
            (identical(other.host, host) || other.host == host) &&
            (identical(other.port, port) || other.port == port) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, host, port, username, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GlobalConfigCopyWith<_$_GlobalConfig> get copyWith =>
      __$$_GlobalConfigCopyWithImpl<_$_GlobalConfig>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GlobalConfigToJson(
      this,
    );
  }
}

abstract class _GlobalConfig implements GlobalConfig {
  const factory _GlobalConfig(
      {required final String host,
      required final String port,
      required final String username,
      required final String password}) = _$_GlobalConfig;

  factory _GlobalConfig.fromJson(Map<String, dynamic> json) =
      _$_GlobalConfig.fromJson;

  @override
  String get host;
  @override
  String get port;
  @override
  String get username;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$_GlobalConfigCopyWith<_$_GlobalConfig> get copyWith =>
      throw _privateConstructorUsedError;
}
