// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DashboardImpl _$$DashboardImplFromJson(Map<String, dynamic> json) =>
    _$DashboardImpl(
      name: json['name'] as String,
      units: (json['units'] as List<dynamic>)
          .map((e) => DashboardUnit.fromJson(e as Map<String, dynamic>))
          .toList(),
      predictions: (json['predictions'] as List<dynamic>)
          .map((e) => DashboardUnit.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DashboardImplToJson(_$DashboardImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'units': instance.units,
      'predictions': instance.predictions,
    };
