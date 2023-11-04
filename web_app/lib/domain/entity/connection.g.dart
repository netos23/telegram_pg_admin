// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConnectionImpl _$$ConnectionImplFromJson(Map<String, dynamic> json) =>
    _$ConnectionImpl(
      name: json['name'] as String,
      id: json['id'] as int?,
      tgUserId: json['tg_user_id'] as String?,
      isActive: json['is_active'] as bool?,
      apikey: json['api_key'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$$ConnectionImplToJson(_$ConnectionImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'tg_user_id': instance.tgUserId,
      'is_active': instance.isActive,
      'api_key': instance.apikey,
      'url': instance.url,
    };
