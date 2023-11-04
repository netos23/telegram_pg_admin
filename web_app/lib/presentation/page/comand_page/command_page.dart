import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_telegram_web_app/flutter_telegram_web_app.dart' as tg;
import 'package:web_app/domain/api_manager.dart';
import 'package:web_app/internal/app_components.dart';
import 'package:web_app/presentation/widgets/custom_dialog.dart';

@RoutePage()
class CommandPage extends StatefulWidget {
  const CommandPage({
    super.key,
    @QueryParam() this.apiKey = '',
  });

  final String apiKey;

  @override
  State<CommandPage> createState() => _CommandPageState();
}

class _CommandPageState extends State<CommandPage> {
  final TextEditingController urlController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  final ApiManager apiManager = AppComponents().apiManager;

  Future<void> onPressed() async {
    try {} on DioException catch (error) {
      throw Exception(
        error.response?.data['message'],
      );
    }
  }

  @override
  void initState() {
    super.initState();
    AppComponents().backButton.show();
    AppComponents().mainButton.onClick(tg.JsVoidCallback(() {
      context.router.pop();
    }));
    AppComponents().mainButton.text = 'Dashboards';
    AppComponents().mainButton.show();
  }

  @override
  void dispose() {
    urlController.dispose();
    nameController.dispose();
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
                children: [
                  Card(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          leading: const Icon(
                            Icons.backup,
                            color: Colors.green,
                          ),
                          onTap: () {
                            onShowButton(
                              title: 'Are you sure?',
                              onOk: () => apiManager.backup(widget.apiKey),
                              onCancel: () => context.router.pop(),
                              okText: 'Backup',
                            );
                            context.router.pop();
                          },
                          title: Text('Backup'),
                        ),
                        const Divider(
                          height: 1,
                          indent: 16,
                          endIndent: 16,
                        ),
                        ListTile(
                          leading: const Icon(
                            Icons.restart_alt,
                            color: Colors.red,
                          ),
                          onTap: () {
                            onShowButton(
                              title: 'Are you sure?',
                              onOk: () => apiManager.restart(widget.apiKey),
                              onCancel: () => context.router.pop(),
                              okText: 'Restart',
                            );
                            context.router.pop();
                          },
                          title: Text('Restart'),
                        ),
                        const Divider(
                          height: 1,
                          indent: 16,
                          endIndent: 16,
                        ),
                        ListTile(
                          leading: const Icon(
                            Icons.restore,
                            color: Colors.blue,
                          ),
                          onTap: () {
                            onShowButton(
                              title: 'Are you sure?',
                              onOk: () => apiManager.restore(widget.apiKey),
                              onCancel: () => context.router.pop(),
                              okText: 'Restore',
                            );
                            context.router.pop();
                          },
                          title: Text('Restore'),
                        ),
                      ],
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
              onPressed: () => context.router.pop(),
              child: const Icon(Icons.dashboard),
            )
          : null,
    );
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
