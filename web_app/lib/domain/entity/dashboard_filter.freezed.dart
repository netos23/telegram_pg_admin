// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DashboardFilter _$DashboardFilterFromJson(Map<String, dynamic> json) {
  return _DashboardFilter.fromJson(json);
}

/// @nodoc
mixin _$DashboardFilter {
  @JsonKey(name: 'api_key')
  String get apiKey => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_from')
  int? get from => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_to')
  int? get to => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DashboardFilterCopyWith<DashboardFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardFilterCopyWith<$Res> {
  factory $DashboardFilterCopyWith(
          DashboardFilter value, $Res Function(DashboardFilter) then) =
      _$DashboardFilterCopyWithImpl<$Res, DashboardFilter>;
  @useResult
  $Res call(
      {@JsonKey(name: 'api_key') String apiKey,
      @JsonKey(name: 'date_from') int? from,
      @JsonKey(name: 'date_to') int? to});
}

/// @nodoc
class _$DashboardFilterCopyWithImpl<$Res, $Val extends DashboardFilter>
    implements $DashboardFilterCopyWith<$Res> {
  _$DashboardFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apiKey = null,
    Object? from = freezed,
    Object? to = freezed,
  }) {
    return _then(_value.copyWith(
      apiKey: null == apiKey
          ? _value.apiKey
          : apiKey // ignore: cast_nullable_to_non_nullable
              as String,
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as int?,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DashboardFilterImplCopyWith<$Res>
    implements $DashboardFilterCopyWith<$Res> {
  factory _$$DashboardFilterImplCopyWith(_$DashboardFilterImpl value,
          $Res Function(_$DashboardFilterImpl) then) =
      __$$DashboardFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'api_key') String apiKey,
      @JsonKey(name: 'date_from') int? from,
      @JsonKey(name: 'date_to') int? to});
}

/// @nodoc
class __$$DashboardFilterImplCopyWithImpl<$Res>
    extends _$DashboardFilterCopyWithImpl<$Res, _$DashboardFilterImpl>
    implements _$$DashboardFilterImplCopyWith<$Res> {
  __$$DashboardFilterImplCopyWithImpl(
      _$DashboardFilterImpl _value, $Res Function(_$DashboardFilterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apiKey = null,
    Object? from = freezed,
    Object? to = freezed,
  }) {
    return _then(_$DashboardFilterImpl(
      apiKey: null == apiKey
          ? _value.apiKey
          : apiKey // ignore: cast_nullable_to_non_nullable
              as String,
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as int?,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$DashboardFilterImpl implements _DashboardFilter {
  _$DashboardFilterImpl(
      {@JsonKey(name: 'api_key') required this.apiKey,
      @JsonKey(name: 'date_from') this.from,
      @JsonKey(name: 'date_to') this.to});

  factory _$DashboardFilterImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardFilterImplFromJson(json);

  @override
  @JsonKey(name: 'api_key')
  final String apiKey;
  @override
  @JsonKey(name: 'date_from')
  final int? from;
  @override
  @JsonKey(name: 'date_to')
  final int? to;

  @override
  String toString() {
    return 'DashboardFilter(apiKey: $apiKey, from: $from, to: $to)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardFilterImpl &&
            (identical(other.apiKey, apiKey) || other.apiKey == apiKey) &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, apiKey, from, to);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardFilterImplCopyWith<_$DashboardFilterImpl> get copyWith =>
      __$$DashboardFilterImplCopyWithImpl<_$DashboardFilterImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardFilterImplToJson(
      this,
    );
  }
}

abstract class _DashboardFilter implements DashboardFilter {
  factory _DashboardFilter(
      {@JsonKey(name: 'api_key') required final String apiKey,
      @JsonKey(name: 'date_from') final int? from,
      @JsonKey(name: 'date_to') final int? to}) = _$DashboardFilterImpl;

  factory _DashboardFilter.fromJson(Map<String, dynamic> json) =
      _$DashboardFilterImpl.fromJson;

  @override
  @JsonKey(name: 'api_key')
  String get apiKey;
  @override
  @JsonKey(name: 'date_from')
  int? get from;
  @override
  @JsonKey(name: 'date_to')
  int? get to;
  @override
  @JsonKey(ignore: true)
  _$$DashboardFilterImplCopyWith<_$DashboardFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
