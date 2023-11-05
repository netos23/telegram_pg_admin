import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_telegram_web_app/flutter_telegram_web_app.dart' as tg;
import 'package:rxdart/rxdart.dart';
import 'package:web_app/domain/api_manager.dart';
import 'package:web_app/domain/entity/dump.dart';
import 'package:web_app/domain/entity/long_transaction.dart';
import 'package:web_app/domain/entity/top_transaction.dart';
import 'package:web_app/internal/app_components.dart';
import 'package:web_app/presentation/page/dashboard_page/widgets/custom_transaction_detail_dialog.dart';
import 'package:web_app/presentation/router/app_router.dart';
import 'package:web_app/presentation/widgets/custom_dialog.dart';

@RoutePage()
class CommandPage extends StatefulWidget {
  const CommandPage({
    super.key,
    @QueryParam() this.apiKey = '',
  });

  final String apiKey;

  @override
  State<CommandPage> createState() => _CommandPageState();
}

class _CommandPageState extends State<CommandPage> {
  final TextEditingController urlController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    urlController.dispose();
    nameController.dispose();
    super.dispose();
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
                  'MANAGEMENT',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: theme.colorScheme.onSurface,
                  ),
                ),
              ),
              ServerCommandMenu(
                apiKey: widget.apiKey,
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 10,
                ),
                child: Text(
                  'LONG TRANSACTIONS',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: theme.colorScheme.onSurface,
                  ),
                ),
              ),
              TransactionsMenu(
                apiKey: widget.apiKey,
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 10,
                ),
                child: Text(
                  'TOP TRANSACTIONS',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: theme.colorScheme.onSurface,
                  ),
                ),
              ),
              TopTransactions(
                apiKey: widget.apiKey,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: GestureDetector(
                  onTap: () {
                    Clipboard.setData(
                      ClipboardData(
                        text: tg.initDataUnsafe.user?.id.toString() ?? '',
                      ),
                    );
                    tg.HapticFeedback.selectionChanged();
                  },
                  child: Text(tg.initDataUnsafe.user?.id.toString() ?? ''),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.router.popAndPush(DashboardRoute(
            apiKey: widget.apiKey,
          ));
        },
        child: const Icon(Icons.dashboard),
      ),
    );
  }
}

class ServerCommandMenu extends StatefulWidget {
  const ServerCommandMenu({
    super.key,
    required this.apiKey,
  });

  final String apiKey;

  @override
  State<ServerCommandMenu> createState() => _ServerCommandMenuState();
}

class _ServerCommandMenuState extends State<ServerCommandMenu> {
  final ApiManager apiManager = AppComponents().apiManager;
  final _backupController = BehaviorSubject<List<Dump>>();

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
  void initState() {
    super.initState();
    _updateBackup;
  }

  Future<void> _updateBackup() async {
    try {
      final backups = await apiManager.getDumps(widget.apiKey);
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

  void onBackupButton(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) {
          final backups = _backupController.valueOrNull ?? [];
          return Center(
            child: SizedBox(
              width: 600,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 10,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: ListView.separated(
                            separatorBuilder: (_, __) {
                              return const Divider();
                            },
                            itemBuilder: (context, index) {
                              final item = backups[index];
                              return GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onTap: () {
                                  apiManager.restore(widget.apiKey, item);
                                  context.router.pop();
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(item.name),
                                    Text(item.datetime),
                                  ],
                                ),
                              );
                            },
                            itemCount: backups.length,
                            shrinkWrap: true,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                        child: ElevatedButton(
                            onPressed: context.router.pop,
                            child: const Text('Cancel')))
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: [
          ListTile(
            leading: const Icon(
              Icons.backup,
              color: Colors.green,
            ),
            onTap: () {
              onShowButton(
                title: 'Are you sure?',
                onOk: () {
                  apiManager.backup(widget.apiKey);
                  context.router.pop();
                },
                onCancel: () {
                  context.router.pop();
                },
                okText: 'Backup',
                cancelText: 'Cancel',
                message: 'It seems dangerous!',
              );
            },
            title: const Text('Backup'),
          ),
          const Divider(
            height: 1,
            indent: 16,
            endIndent: 16,
          ),
          ListTile(
            leading: const Icon(
              Icons.restart_alt,
              color: Colors.orange,
            ),
            onTap: () {
              onShowButton(
                title: 'Are you sure?',
                onOk: () {
                  apiManager.restart(widget.apiKey);
                  context.router.pop();
                },
                onCancel: () {
                  context.router.pop();
                },
                okText: 'Restart',
                cancelText: 'Cancel',
                message: 'It seems dangerous!',
              );
            },
            title: const Text('Restart'),
          ),
          const Divider(
            height: 1,
            indent: 16,
            endIndent: 16,
          ),
          ListTile(
            leading: const Icon(
              Icons.restore,
              color: Colors.blue,
            ),
            onTap: () {
              onShowButton(
                title: 'Are you sure?',
                onOk: () async {
                  await context.router.pop();
                  onBackupButton(context);
                },
                onCancel: context.router.pop,
                okText: 'Restore',
                cancelText: 'Cancel',
                message: 'It seems dangerous!',
              );
            },
            title: const Text('Restore'),
          ),
        ],
      ),
    );
  }
}

