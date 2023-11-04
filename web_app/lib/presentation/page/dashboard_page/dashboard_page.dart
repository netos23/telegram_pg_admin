import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_telegram_web_app/flutter_telegram_web_app.dart' as tg;
import 'package:web_app/domain/entity/dashboard.dart';
import 'package:web_app/domain/entity/dashboard_filter.dart';
import 'package:web_app/internal/app_components.dart';
import 'package:web_app/presentation/page/dashboard_page/widgets/dashboard.dart';
import 'package:web_app/presentation/router/app_router.dart';
import 'package:web_app/presentation/widgets/empty_widget.dart';

@RoutePage()
class DashboardPage extends StatefulWidget {
  const DashboardPage({
    super.key,
    @QueryParam() this.apiKey = '',
  });

  final String apiKey;

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late final Future<List<Dashboard>> _dashFeature =
      AppComponents().dashboardApiClient.getDashboards(
            _buildFilter(),
          );

  DashboardFilter _buildFilter() {
    final now = DateTime.now();

    return DashboardFilter(
      apiKey: widget.apiKey,
      from: now
          .subtract(
            const Duration(
              minutes: 15,
            ),
          )
          .millisecondsSinceEpoch,
      to: now.millisecondsSinceEpoch,
    );
  }

  void onDispose() {
    AppComponents().mainButton.hide();
    AppComponents().backButton.hide();
    AppComponents().mainButton.offClick(tg.JsVoidCallback(() {
      context.router.popAndPush(CommandRoute(
        apiKey: widget.apiKey,
      ));
    }));
    AppComponents().backButton.offClick(tg.JsVoidCallback(() {
      onDispose();
      context.router.pop();
    }));
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

  void onReplace() {
    AppComponents().mainButton.hide();
    AppComponents().mainButton.offClick(tg.JsVoidCallback(() {
      context.router.popAndPush(CommandRoute(
        apiKey: widget.apiKey,
      ));
    }));
  }


  @override
  void initState() {
    super.initState();
    AppComponents().mainButton.onClick(tg.JsVoidCallback(() {
      onReplace();
      context.router.popAndPush(CommandRoute(
        apiKey: widget.apiKey,
      ));
    }));
    AppComponents().backButton.onClick(tg.JsVoidCallback(() {
      onDispose();
      context.router.pop();
    }));
    AppComponents().mainButton.text = 'To commands < >';
    AppComponents().backButton.show();
    AppComponents().mainButton.show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _dashFeature,
        builder: (context, snapshot) {
          final dashboards = snapshot.data;
          final error = snapshot.error;

          if (error != null) {
            return Center(
              child: Text('Errror: $error'),
            );
          }
          if (dashboards == null) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          }

          if (dashboards.isEmpty) {
            return const EmptyWidget(
              description: 'Данных пока нет!',
            );
          }
          return GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 500,
              childAspectRatio: 4 / 3,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
            ),
            itemCount: dashboards.length,
            itemBuilder: (context, index) {
              final dashboard = dashboards[index];

              return DashboardWidget(
                dashboard: dashboard,
              );
            },
          );
        },
      ),
      floatingActionButton: !tg.isSupported
          ? FloatingActionButton(
              onPressed: () {
                onReplace();
                context.router.popAndPush(CommandRoute(
                  apiKey: widget.apiKey,
                ));
              },
              child: const Icon(Icons.code),
            )
          : null,
    );
  }
}
