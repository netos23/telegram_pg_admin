import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_telegram_web_app/flutter_telegram_web_app.dart' as tg;
import 'package:web_app/domain/entity/connection.dart';
import 'package:web_app/internal/app_components.dart';
import 'package:web_app/presentation/router/app_router.dart';
import 'package:web_app/presentation/widgets/custom_dialog.dart';

@RoutePage()
class EditConnectionPage extends StatefulWidget {
  const EditConnectionPage({super.key, required this.connection});

  final Connection connection;

  @override
  State<EditConnectionPage> createState() => _EditConnectionPageState();
}

class _EditConnectionPageState extends State<EditConnectionPage> {
  final TextEditingController urlController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final apiManager = AppComponents().apiManager;

  @override
  void initState() {
    super.initState();
    urlController.text = widget.connection.url ?? '';
    nameController.text = widget.connection.name;
    AppComponents().backButton.show();
    AppComponents().mainButton.onClick(tg.JsVoidCallback(() {
      context.router.pop();
    }));
    AppComponents().mainButton.text = 'Edit';
    AppComponents().mainButton.show();
  }

  @override
  void dispose() {
    AppComponents().backButton.hide();
    AppComponents().mainButton.onClick(tg.JsVoidCallback(() {
      context.router.push(AddConnectionRoute());
    }));
    AppComponents().mainButton.text = 'Add connection';
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        body: Center(
          child: SizedBox(
            width: 600,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(32),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextField(
                              textAlign: TextAlign.start,
                              controller: nameController,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                overflow: TextOverflow.ellipsis,
                              ),
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Connection title',
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            TextField(
                              textAlign: TextAlign.start,
                              controller: urlController,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                overflow: TextOverflow.ellipsis,
                              ),
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Url',
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            SizedBox(
                              height: 50,
                              child: ElevatedButton(
                                style: theme.filledButtonTheme.style?.copyWith(
                                  fixedSize: const MaterialStatePropertyAll(
                                    Size.fromHeight(50),
                                  ),
                                  backgroundColor:
                                      MaterialStatePropertyAll(theme.hintColor),
                                ),
                                onPressed: () {
                                  onShowButton(
                                    title: 'Are you sure?',
                                    onOk: () => context.router.pop(),
                                    onCancel: () => context.router.pop(),
                                    okText: 'Delete',
                                  );
                                  context.router.pop();
                                },
                                child: const Center(
                                  child: Text('Delete'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        floatingActionButton: !tg.isSupported
            ? FloatingActionButton(
                onPressed: () {
                  context.router.pop();
                },
                child: const Icon(Icons.edit),
              )
            : null);
  }

  void onShowButton({
    required String title,
    required void Function() onOk,
    required void Function() onCancel,
    String? okText,
    String? cancelText,
  }) {
    if (tg.isSupported) {
      tg.TelegramPopup(
        title: "Are you sure?",
        message: 'It seems dangerous!',
        buttons: [
          tg.PopupButton(
            id: okText ?? 'Ok',
            type: tg.PopupButtonType.destructive,
            text: okText,
          ),
          tg.PopupButton(
            id: okText ?? "Cancel",
            type: tg.PopupButtonType.cancel,
            text: cancelText,
          ),
        ],
        onTap: (String buttonId) {
          if (buttonId == "Ok") return onCancel;
          if (buttonId == "Cancel") return onOk;
          //showAlert("Button $buttonId clicked");
        },
      ).show();
    } else {
      showDialog(
        context: context,
        builder: (_) {
          return CustomDialog(
            title: title,
            onOk: onOk,
            onCancel: onCancel,
            okText: okText,
            cancelText: cancelText,
          );
        },
      );
    }
  }
}
