import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_telegram_web_app/flutter_telegram_web_app.dart' as tg;
import 'package:rxdart/subjects.dart';
import 'package:web_app/domain/api_manager.dart';
import 'package:web_app/domain/entity/dump.dart';
import 'package:web_app/internal/app_components.dart';
import 'package:web_app/presentation/widgets/custom_dialog.dart';

@RoutePage()
class BackupsPage extends StatefulWidget {
  const BackupsPage({
    super.key,
    @queryParam this.apikey = '',
  });

  final String apikey;

  @override
  State<BackupsPage> createState() => _BackupsPageState();
}

class _BackupsPageState extends State<BackupsPage> {
  final ApiManager apiManager = AppComponents().apiManager;
  final _backupController = BehaviorSubject<List<Dump>>();

  @override
  void initState() {
    super.initState();
    _updateBackup();
  }

  Future<void> _updateBackup() async {
    try {
      final backups = await apiManager.getDumps(widget.apikey);
      _backupController.add(backups);
    } on Object catch (e, s) {
      _backupController.addError(e, s);
    }
  }

  @override
  void dispose() {
    _backupController.close();
    super.dispose();
  }

  void onShowButton({
    required String title,
    required String message,
    required void Function() onOk,
    required void Function() onCancel,
    String? okText,
    String? cancelText,
  }) {
    if (false) {
      tg.TelegramPopup(
        title: title,
        message: message,
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
          if (buttonId == "Ok") return onCancel();
          if (buttonId == "Cancel") return onOk();
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 600,
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 10,
                ),
                child: Text(
                  'BACKUPS',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: theme.colorScheme.onSurface,
                  ),
                ),
              ),
              StreamBuilder(
                  stream: _backupController,
                  builder: (context, snapshot) {
                    final error = snapshot.error;
                    final backups = snapshot.data;

                    if (error != null) {
                      return Card(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: ListTile(
                          title: Center(
                            child: Text('Errror: $error'),
                          ),
                        ),
                      );
                    }
                    if (backups == null) {
                      return const Center(
                        child: CupertinoActivityIndicator(),
                      );
                    }

                    return Card(
                      margin: EdgeInsets.zero,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        separatorBuilder: (_, snapshot) {
                          return const Divider(
                            height: 1,
                            indent: 16,
                            endIndent: 16,
                          );
                        },
                        itemCount: backups.length,
                        itemBuilder: (context, index) {
                          final item = backups[index];
                          return ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                            ),
                            title: Text(item.name),
                            subtitle: Text(
                              DateTime.fromMillisecondsSinceEpoch(
                                item.datetime,
                              ).toString(),
                            ),
                            trailing: Text('${item.size} B'),
                            onTap: () {
                              onShowButton(
                                title: 'Are you sure?',
                                onOk: () async {
                                  apiManager.restore(widget.apikey, item);
                                  context.router.pop();
                                },
                                onCancel: context.router.pop,
                                okText: 'Restore',
                                cancelText: 'Cancel',
                                message: 'It seems dangerous!',
                              );
                            },
                          );
                        },
                      ),
                    );
                  }),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () => context.router.pop(),
                child: SizedBox(
                  height: 50,
                  child: Center(
                    child: const Text(
                      'Cancel',
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
