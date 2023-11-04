import 'package:freezed_annotation/freezed_annotation.dart';

part 'dump_response.freezed.dart';
part 'dump_response.g.dart';

@freezed
class DumpResponce with _$DumpResponce {
    factory DumpResponce({
      @JsonKey(name: 'api_key') required String apiKey,
    }) = _DumpResponce;

    factory DumpResponce.fromJson(Map<String, dynamic> json) => _$DumpResponceFromJson(json);
}