// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_unit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DashboardUnit _$DashboardUnitFromJson(Map<String, dynamic> json) {
  return _DashboardUnit.fromJson(json);
}

/// @nodoc
mixin _$DashboardUnit {
  int get timestamp => throw _privateConstructorUsedError;
  double? get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DashboardUnitCopyWith<DashboardUnit> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardUnitCopyWith<$Res> {
  factory $DashboardUnitCopyWith(
          DashboardUnit value, $Res Function(DashboardUnit) then) =
      _$DashboardUnitCopyWithImpl<$Res, DashboardUnit>;
  @useResult
  $Res call({int timestamp, double? value});
}

/// @nodoc
class _$DashboardUnitCopyWithImpl<$Res, $Val extends DashboardUnit>
    implements $DashboardUnitCopyWith<$Res> {
  _$DashboardUnitCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timestamp = null,
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DashboardUnitImplCopyWith<$Res>
    implements $DashboardUnitCopyWith<$Res> {
  factory _$$DashboardUnitImplCopyWith(
          _$DashboardUnitImpl value, $Res Function(_$DashboardUnitImpl) then) =
      __$$DashboardUnitImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int timestamp, double? value});
}

/// @nodoc
class __$$DashboardUnitImplCopyWithImpl<$Res>
    extends _$DashboardUnitCopyWithImpl<$Res, _$DashboardUnitImpl>
    implements _$$DashboardUnitImplCopyWith<$Res> {
  __$$DashboardUnitImplCopyWithImpl(
      _$DashboardUnitImpl _value, $Res Function(_$DashboardUnitImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timestamp = null,
    Object? value = freezed,
  }) {
    return _then(_$DashboardUnitImpl(
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DashboardUnitImpl implements _DashboardUnit {
  const _$DashboardUnitImpl({required this.timestamp, this.value});

  factory _$DashboardUnitImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardUnitImplFromJson(json);

  @override
  final int timestamp;
  @override
  final double? value;

  @override
  String toString() {
    return 'DashboardUnit(timestamp: $timestamp, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardUnitImpl &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, timestamp, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardUnitImplCopyWith<_$DashboardUnitImpl> get copyWith =>
      __$$DashboardUnitImplCopyWithImpl<_$DashboardUnitImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardUnitImplToJson(
      this,
    );
  }
}

abstract class _DashboardUnit implements DashboardUnit {
  const factory _DashboardUnit(
      {required final int timestamp,
      final double? value}) = _$DashboardUnitImpl;

  factory _DashboardUnit.fromJson(Map<String, dynamic> json) =
      _$DashboardUnitImpl.fromJson;

  @override
  int get timestamp;
  @override
  double? get value;
  @override
  @JsonKey(ignore: true)
  _$$DashboardUnitImplCopyWith<_$DashboardUnitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
