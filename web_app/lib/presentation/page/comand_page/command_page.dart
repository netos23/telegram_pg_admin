import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_telegram_web_app/flutter_telegram_web_app.dart' as tg;
import 'package:web_app/domain/api_manager.dart';
import 'package:web_app/internal/app_components.dart';
import 'package:web_app/presentation/router/app_router.dart';

@RoutePage()
class CommandPage extends StatefulWidget {
  CommandPage({
    super.key,
  });
  final TextEditingController urlController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final ApiManager apiManager = AppComponents().apiManager;

  @override
  State<CommandPage> createState() => _CommandPageState();

  Future<void> onPressed() async {
    try {
    } on DioException catch (error) {
      throw Exception(
        error.response?.data['message'],
      );
    }
  }
}

class _CommandPageState extends State<CommandPage> {
  @override
  void initState() {
    super.initState();
    AppComponents().backButton.show();
    AppComponents().mainButton.onClick(tg.JsVoidCallback(() {
      context.router.replace(const DashboardRoute());
    }));
    AppComponents().mainButton.text = 'Dashboards';
    AppComponents().mainButton.show();
  }

  @override
  void dispose() {
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(32),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 50,
                            child: ElevatedButton(
                              style: theme.filledButtonTheme.style?.copyWith(
                                fixedSize: const MaterialStatePropertyAll(
                                  Size.fromHeight(50),
                                ),
                              ),
                              onPressed: () {
                                onShowButton(
                                  title: 'Are you sure?',
                                  onOk: () => widget.apiManager.backup(),
                                  onCancel: () => context.router.pop(),
                                  okText: 'Backup',
                                );
                                context.router.pop();
                              },
                              child: const Center(
                                child: Text('db restart'),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            height: 82,
                            child: ElevatedButton(
                              style: theme.filledButtonTheme.style?.copyWith(
                                fixedSize: const MaterialStatePropertyAll(
                                  Size.fromHeight(50),
                                ),
                              ),
                              onPressed: () {
                                onShowButton(
                                  title: 'Are you sure?',
                                  onOk: () => widget.apiManager.restart(),
                                  onCancel: () => context.router.pop(),
                                  okText: 'Restart',
                                );
                                context.router.pop();
                              },
                              child: const Center(
                                child: Text('db restart'),
                              ),
                            ),

                          ),
                          SizedBox(
                            height: 50,
                            child: ElevatedButton(
                              style: theme.filledButtonTheme.style?.copyWith(
                                fixedSize: const MaterialStatePropertyAll(
                                  Size.fromHeight(50),
                                ),
                              ),
                              onPressed: () {
                                onShowButton(
                                  title: 'Are you sure?',
                                  onOk: () => widget.apiManager.restore(),
                                  onCancel: () => context.router.pop(),
                                  okText: 'Restore',
                                );
                                context.router.pop();
                              },
                              child: const Center(
                                child: Text('db restore'),
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
      floatingActionButton: !tg.isSupported ? FloatingActionButton(
        onPressed: () => context.router.replace(const DashboardRoute()),
        child: const Icon(Icons.dashboard),
      ) : null,
    );
  }

  void onShowButton({
    required String title,
    required void Function() onOk,
    required void Function() onCancel,
    String? okText,
    String? cancelText,
  }) {
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
  }
}
