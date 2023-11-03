// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConnectionImpl _$$ConnectionImplFromJson(Map<String, dynamic> json) =>
    _$ConnectionImpl(
      name: json['name'] as String,
      id: json['id'] as int?,
      apikey: json['apikey'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$$ConnectionImplToJson(_$ConnectionImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'apikey': instance.apikey,
      'url': instance.url,
    };
