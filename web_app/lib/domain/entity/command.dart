import 'package:freezed_annotation/freezed_annotation.dart';

part 'command.freezed.dart';
part 'command.g.dart';

@freezed
class Command with _$Command {
    factory Command({
     required String command,
}) = _Command;

    factory Command.fromJson(Map<String, dynamic> json) => _$CommandFromJson(json);
}