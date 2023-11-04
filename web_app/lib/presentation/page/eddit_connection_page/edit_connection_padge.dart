import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_telegram_web_app/flutter_telegram_web_app.dart' as tg;
import 'package:web_app/domain/entity/connection.dart';
import 'package:web_app/internal/app_components.dart';
import 'package:web_app/presentation/router/app_router.dart';
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
                                              isActive: !(widget
                                                      .connection?.isActive ==
                                                  true),
                                            );
                                          }),
                                      icon: widget.connection?.isActive == true
                                          ? const Icon(
                                              Icons.notifications_active)
                                          : const Icon(Icons
                                              .notifications_none_outlined)),
                                ))
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
