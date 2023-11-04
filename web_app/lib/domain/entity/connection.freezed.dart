// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'connection.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Connection _$ConnectionFromJson(Map<String, dynamic> json) {
  return _Connection.fromJson(json);
}

/// @nodoc
mixin _$Connection {
  String get name => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'tg_user_id')
  String? get tgUserId => throw _privateConstructorUsedError;
  @JsonKey(name: 'api_key')
  String? get apikey => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConnectionCopyWith<Connection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConnectionCopyWith<$Res> {
  factory $ConnectionCopyWith(
          Connection value, $Res Function(Connection) then) =
      _$ConnectionCopyWithImpl<$Res, Connection>;
  @useResult
  $Res call(
      {String name,
      int? id,
      @JsonKey(name: 'tg_user_id') String? tgUserId,
      @JsonKey(name: 'api_key') String? apikey,
      String? url});
}

/// @nodoc
class _$ConnectionCopyWithImpl<$Res, $Val extends Connection>
    implements $ConnectionCopyWith<$Res> {
  _$ConnectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = freezed,
    Object? tgUserId = freezed,
    Object? apikey = freezed,
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      tgUserId: freezed == tgUserId
          ? _value.tgUserId
          : tgUserId // ignore: cast_nullable_to_non_nullable
              as String?,
      apikey: freezed == apikey
          ? _value.apikey
          : apikey // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConnectionImplCopyWith<$Res>
    implements $ConnectionCopyWith<$Res> {
  factory _$$ConnectionImplCopyWith(
          _$ConnectionImpl value, $Res Function(_$ConnectionImpl) then) =
      __$$ConnectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      int? id,
      @JsonKey(name: 'tg_user_id') String? tgUserId,
      @JsonKey(name: 'api_key') String? apikey,
      String? url});
}

/// @nodoc
class __$$ConnectionImplCopyWithImpl<$Res>
    extends _$ConnectionCopyWithImpl<$Res, _$ConnectionImpl>
    implements _$$ConnectionImplCopyWith<$Res> {
  __$$ConnectionImplCopyWithImpl(
      _$ConnectionImpl _value, $Res Function(_$ConnectionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = freezed,
    Object? tgUserId = freezed,
    Object? apikey = freezed,
    Object? url = freezed,
  }) {
    return _then(_$ConnectionImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      tgUserId: freezed == tgUserId
          ? _value.tgUserId
          : tgUserId // ignore: cast_nullable_to_non_nullable
              as String?,
      apikey: freezed == apikey
          ? _value.apikey
          : apikey // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConnectionImpl implements _Connection {
  _$ConnectionImpl(
      {required this.name,
      this.id,
      @JsonKey(name: 'tg_user_id') this.tgUserId,
      @JsonKey(name: 'api_key') this.apikey,
      this.url});

  factory _$ConnectionImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConnectionImplFromJson(json);

  @override
  final String name;
  @override
  final int? id;
  @override
  @JsonKey(name: 'tg_user_id')
  final String? tgUserId;
  @override
  @JsonKey(name: 'api_key')
  final String? apikey;
  @override
  final String? url;

  @override
  String toString() {
    return 'Connection(name: $name, id: $id, tgUserId: $tgUserId, apikey: $apikey, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnectionImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.tgUserId, tgUserId) ||
                other.tgUserId == tgUserId) &&
            (identical(other.apikey, apikey) || other.apikey == apikey) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, id, tgUserId, apikey, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConnectionImplCopyWith<_$ConnectionImpl> get copyWith =>
      __$$ConnectionImplCopyWithImpl<_$ConnectionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConnectionImplToJson(
      this,
    );
  }
}

abstract class _Connection implements Connection {
  factory _Connection(
      {required final String name,
      final int? id,
      @JsonKey(name: 'tg_user_id') final String? tgUserId,
      @JsonKey(name: 'api_key') final String? apikey,
      final String? url}) = _$ConnectionImpl;

  factory _Connection.fromJson(Map<String, dynamic> json) =
      _$ConnectionImpl.fromJson;

  @override
  String get name;
  @override
  int? get id;
  @override
  @JsonKey(name: 'tg_user_id')
  String? get tgUserId;
  @override
  @JsonKey(name: 'api_key')
  String? get apikey;
  @override
  String? get url;
  @override
  @JsonKey(ignore: true)
  _$$ConnectionImplCopyWith<_$ConnectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
