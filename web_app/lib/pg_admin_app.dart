import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_telegram_web_app/flutter_telegram_web_app.dart' as tg;
import 'package:provider/provider.dart';
import 'package:web_app/internal/app_components.dart';
import 'package:web_app/presentation/router/app_router.dart';
import 'package:web_app/presentation/widgets/tg_theme_listener.dart';

class PgAdminApp extends StatelessWidget {
  PgAdminApp({
    super.key,
  });

  final _appRouter = AppComponents().appRouter;

  @override
  Widget build(BuildContext context) {
    return TelegramThemeListener(
      builder: (context) {
        return MaterialApp.router(
          themeMode: context.watch<ValueNotifier<ThemeMode>>().value,
          theme: tg.TelegramTheme.light,
          darkTheme: tg.TelegramTheme.dark,
          routerConfig: _appRouter.config(
            deepLinkBuilder: (_) => const DeepLink(
              [MainRoute()],
            ),
          ),
        );
      },
    );
  }
}
