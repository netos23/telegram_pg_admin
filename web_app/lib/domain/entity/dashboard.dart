import 'package:freezed_annotation/freezed_annotation.dart';

import 'dashboard_unit.dart';

part 'dashboard.freezed.dart';
part 'dashboard.g.dart';

@freezed
class Dashboard with _$Dashboard {
    const factory Dashboard({
      required String name,
      required List<DashboardUnit> units,
      required List<DashboardUnit> predictions,
}) = _Dashboard;

    factory Dashboard.fromJson(Map<String, dynamic> json) => _$DashboardFromJson(json);
}