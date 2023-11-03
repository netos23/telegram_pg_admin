import 'package:flutter/material.dart';
import 'package:flutter_telegram_web_app/flutter_telegram_web_app.dart';
import 'package:provider/provider.dart';
import 'package:web_app/presentation/router/app_router.dart';
import 'package:web_app/presentation/widgets/tg_theme_listener.dart';

class PgAdminApp extends StatelessWidget {
  PgAdminApp({
    super.key,
  });

  final  _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return TelegramThemeListener(
      builder: (context) {
        return MaterialApp.router(
          themeMode: context.watch<ValueNotifier<ThemeMode>>().value,
          theme: TelegramTheme.light,
          darkTheme: TelegramTheme.dark,
          routerConfig: _appRouter.config(),
        );
      }
    );
  }
}
