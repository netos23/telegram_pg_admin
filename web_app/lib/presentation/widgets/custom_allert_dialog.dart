import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    super.key,
    required this.title,
    this.description,
    this.onOk,
    this.okText,
  });

  final String title;
  final void Function()? onOk;
  final String? okText;
  final String? description;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Card(
        child: Container(
          width: 200,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: theme.textTheme.titleMedium,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  description ?? '',
                  style: theme.textTheme.bodyMedium,
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
