// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'long_transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LongTransaction _$LongTransactionFromJson(Map<String, dynamic> json) {
  return _LongTransaction.fromJson(json);
}

/// @nodoc
mixin _$LongTransaction {
  String get pid => throw _privateConstructorUsedError;
  String get query => throw _privateConstructorUsedError;
  String get datname => throw _privateConstructorUsedError;
  String get duration => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LongTransactionCopyWith<LongTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LongTransactionCopyWith<$Res> {
  factory $LongTransactionCopyWith(
          LongTransaction value, $Res Function(LongTransaction) then) =
      _$LongTransactionCopyWithImpl<$Res, LongTransaction>;
  @useResult
  $Res call({String pid, String query, String datname, String duration});
}

/// @nodoc
class _$LongTransactionCopyWithImpl<$Res, $Val extends LongTransaction>
    implements $LongTransactionCopyWith<$Res> {
  _$LongTransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pid = null,
    Object? query = null,
    Object? datname = null,
    Object? duration = null,
  }) {
    return _then(_value.copyWith(
      pid: null == pid
          ? _value.pid
          : pid // ignore: cast_nullable_to_non_nullable
              as String,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      datname: null == datname
          ? _value.datname
          : datname // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LongTransactionImplCopyWith<$Res>
    implements $LongTransactionCopyWith<$Res> {
  factory _$$LongTransactionImplCopyWith(_$LongTransactionImpl value,
          $Res Function(_$LongTransactionImpl) then) =
      __$$LongTransactionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String pid, String query, String datname, String duration});
}

/// @nodoc
class __$$LongTransactionImplCopyWithImpl<$Res>
    extends _$LongTransactionCopyWithImpl<$Res, _$LongTransactionImpl>
    implements _$$LongTransactionImplCopyWith<$Res> {
  __$$LongTransactionImplCopyWithImpl(
      _$LongTransactionImpl _value, $Res Function(_$LongTransactionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pid = null,
    Object? query = null,
    Object? datname = null,
    Object? duration = null,
  }) {
    return _then(_$LongTransactionImpl(
      pid: null == pid
          ? _value.pid
          : pid // ignore: cast_nullable_to_non_nullable
              as String,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      datname: null == datname
          ? _value.datname
          : datname // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LongTransactionImpl implements _LongTransaction {
  _$LongTransactionImpl(
      {required this.pid,
      required this.query,
      required this.datname,
      required this.duration});

  factory _$LongTransactionImpl.fromJson(Map<String, dynamic> json) =>
      _$$LongTransactionImplFromJson(json);

  @override
  final String pid;
  @override
  final String query;
  @override
  final String datname;
  @override
  final String duration;

  @override
  String toString() {
    return 'LongTransaction(pid: $pid, query: $query, datname: $datname, duration: $duration)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LongTransactionImpl &&
            (identical(other.pid, pid) || other.pid == pid) &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.datname, datname) || other.datname == datname) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, pid, query, datname, duration);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LongTransactionImplCopyWith<_$LongTransactionImpl> get copyWith =>
      __$$LongTransactionImplCopyWithImpl<_$LongTransactionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LongTransactionImplToJson(
      this,
    );
  }
}

abstract class _LongTransaction implements LongTransaction {
  factory _LongTransaction(
      {required final String pid,
      required final String query,
      required final String datname,
      required final String duration}) = _$LongTransactionImpl;

  factory _LongTransaction.fromJson(Map<String, dynamic> json) =
      _$LongTransactionImpl.fromJson;

  @override
  String get pid;
  @override
  String get query;
  @override
  String get datname;
  @override
  String get duration;
  @override
  @JsonKey(ignore: true)
  _$$LongTransactionImplCopyWith<_$LongTransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
