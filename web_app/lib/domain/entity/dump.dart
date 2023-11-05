import 'package:freezed_annotation/freezed_annotation.dart';

part 'dump.freezed.dart';
part 'dump.g.dart';

@freezed
class Dump with _$Dump {
    factory Dump({
      required String name,
      required int datetime,
      required int size,
}) = _Dump;

    factory Dump.fromJson(Map<String, dynamic> json) => _$DumpFromJson(json);
}