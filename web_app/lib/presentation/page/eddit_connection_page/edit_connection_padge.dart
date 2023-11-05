import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_telegram_web_app/flutter_telegram_web_app.dart' as tg;
import 'package:web_app/domain/entity/connection.dart';
import 'package:web_app/internal/app_components.dart';
import 'package:web_app/presentation/widgets/custom_allert_dialog.dart';

@RoutePage()
class EditConnectionPage extends StatefulWidget {
  EditConnectionPage({super.key, required this.connection});

  Connection? connection;

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
    urlController.text = widget.connection?.url ?? '';
    nameController.text = widget.connection?.name ?? '';
  }

  Future<void> onEdit() async {
    if (urlController.text.isNotEmpty && nameController.text.isNotEmpty) {
      if (!urlController.text.startsWith('https://') &&
          !urlController.text.startsWith('http://')) {
        showCustomAlertDialog(
          'Please send me a valid url. http or https is required.',
          'Invalid url',
        );
      } else {
        await onPatchConnection();
        AppComponents().backButton.hide();
        context.router.pop();
      }
    } else {
      showCustomAlertDialog(
        'Enter the connection name and url to create',
        'Empty data',
      );
    }
  }

  Future<void> onPatchConnection() async {
    try {
      await apiManager.patchConnections(widget.connection!);
    } on DioException catch (error) {
      throw Exception(
        error.response?.data['message'],
      );
    }
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 10,
                      ),
                      child: Text(
                        'SETTINGS',
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
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
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 10,
                      ),
                      child: Text(
                        'NOTIFICATIONS',
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      child: ListTile(
                        title: const Text('Error notifications'),
                        trailing: CupertinoSwitch(
                          onChanged: (_) => setState(() {
                            widget.connection = widget.connection?.copyWith(
                              isActive: !(widget.connection?.isActive == true),
                            );
                          }),
                          value: widget.connection?.isActive == true,
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
          onPressed: onEdit,
          child: const Icon(Icons.edit),
        ));
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
