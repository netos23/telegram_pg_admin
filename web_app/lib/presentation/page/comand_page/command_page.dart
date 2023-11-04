import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_telegram_web_app/flutter_telegram_web_app.dart';
import 'package:web_app/data/api_client/profile_service.dart';
import 'package:web_app/domain/entity/connection.dart';
import 'package:web_app/internal/app_components.dart';
import 'package:web_app/presentation/router/app_router.dart';

@RoutePage()
class CommandPage extends StatefulWidget {
  CommandPage({
    super.key,
  });

  final ProfileService profileService = AppComponents().profileService;
  final TextEditingController urlController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  State<CommandPage> createState() => _CommandPageState();

  Future<void> onPressed() async {
    try {
      final result = await profileService.patchConnection(
        request: Connection(
          name: nameController.text,
          url: urlController.text,
        ),
      );
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
    AppComponents().backButton.isVisible = true;

  }

  @override
  void dispose() {
    AppComponents().backButton.isVisible = false;
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
                                  onOk: () => context.router.pop(),
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
                                  onOk: () => context.router.pop(),
                                  onCancel: () => context.router.pop(),
                                  okText: 'Reboot',
                                );
                                context.router.pop();
                              },
                              child: const Center(
                                child: Text('db reboot'),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.router.replace(const DashboardRoute()),
        child: const Icon(Icons.dashboard),
      ),
    );
  }

  void onShowButton({
    required String title,
    required void Function() onOk,
    required void Function() onCancel,
    String? okText,
    String? cancelText,
  }) {
    TelegramPopup(
      title: "Are you sure?",
      message: 'It seems dangerous!',
      buttons: [
        PopupButton(
          id: okText ?? 'Ok',
          type: PopupButtonType.destructive,
          text: okText,
        ),
        PopupButton(
          id: okText ?? "Cancel",
          type: PopupButtonType.cancel,
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
