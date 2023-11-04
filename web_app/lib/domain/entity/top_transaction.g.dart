// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TopTransactionImpl _$$TopTransactionImplFromJson(Map<String, dynamic> json) =>
    _$TopTransactionImpl(
      count: json['count'] as int,
      query: json['query'] as String,
      durationSum: json['duration_sum'] as int,
    );

Map<String, dynamic> _$$TopTransactionImplToJson(
        _$TopTransactionImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'query': instance.query,
      'duration_sum': instance.durationSum,
    };
