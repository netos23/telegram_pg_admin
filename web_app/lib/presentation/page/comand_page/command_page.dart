import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:web_app/data/api_client/profile_service.dart';
import 'package:web_app/domain/entity/connection.dart';
import 'package:web_app/internal/app_components.dart';
import 'package:web_app/presentation/router/app_router.dart';

@RoutePage()
class CommandPage extends StatefulWidget {
  CommandPage({super.key,});

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
                        child: Text('Сохранить'),
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
}
