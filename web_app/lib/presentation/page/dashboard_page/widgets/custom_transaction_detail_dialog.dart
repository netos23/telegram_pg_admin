import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:web_app/domain/entity/top_transaction.dart';

class CustomTransactionDetailDialog extends StatelessWidget {
  const CustomTransactionDetailDialog({
    super.key,
    required this.transaction,
    this.onOk,
    this.title,
    this.okText,
  });

  final TopTransaction transaction;
  final void Function()? onOk;
  final String? okText;
  final String? title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Card(
        child: Container(
          width: 400,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Text(
                  title ?? '',
                  style: theme.textTheme.bodyMedium,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  transaction.query ?? '',
                  style: theme.textTheme.bodyMedium,
                  maxLines: 5,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Count: ',
                      style: theme.textTheme.bodyMedium,
                    ),
                    const SizedBox(width: 16,),
                    Text(
                      '${transaction.count}',
                      style: theme.textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => onOk ?? context.router.pop(),
                    child: Text(okText ?? 'Ok'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
