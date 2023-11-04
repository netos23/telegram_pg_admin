// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dump_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DumpResponce _$DumpResponceFromJson(Map<String, dynamic> json) {
  return _DumpResponce.fromJson(json);
}

/// @nodoc
mixin _$DumpResponce {
  @JsonKey(name: 'api_key')
  String get apiKey => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DumpResponceCopyWith<DumpResponce> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DumpResponceCopyWith<$Res> {
  factory $DumpResponceCopyWith(
          DumpResponce value, $Res Function(DumpResponce) then) =
      _$DumpResponceCopyWithImpl<$Res, DumpResponce>;
  @useResult
  $Res call({@JsonKey(name: 'api_key') String apiKey});
}

/// @nodoc
class _$DumpResponceCopyWithImpl<$Res, $Val extends DumpResponce>
    implements $DumpResponceCopyWith<$Res> {
  _$DumpResponceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apiKey = null,
  }) {
    return _then(_value.copyWith(
      apiKey: null == apiKey
          ? _value.apiKey
          : apiKey // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DumpResponceImplCopyWith<$Res>
    implements $DumpResponceCopyWith<$Res> {
  factory _$$DumpResponceImplCopyWith(
          _$DumpResponceImpl value, $Res Function(_$DumpResponceImpl) then) =
      __$$DumpResponceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'api_key') String apiKey});
}

/// @nodoc
class __$$DumpResponceImplCopyWithImpl<$Res>
    extends _$DumpResponceCopyWithImpl<$Res, _$DumpResponceImpl>
    implements _$$DumpResponceImplCopyWith<$Res> {
  __$$DumpResponceImplCopyWithImpl(
      _$DumpResponceImpl _value, $Res Function(_$DumpResponceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apiKey = null,
  }) {
    return _then(_$DumpResponceImpl(
      apiKey: null == apiKey
          ? _value.apiKey
          : apiKey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DumpResponceImpl implements _DumpResponce {
  _$DumpResponceImpl({@JsonKey(name: 'api_key') required this.apiKey});

  factory _$DumpResponceImpl.fromJson(Map<String, dynamic> json) =>
      _$$DumpResponceImplFromJson(json);

  @override
  @JsonKey(name: 'api_key')
  final String apiKey;

  @override
  String toString() {
    return 'DumpResponce(apiKey: $apiKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DumpResponceImpl &&
            (identical(other.apiKey, apiKey) || other.apiKey == apiKey));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, apiKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DumpResponceImplCopyWith<_$DumpResponceImpl> get copyWith =>
      __$$DumpResponceImplCopyWithImpl<_$DumpResponceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DumpResponceImplToJson(
      this,
    );
  }
}

abstract class _DumpResponce implements DumpResponce {
  factory _DumpResponce(
          {@JsonKey(name: 'api_key') required final String apiKey}) =
      _$DumpResponceImpl;

  factory _DumpResponce.fromJson(Map<String, dynamic> json) =
      _$DumpResponceImpl.fromJson;

  @override
  @JsonKey(name: 'api_key')
  String get apiKey;
  @override
  @JsonKey(ignore: true)
  _$$DumpResponceImplCopyWith<_$DumpResponceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
