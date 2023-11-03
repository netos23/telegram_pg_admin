import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:web_app/data/api_client/connection_api_client.dart';
import 'package:web_app/domain/entity/connection.dart';
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
  late final Future<List<Connection>> _connections =
      ConnectionApiClient().getConnections();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: 600,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: FutureBuilder<List<Connection>>(
                  future: _connections,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData || snapshot.data == null) {
                      return const SizedBox.shrink();
                    }
                    final connections = snapshot.data!;
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: connections.length,
                      itemBuilder: (context, index) {
                        final connection = connections[index];
                        return Card(
                          child: InkWell(
                            onTap: () =>
                                context.router.push(const DashboardRoute()),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        connection.name,
                                        style: theme.textTheme.bodyLarge,
                                      ),
                                      Text(connection.url ?? ''),
                                    ],
                                  ),
                                  const Spacer(),
                                  Flexible(
                                    child: IconButton(
                                        onPressed: () => context.router.push(
                                              EditConnectionRoute(
                                                  connection: connection),
                                            ),
                                        icon: const Icon(
                                            Icons.settings_outlined)),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.router.push(AddConnectionRoute()),
        child: const Icon(Icons.add),
      ),
    );
  }
}
