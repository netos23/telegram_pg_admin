// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommandImpl _$$CommandImplFromJson(Map<String, dynamic> json) =>
    _$CommandImpl(
      apiKey: json['api_key'] as String,
      command: json['command'] as String,
      parameter: json['parameter'] as String?,
    );

Map<String, dynamic> _$$CommandImplToJson(_$CommandImpl instance) {
  final val = <String, dynamic>{
    'api_key': instance.apiKey,
    'command': instance.command,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('parameter', instance.parameter);
  return val;
}
