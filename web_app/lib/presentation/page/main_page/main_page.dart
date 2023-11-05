import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_telegram_web_app/flutter_telegram_web_app.dart' as tg;
import 'package:rxdart/rxdart.dart';
import 'package:web_app/domain/entity/connection.dart';
import 'package:web_app/internal/app_components.dart';
import 'package:web_app/presentation/router/app_router.dart';
import 'package:web_app/presentation/widgets/empty_widget.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final apiManager = AppComponents().apiManager;

  final BehaviorSubject<List<Connection>> connectionController =
      BehaviorSubject.seeded([]);

  @override
  void initState() {
    super.initState();

    apiManager.connectionController.listen((value) {
      connectionController.add(value);
    });

    apiManager.updateConnections();
  }

  void onNavigate(){
    AppComponents().backButton.show();
    AppComponents().backButton.onClick(tg.JsVoidCallback(() {
      context.router.pop();
      AppComponents().backButton.hide();
    }));
  }

  @override
  void dispose() {
    connectionController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: StreamBuilder<List<Connection>>(
        stream: connectionController,
        initialData: const [],
        builder: (context, snapshot) {
          final connections = snapshot.data;

          if (connections == null) {
            return const SizedBox.shrink();
          }

          if (connections.isEmpty) {
            return const EmptyWidget(
              description: 'Добавьте свое первое соединение!',
            );
          }

          return GridView.builder(
            padding: const EdgeInsets.symmetric(vertical: 32.0),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 400,
              childAspectRatio: 2 / 1,
            ),
            itemCount: connections.length,
            itemBuilder: (context, index) {
              final connection = connections[index];
              return Padding(
                padding: const EdgeInsets.all(8),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    minHeight: 190,
                  ),
                  child: Card(
                    child: InkWell(
                      onTap: () {
                        onNavigate();
                        context.router.push(
                          DashboardRoute(
                            apiKey: connection.apikey ?? '',
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              connection.name,
                              style: theme.textTheme.bodyLarge,
                            ),
                            Text(
                              connection.url ?? '',
                              overflow: TextOverflow.ellipsis,
                            ),
                            GestureDetector(
                              onTap: () {
                                Clipboard.setData(
                                  ClipboardData(
                                    text:  connection.apikey ?? '',
                                  ),
                                );
                                tg.HapticFeedback.selectionChanged();
                              },
                              child: Text(
                                connection.apikey ?? '',
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                    onPressed: () async {
                                      onNavigate();
                                      await context.router.push(
                                          EditConnectionRoute(
                                              connection: connection));
                                      apiManager.updateConnections();
                                    },
                                    icon: const Icon(Icons.settings_outlined)),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
              onPressed: () async {
                onNavigate();
                await context.router.push(AddConnectionRoute());
                apiManager.updateConnections();
              },
              child: const Icon(Icons.add),
            )
    );
  }
}
