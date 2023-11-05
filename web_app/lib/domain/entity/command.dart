import 'package:freezed_annotation/freezed_annotation.dart';

part 'command.freezed.dart';

part 'command.g.dart';

@freezed
class Command with _$Command {
  @JsonSerializable(
    explicitToJson: true,
    includeIfNull: false,
  )
  factory Command({
    @JsonKey(name: 'api_key') required String apiKey,
    required String command,
    String? parameter,
  }) = _Command;

  factory Command.fromJson(Map<String, dynamic> json) =>
      _$CommandFromJson(json);
}
