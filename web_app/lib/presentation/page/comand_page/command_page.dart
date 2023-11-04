import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_telegram_web_app/flutter_telegram_web_app.dart' as tg;
import 'package:rxdart/rxdart.dart';
import 'package:web_app/domain/api_manager.dart';
import 'package:web_app/domain/entity/long_transaction.dart';
import 'package:web_app/domain/entity/top_transaction.dart';
import 'package:web_app/internal/app_components.dart';
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

  Future<void> onPressed() async {
    try {} on DioException catch (error) {
      throw Exception(
        error.response?.data['message'],
      );
    }
  }

  @override
  void initState() {
    super.initState();
    AppComponents().backButton.show();
    AppComponents().mainButton.onClick(tg.JsVoidCallback(() {
      context.router.pop();
    }));
    AppComponents().mainButton.text = 'Dashboards';
    AppComponents().mainButton.show();
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
                  'УПРАВЛЕНИЕ',
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
                  'ДЛИННЫЕ ТРАНЗАКЦИИ',
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
                  'ТОП ТРАНЗАКЦИЙ',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: theme.colorScheme.onSurface,
                  ),
                ),
              ),
              TopTransactions(
                apiKey: widget.apiKey,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: !tg.isSupported
          ? FloatingActionButton(
              onPressed: () => context.router.pop(),
              child: const Icon(Icons.dashboard),
            )
          : null,
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
                onOk: () => apiManager.backup(widget.apiKey),
                onCancel: () => context.router.pop(),
                okText: 'Backup',
              );
              context.router.pop();
            },
            title: Text('Backup'),
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
                onOk: () => apiManager.restart(widget.apiKey),
                onCancel: () => context.router.pop(),
                okText: 'Restart',
              );
              context.router.pop();
            },
            title: Text('Restart'),
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
                onOk: () => apiManager.restore(widget.apiKey),
                onCancel: () => context.router.pop(),
                okText: 'Restore',
              );
              context.router.pop();
            },
            title: Text('Restore'),
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
        final theme = Theme.of(context);
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
                      transaction.duration,
                    ),
                    title: Text(transaction.pid),
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
        final theme = Theme.of(context);
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
                      transaction.count.toString(),
                    ),
                    title: Text(transaction.query),
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
