// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_key_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ApiKeyModel _$ApiKeyModelFromJson(Map<String, dynamic> json) {
  return _ApiKeyModel.fromJson(json);
}

/// @nodoc
mixin _$ApiKeyModel {
  @JsonKey(name: 'api_key')
  String get apikey => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApiKeyModelCopyWith<ApiKeyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiKeyModelCopyWith<$Res> {
  factory $ApiKeyModelCopyWith(
          ApiKeyModel value, $Res Function(ApiKeyModel) then) =
      _$ApiKeyModelCopyWithImpl<$Res, ApiKeyModel>;
  @useResult
  $Res call({@JsonKey(name: 'api_key') String apikey});
}

/// @nodoc
class _$ApiKeyModelCopyWithImpl<$Res, $Val extends ApiKeyModel>
    implements $ApiKeyModelCopyWith<$Res> {
  _$ApiKeyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apikey = null,
  }) {
    return _then(_value.copyWith(
      apikey: null == apikey
          ? _value.apikey
          : apikey // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApiKeyModelImplCopyWith<$Res>
    implements $ApiKeyModelCopyWith<$Res> {
  factory _$$ApiKeyModelImplCopyWith(
          _$ApiKeyModelImpl value, $Res Function(_$ApiKeyModelImpl) then) =
      __$$ApiKeyModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'api_key') String apikey});
}

/// @nodoc
class __$$ApiKeyModelImplCopyWithImpl<$Res>
    extends _$ApiKeyModelCopyWithImpl<$Res, _$ApiKeyModelImpl>
    implements _$$ApiKeyModelImplCopyWith<$Res> {
  __$$ApiKeyModelImplCopyWithImpl(
      _$ApiKeyModelImpl _value, $Res Function(_$ApiKeyModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apikey = null,
  }) {
    return _then(_$ApiKeyModelImpl(
      apikey: null == apikey
          ? _value.apikey
          : apikey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApiKeyModelImpl implements _ApiKeyModel {
  _$ApiKeyModelImpl({@JsonKey(name: 'api_key') required this.apikey});

  factory _$ApiKeyModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApiKeyModelImplFromJson(json);

  @override
  @JsonKey(name: 'api_key')
  final String apikey;

  @override
  String toString() {
    return 'ApiKeyModel(apikey: $apikey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiKeyModelImpl &&
            (identical(other.apikey, apikey) || other.apikey == apikey));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, apikey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiKeyModelImplCopyWith<_$ApiKeyModelImpl> get copyWith =>
      __$$ApiKeyModelImplCopyWithImpl<_$ApiKeyModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApiKeyModelImplToJson(
      this,
    );
  }
}

abstract class _ApiKeyModel implements ApiKeyModel {
  factory _ApiKeyModel(
          {@JsonKey(name: 'api_key') required final String apikey}) =
      _$ApiKeyModelImpl;

  factory _ApiKeyModel.fromJson(Map<String, dynamic> json) =
      _$ApiKeyModelImpl.fromJson;

  @override
  @JsonKey(name: 'api_key')
  String get apikey;
  @override
  @JsonKey(ignore: true)
  _$$ApiKeyModelImplCopyWith<_$ApiKeyModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
