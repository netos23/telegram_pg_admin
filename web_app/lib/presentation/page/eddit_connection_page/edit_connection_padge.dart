import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_telegram_web_app/flutter_telegram_web_app.dart' as tg;
import 'package:web_app/domain/entity/connection.dart';
import 'package:web_app/internal/app_components.dart';
import 'package:web_app/presentation/router/app_router.dart';
import 'package:web_app/presentation/widgets/custom_allert_dialog.dart';
import 'package:web_app/presentation/widgets/custom_dialog.dart';

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
    AppComponents().backButton.show();
    AppComponents().mainButton.onClick(
      tg.JsVoidCallback(
          onEdit,
      ),
    );
    AppComponents().backButton.onClick(
      tg.JsVoidCallback((){
        onDispose();
        context.router.pop();

      }
      ),
    );
    AppComponents().mainButton.text = 'Edit';
    AppComponents().mainButton.show();
  }

  void onDispose(){
    AppComponents().mainButton.hide();
    AppComponents().backButton.hide();
    AppComponents().mainButton.offClick(
      tg.JsVoidCallback(
        onEdit,
      ),
    );
    AppComponents().backButton.offClick(
      tg.JsVoidCallback((){
        onDispose();
        context.router.pop();

      }
      ),
    );
    AppComponents().mainButton.onClick(
      tg.JsVoidCallback(
            () {
          context.router.push(AddConnectionRoute());
        },
      ),
    );
    AppComponents().mainButton.text = 'Add connection';
    AppComponents().mainButton.show();

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
        onDispose();
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              flex: 7,
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
                            Flexible(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: IconButton(
                                    onPressed: () => setState(() {
                                          widget.connection =
                                              widget.connection?.copyWith(
                                            isActive:
                                                !(widget.connection?.isActive ==
                                                    true),
                                          );
                                        }),
                                    icon: widget.connection?.isActive == true
                                        ? const Icon(Icons.notifications_active)
                                        : const Icon(
                                            Icons.notifications_none_outlined)),
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
                onPressed: onEdit,
                child: const Icon(Icons.edit),
              )
            : null);
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
