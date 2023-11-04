import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_telegram_web_app/flutter_telegram_web_app.dart' as tg;
import 'package:rxdart/rxdart.dart';
import 'package:web_app/domain/entity/connection.dart';
import 'package:web_app/internal/app_components.dart';
import 'package:web_app/presentation/router/app_router.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  MainPage({super.key});

  final BehaviorSubject<List<Connection>> connectionController =
      BehaviorSubject.seeded([]);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final profileService = AppComponents().apiClient;

  @override
  void initState() {
    super.initState();
    loadConnections();
    AppComponents().backButton.hide();
    AppComponents().mainButton.onClick(tg.JsVoidCallback(() {
      context.router.push(AddConnectionRoute());
    }));
    AppComponents().mainButton.text = 'Add connection';
    AppComponents().mainButton.show();
  }

  @override
  void dispose() {
    widget.connectionController.close();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 32.0),
            child: StreamBuilder<List<Connection>>(
              stream: widget.connectionController,
              initialData: const [],
              builder: (context, snapshot) {
                if (!snapshot.hasData || snapshot.data == null) {
                  return const SizedBox.shrink();
                }
                final connections = snapshot.data!;
                return SizedBox(
                  height: MediaQuery.of(context).size.height - 50,
                  child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 190,
                      mainAxisExtent: 300,
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
                              onTap: () =>
                                  context.router.push(const DashboardRoute()),
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
                                    const Spacer(),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                            onPressed: () =>
                                                context.router.push(
                                                  EditConnectionRoute(
                                                      connection: connection),
                                                ),
                                            icon: const Icon(
                                                Icons.settings_outlined)),
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
                  ),
                );
              },
            ),
          ),
        ),
      ),
      floatingActionButton: !tg.isSupported
          ? FloatingActionButton(
              onPressed: () => context.router.push(AddConnectionRoute()),
              child: const Icon(Icons.add),
            )
          : null,
    );
  }

  Future<void> loadConnections() async {
    final result = await profileService.getConnections();
    widget.connectionController.add(result);
  }
}
