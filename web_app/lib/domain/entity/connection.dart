import 'package:freezed_annotation/freezed_annotation.dart';

part 'connection.freezed.dart';

part 'connection.g.dart';

@freezed
class Connection with _$Connection {
  factory Connection({
    required String name,
    int? id,
    String? apikey,
    String? url,
  }) = _Connection;

  factory Connection.fromJson(Map<String, dynamic> json) =>
      _$ConnectionFromJson(json);
}
