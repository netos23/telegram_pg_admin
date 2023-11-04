import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
    required this.title,
    required this.onOk,
    required this.onCancel,
    this.okText,
    this.cancelText,
  });

  final String title;
  final void Function() onOk;
  final void Function() onCancel;
  final String? okText;
  final String? cancelText;

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
              const SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: onOk,
                    child: Text(okText ?? 'Ok'),
                  ),
                  ElevatedButton(
                    onPressed: onCancel,
                    child: Text(cancelText ?? 'Cancel'),
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
