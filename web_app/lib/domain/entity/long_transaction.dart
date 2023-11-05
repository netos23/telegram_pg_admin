import 'package:freezed_annotation/freezed_annotation.dart';

part 'long_transaction.freezed.dart';

part 'long_transaction.g.dart';

@freezed
class LongTransaction with _$LongTransaction {
  factory LongTransaction({
    required int pid,
    required String query,
    required String datname,
    required double duration,
  }) = _LongTransaction;

  factory LongTransaction.fromJson(Map<String, dynamic> json) =>
      _$LongTransactionFromJson(json);
}
