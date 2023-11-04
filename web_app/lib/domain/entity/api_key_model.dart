import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_key_model.freezed.dart';
part 'api_key_model.g.dart';

@freezed
class ApiKeyModel with _$ApiKeyModel {
    factory ApiKeyModel({
      @JsonKey(name: 'api_key') required String apikey,
}) = _ApiKeyModel;

    factory ApiKeyModel.fromJson(Map<String, dynamic> json) => _$ApiKeyModelFromJson(json);
}