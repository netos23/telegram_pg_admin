// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Dashboard _$DashboardFromJson(Map<String, dynamic> json) {
  return _Dashboard.fromJson(json);
}

/// @nodoc
mixin _$Dashboard {
  String get title => throw _privateConstructorUsedError;
  List<DashboardUnit> get units => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DashboardCopyWith<Dashboard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardCopyWith<$Res> {
  factory $DashboardCopyWith(Dashboard value, $Res Function(Dashboard) then) =
      _$DashboardCopyWithImpl<$Res, Dashboard>;
  @useResult
  $Res call({String title, List<DashboardUnit> units});
}

/// @nodoc
class _$DashboardCopyWithImpl<$Res, $Val extends Dashboard>
    implements $DashboardCopyWith<$Res> {
  _$DashboardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? units = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      units: null == units
          ? _value.units
          : units // ignore: cast_nullable_to_non_nullable
              as List<DashboardUnit>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DashboardImplCopyWith<$Res>
    implements $DashboardCopyWith<$Res> {
  factory _$$DashboardImplCopyWith(
          _$DashboardImpl value, $Res Function(_$DashboardImpl) then) =
      __$$DashboardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, List<DashboardUnit> units});
}

/// @nodoc
class __$$DashboardImplCopyWithImpl<$Res>
    extends _$DashboardCopyWithImpl<$Res, _$DashboardImpl>
    implements _$$DashboardImplCopyWith<$Res> {
  __$$DashboardImplCopyWithImpl(
      _$DashboardImpl _value, $Res Function(_$DashboardImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? units = null,
  }) {
    return _then(_$DashboardImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      units: null == units
          ? _value._units
          : units // ignore: cast_nullable_to_non_nullable
              as List<DashboardUnit>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DashboardImpl implements _Dashboard {
  const _$DashboardImpl(
      {required this.title, required final List<DashboardUnit> units})
      : _units = units;

  factory _$DashboardImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardImplFromJson(json);

  @override
  final String title;
  final List<DashboardUnit> _units;
  @override
  List<DashboardUnit> get units {
    if (_units is EqualUnmodifiableListView) return _units;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_units);
  }

  @override
  String toString() {
    return 'Dashboard(title: $title, units: $units)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardImpl &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._units, _units));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, title, const DeepCollectionEquality().hash(_units));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardImplCopyWith<_$DashboardImpl> get copyWith =>
      __$$DashboardImplCopyWithImpl<_$DashboardImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardImplToJson(
      this,
    );
  }
}

abstract class _Dashboard implements Dashboard {
  const factory _Dashboard(
      {required final String title,
      required final List<DashboardUnit> units}) = _$DashboardImpl;

  factory _Dashboard.fromJson(Map<String, dynamic> json) =
      _$DashboardImpl.fromJson;

  @override
  String get title;
  @override
  List<DashboardUnit> get units;
  @override
  @JsonKey(ignore: true)
  _$$DashboardImplCopyWith<_$DashboardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
