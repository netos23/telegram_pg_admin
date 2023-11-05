// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'long_transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LongTransactionImpl _$$LongTransactionImplFromJson(
        Map<String, dynamic> json) =>
    _$LongTransactionImpl(
      pid: json['pid'] as int,
      query: json['query'] as String,
      datname: json['datname'] as String,
      duration: (json['duration'] as num).toDouble(),
    );

Map<String, dynamic> _$$LongTransactionImplToJson(
        _$LongTransactionImpl instance) =>
    <String, dynamic>{
      'pid': instance.pid,
      'query': instance.query,
      'datname': instance.datname,
      'duration': instance.duration,
    };