class TransactionsMenu extends StatefulWidget {
  const TransactionsMenu({
    super.key,
    required this.apiKey,
  });

  final String apiKey;

  @override
  State<TransactionsMenu> createState() => _TransactionsMenuState();
}

class _TransactionsMenuState extends State<TransactionsMenu> {
  final _apiManager = AppComponents().apiManager;
  final _transactionController = BehaviorSubject<List<LongTransaction>>();

  @override
  void initState() {
    super.initState();
    _updateTransactions();
  }

  Future<void> _updateTransactions() async {
    try {
      final transactions = await _apiManager.getLongTransactions(widget.apiKey);
      _transactionController.add(transactions);
    } on Object catch (e, s) {
      _transactionController.addError(e, s);
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _transactionController,
      builder: (context, snapshot) {
        final transactions = snapshot.data;
        final error = snapshot.error;

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
        if (transactions == null) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        }

        return Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            children: transactions.indexed.expand(
              (e) {
                final index = e.$1;
                final transaction = e.$2;
                return [
                  ListTile(
                    trailing: Text(
                      transaction.duration.toStringAsFixed(3),
                    ),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) {
                          return CustomDialog(
                            title: 'Do you want to kill this transaction?',
                            onOk: () {
                              _apiManager.stopTransaction(
                                  widget.apiKey, transaction.pid.toString());
                              _updateTransactions();
                              context.router.pop();
                            },
                            onCancel: () => context.router.pop(),
                            okText: 'Kill',
                            cancelText: 'Cancel',
                          );
                        },
                      );
                    },
                    title: Text(transaction.pid.toString()),
                    subtitle: Text(transaction.query),
                  ),
                  if (index != transactions.length - 1)
                    const Divider(
                      height: 1,
                      indent: 16,
                      endIndent: 16,
                    ),
                ];
              },
            ).toList(),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _transactionController.close();
    super.dispose();
  }
}

class TopTransactions extends StatefulWidget {
  const TopTransactions({
    super.key,
    required this.apiKey,
  });

  final String apiKey;

  @override
  State<TopTransactions> createState() => _TopTransactionsState();
}

class _TopTransactionsState extends State<TopTransactions> {
  final _apiManager = AppComponents().apiManager;
  final _transactionController = BehaviorSubject<List<TopTransaction>>();

  @override
  void initState() {
    super.initState();
    _updateTransactions();
  }

  Future<void> _updateTransactions() async {
    try {
      final transactions = await _apiManager.getTopTransactions(widget.apiKey);
      _transactionController.add(transactions);
    } on Object catch (e, s) {
      _transactionController.addError(e, s);
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _transactionController,
      builder: (context, snapshot) {
        final transactions = snapshot.data;
        final error = snapshot.error;

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
        if (transactions == null) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        }

        return Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            children: transactions.indexed.expand(
              (e) {
                final index = e.$1;
                final transaction = e.$2;
                var query = transaction.query;
                return [
                  ListTile(
                    onTap: () => showDialog(
                      context: context,
                      builder: (_) {
                        return CustomTransactionDetailDialog(
                          transaction: transaction,
                          title: 'Transaction detail',
                          okText: 'Cancel',
                        );
                      },
                    ),
                    trailing: Text(
                      transaction.count.toString(),
                    ),
                    title: Text(
                      query.substring(
                        0,
                        min(query.length, 100),
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text(
                      Duration(
                        milliseconds: transaction.durationSum,
                      ).toString(),
                    ),
                  ),
                  if (index != transactions.length - 1)
                    const Divider(
                      height: 1,
                      indent: 16,
                      endIndent: 16,
                    ),
                ];
              },
            ).toList(),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _transactionController.close();
    super.dispose();
  }
}

/*

class AppInfo extends StatelessWidget {
  const AppInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: [
          Text(tg.WebAppChat().title),
          Text(tg.initData),
          Text(tg.WebAppChat().photo_url.toString()),
          Text(tg.initData ?? ''),
          Text(tg.initDataUnsafe.chat?.title.toString() ?? ''),
          Text(tg.initDataUnsafe.chat?..toString() ?? ''),
        ],
      ),
    );
  }
}

*/
