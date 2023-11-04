// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DashboardFilterImpl _$$DashboardFilterImplFromJson(
        Map<String, dynamic> json) =>
    _$DashboardFilterImpl(
      apiKey: json['api_key'] as String,
      from: json['date_from'] as int?,
      to: json['date_to'] as int?,
    );

Map<String, dynamic> _$$DashboardFilterImplToJson(
    _$DashboardFilterImpl instance) {
  final val = <String, dynamic>{
    'api_key': instance.apiKey,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('date_from', instance.from);
  writeNotNull('date_to', instance.to);
  return val;
}
