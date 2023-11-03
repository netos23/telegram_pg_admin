import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:web_app/presentation/page/add_connection_page/add_connection_padge.dart';
import 'package:web_app/presentation/page/dashboard_page/dashboard_page.dart';
import 'package:web_app/presentation/page/page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: MainRoute.page,
          initial: true,
        ),
        AutoRoute(
          page: DashboardRoute.page,
        ),
        AutoRoute(
          page: AddConnectionRoute.page,
        ),
      ];
}
