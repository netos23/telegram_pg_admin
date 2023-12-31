// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'command.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Command _$CommandFromJson(Map<String, dynamic> json) {
  return _Command.fromJson(json);
}

/// @nodoc
mixin _$Command {
  @JsonKey(name: 'api_key')
  String get apiKey => throw _privateConstructorUsedError;
  String get command => throw _privateConstructorUsedError;
  String? get parameter => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommandCopyWith<Command> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommandCopyWith<$Res> {
  factory $CommandCopyWith(Command value, $Res Function(Command) then) =
      _$CommandCopyWithImpl<$Res, Command>;
  @useResult
  $Res call(
      {@JsonKey(name: 'api_key') String apiKey,
      String command,
      String? parameter});
}

/// @nodoc
class _$CommandCopyWithImpl<$Res, $Val extends Command>
    implements $CommandCopyWith<$Res> {
  _$CommandCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apiKey = null,
    Object? command = null,
    Object? parameter = freezed,
  }) {
    return _then(_value.copyWith(
      apiKey: null == apiKey
          ? _value.apiKey
          : apiKey // ignore: cast_nullable_to_non_nullable
              as String,
      command: null == command
          ? _value.command
          : command // ignore: cast_nullable_to_non_nullable
              as String,
      parameter: freezed == parameter
          ? _value.parameter
          : parameter // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommandImplCopyWith<$Res> implements $CommandCopyWith<$Res> {
  factory _$$CommandImplCopyWith(
          _$CommandImpl value, $Res Function(_$CommandImpl) then) =
      __$$CommandImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'api_key') String apiKey,
      String command,
      String? parameter});
}

/// @nodoc
class __$$CommandImplCopyWithImpl<$Res>
    extends _$CommandCopyWithImpl<$Res, _$CommandImpl>
    implements _$$CommandImplCopyWith<$Res> {
  __$$CommandImplCopyWithImpl(
      _$CommandImpl _value, $Res Function(_$CommandImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apiKey = null,
    Object? command = null,
    Object? parameter = freezed,
  }) {
    return _then(_$CommandImpl(
      apiKey: null == apiKey
          ? _value.apiKey
          : apiKey // ignore: cast_nullable_to_non_nullable
              as String,
      command: null == command
          ? _value.command
          : command // ignore: cast_nullable_to_non_nullable
              as String,
      parameter: freezed == parameter
          ? _value.parameter
          : parameter // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class _$CommandImpl implements _Command {
  _$CommandImpl(
      {@JsonKey(name: 'api_key') required this.apiKey,
      required this.command,
      this.parameter});

  factory _$CommandImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommandImplFromJson(json);

  @override
  @JsonKey(name: 'api_key')
  final String apiKey;
  @override
  final String command;
  @override
  final String? parameter;

  @override
  String toString() {
    return 'Command(apiKey: $apiKey, command: $command, parameter: $parameter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommandImpl &&
            (identical(other.apiKey, apiKey) || other.apiKey == apiKey) &&
            (identical(other.command, command) || other.command == command) &&
            (identical(other.parameter, parameter) ||
                other.parameter == parameter));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, apiKey, command, parameter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommandImplCopyWith<_$CommandImpl> get copyWith =>
      __$$CommandImplCopyWithImpl<_$CommandImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommandImplToJson(
      this,
    );
  }
}

abstract class _Command implements Command {
  factory _Command(
      {@JsonKey(name: 'api_key') required final String apiKey,
      required final String command,
      final String? parameter}) = _$CommandImpl;

  factory _Command.fromJson(Map<String, dynamic> json) = _$CommandImpl.fromJson;

  @override
  @JsonKey(name: 'api_key')
  String get apiKey;
  @override
  String get command;
  @override
  String? get parameter;
  @override
  @JsonKey(ignore: true)
  _$$CommandImplCopyWith<_$CommandImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
