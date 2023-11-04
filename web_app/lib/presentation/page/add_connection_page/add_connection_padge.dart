import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_telegram_web_app/flutter_telegram_web_app.dart' as tg;
import 'package:web_app/domain/api_manager.dart';
import 'package:web_app/domain/entity/connection.dart';
import 'package:web_app/internal/app_components.dart';
import 'package:web_app/presentation/router/app_router.dart';
import 'package:web_app/presentation/widgets/custom_allert_dialog.dart';

@RoutePage()
class AddConnectionPage extends StatefulWidget {
  AddConnectionPage({super.key});

  ApiManager apiManager = AppComponents().apiManager;

  @override
  State<AddConnectionPage> createState() => _AddConnectionPageState();

  Future<void> onPressed(String name, String url) async {
    try {
      await apiManager.create(
        Connection(
          name: name,
          url: url,
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
  TextEditingController urlController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    AppComponents().backButton.isVisible = true;
    AppComponents().mainButton.onClick(
          tg.JsVoidCallback(onAdd),
        );
    AppComponents().mainButton.text = 'Save';
    AppComponents().mainButton.isVisible = true;
  }

  Future<void> onAdd() async {
    if (urlController.text.isNotEmpty && nameController.text.isNotEmpty) {
      if (!urlController.text.startsWith('https://') &&
          !urlController.text.startsWith('http://')) {
        showCustomAlertDialog(
          'Please send me a valid url. http or https is required.',
          'Invalid url',
        );
      } else {
        await widget.onPressed(nameController.text, urlController.text);
        context.router.pop();
      }
    } else {
      showCustomAlertDialog(
        'Enter the connection name and url to create',
        'Empty data',
      );
    }
  }

  @override
  void dispose() {
    AppComponents().backButton.isVisible = false;
    AppComponents().mainButton.onClick(
      tg.JsVoidCallback(
        () {
          context.router.push(AddConnectionRoute());
        },
      ),
    );
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
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
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
                                hintText: 'Connection title'),
                          ),
                          TextField(
                            textAlign: TextAlign.start,
                            controller: urlController,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              overflow: TextOverflow.ellipsis,
                            ),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Url',
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
              onPressed: onAdd,
              child: const Icon(Icons.check),
            )
          : null,
    );
  }

  void showCustomAlertDialog(String description, String title) {
    if (tg.isSupported) {
      tg.showAlert(description);
    } else {
      showDialog(
        context: context,
        builder: (_) {
          return CustomAlertDialog(
            title: title,
            description: description,
          );
        },
      );
    }
  }
}
