import 'package:freezed_annotation/freezed_annotation.dart';

part 'top_transaction.freezed.dart';

part 'top_transaction.g.dart';

@freezed
class TopTransaction with _$TopTransaction {
  factory TopTransaction({
    required int count,
    required String query,
    @JsonKey(name: 'duration_sum') required int durationSum,
  }) = _TopTransaction;

  factory TopTransaction.fromJson(Map<String, dynamic> json) =>
      _$TopTransactionFromJson(json);
}
