import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_telegram_web_app/flutter_telegram_web_app.dart';
import 'package:web_app/data/api_client/profile_service.dart';
import 'package:web_app/domain/entity/connection.dart';
import 'package:web_app/internal/app_components.dart';
import 'package:web_app/presentation/router/app_router.dart';

@RoutePage()
class EditConnectionPage extends StatefulWidget {
  EditConnectionPage({super.key, required this.connection});

  final ProfileService profileService = AppComponents().profileService;
  final Connection connection;
  final TextEditingController urlController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  State<EditConnectionPage> createState() => _EditConnectionPageState();



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

class _EditConnectionPageState extends State<EditConnectionPage> {

  @override
  void initState() {
    super.initState();
    widget.urlController.text = widget.connection.url ?? '';
    widget.nameController.text = widget.connection.name;
    AppComponents().backButton.show();
    AppComponents().mainButton.onClick(JsVoidCallback(() {
      widget.onPressed();
      context.router.pop();
    }));
    AppComponents().mainButton.text = 'Edit';
    AppComponents().mainButton.show();

  }


  @override
  void dispose() {
    AppComponents().backButton.hide();
    AppComponents().mainButton.onClick(JsVoidCallback(() {
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
