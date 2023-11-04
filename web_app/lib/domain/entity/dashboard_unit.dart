import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_unit.freezed.dart';
part 'dashboard_unit.g.dart';

@freezed
class DashboardUnit with _$DashboardUnit {
    const factory DashboardUnit({
        required int timestamp,
        required double value,
}) = _DashboardUnit;

    factory DashboardUnit.fromJson(Map<String, dynamic> json) => _$DashboardUnitFromJson(json);
}