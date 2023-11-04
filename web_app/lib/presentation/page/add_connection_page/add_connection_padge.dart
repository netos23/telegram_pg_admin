import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_telegram_web_app/flutter_telegram_web_app.dart';
import 'package:web_app/data/api_client/profile_service.dart';
import 'package:web_app/domain/entity/connection.dart';
import 'package:web_app/internal/app_components.dart';

@RoutePage()
class AddConnectionPage extends StatefulWidget {
  AddConnectionPage({super.key});

  ProfileService profileService = AppComponents().profileService;

  TextEditingController urlController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  State<AddConnectionPage> createState() => _AddConnectionPageState();

  Future<void> onPressed() async {
    try {
      final result = await profileService.createApikey(
        request: Connection(
          name: nameController.text,
          url: urlController.text,
          tgUserId: WebAppUser().id.toString(),
      ),
      );
    } on DioException catch (error) {
      throw Exception(
        error.response?.data['message'],
      );
    }
  }
}

class _AddConnectionPageState extends State<AddConnectionPage> {
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
                          TextField(
                            textAlign: TextAlign.start,
                            controller: widget.nameController,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.onBackground,
                              overflow: TextOverflow.ellipsis,
                            ),
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Название',
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          TextField(
                            textAlign: TextAlign.start,
                            controller: widget.urlController,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.onBackground,
                              overflow: TextOverflow.ellipsis,
                            ),
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Url',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
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
                        widget.onPressed();
                        context.router.pop();
                      },
                      child: const Center(
                        child: Text('Save'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
