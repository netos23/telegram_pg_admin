import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_filter.freezed.dart';

part 'dashboard_filter.g.dart';

@freezed
class DashboardFilter with _$DashboardFilter {
  @JsonSerializable(
    includeIfNull: false,
  )
  factory DashboardFilter({
    @JsonKey(name: 'api_key') required String apiKey,
    @JsonKey(name: 'date_from')int? from,
    @JsonKey(name: 'date_to')int? to,
  }) = _DashboardFilter;

  factory DashboardFilter.fromJson(Map<String, dynamic> json) =>
      _$DashboardFilterFromJson(json);
}
