import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:web_app/data/api_client/dashboard_api_client.dart';
import 'package:web_app/domain/entity/dashboard.dart';
import 'package:web_app/presentation/page/dashboard_page/widgets/dashboard.dart';

@RoutePage()
class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late final Future<List<Dashboard>> _dashFeature =
  DashBoardApiClient().getDashboards();

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
              child: CircularProgressIndicator(),
            );
          }
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 400,
              mainAxisExtent: 300,
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
    );
  }
}