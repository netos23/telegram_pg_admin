// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dump.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Dump _$DumpFromJson(Map<String, dynamic> json) {
  return _Dump.fromJson(json);
}

/// @nodoc
mixin _$Dump {
  String get name => throw _privateConstructorUsedError;
  String get datetime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DumpCopyWith<Dump> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DumpCopyWith<$Res> {
  factory $DumpCopyWith(Dump value, $Res Function(Dump) then) =
      _$DumpCopyWithImpl<$Res, Dump>;
  @useResult
  $Res call({String name, String datetime});
}

/// @nodoc
class _$DumpCopyWithImpl<$Res, $Val extends Dump>
    implements $DumpCopyWith<$Res> {
  _$DumpCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? datetime = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      datetime: null == datetime
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DumpImplCopyWith<$Res> implements $DumpCopyWith<$Res> {
  factory _$$DumpImplCopyWith(
          _$DumpImpl value, $Res Function(_$DumpImpl) then) =
      __$$DumpImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String datetime});
}

/// @nodoc
class __$$DumpImplCopyWithImpl<$Res>
    extends _$DumpCopyWithImpl<$Res, _$DumpImpl>
    implements _$$DumpImplCopyWith<$Res> {
  __$$DumpImplCopyWithImpl(_$DumpImpl _value, $Res Function(_$DumpImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? datetime = null,
  }) {
    return _then(_$DumpImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      datetime: null == datetime
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DumpImpl implements _Dump {
  _$DumpImpl({required this.name, required this.datetime});

  factory _$DumpImpl.fromJson(Map<String, dynamic> json) =>
      _$$DumpImplFromJson(json);

  @override
  final String name;
  @override
  final String datetime;

  @override
  String toString() {
    return 'Dump(name: $name, datetime: $datetime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DumpImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.datetime, datetime) ||
                other.datetime == datetime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, datetime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DumpImplCopyWith<_$DumpImpl> get copyWith =>
      __$$DumpImplCopyWithImpl<_$DumpImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DumpImplToJson(
      this,
    );
  }
}

abstract class _Dump implements Dump {
  factory _Dump({required final String name, required final String datetime}) =
      _$DumpImpl;

  factory _Dump.fromJson(Map<String, dynamic> json) = _$DumpImpl.fromJson;

  @override
  String get name;
  @override
  String get datetime;
  @override
  @JsonKey(ignore: true)
  _$$DumpImplCopyWith<_$DumpImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
