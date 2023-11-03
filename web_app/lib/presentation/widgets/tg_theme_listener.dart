import 'package:flutter/material.dart';
import 'package:flutter_telegram_web_app/flutter_telegram_web_app.dart' as tg;
import 'package:provider/provider.dart';

class TelegramThemeListener extends StatefulWidget {
  const TelegramThemeListener({
    super.key,
    required this.builder,
  });

  final WidgetBuilder builder;

  @override
  State<TelegramThemeListener> createState() => _TelegramThemeListenerState();
}

class _TelegramThemeListenerState extends State<TelegramThemeListener> {
  final _themeMode = ValueNotifier<ThemeMode>(
    tg.isDarkMode ? ThemeMode.dark : ThemeMode.light,
  );

  @override
  void initState() {
    super.initState();
    tg.TelegramWebEvent.setThemeChangeListener(_listenThemeMode);
  }

  _listenThemeMode(
    bool isDarkMode,
    tg.ThemeParams themeParams,
  ) {
    _themeMode.value = isDarkMode ? ThemeMode.dark : ThemeMode.light;
  }

  @override
  void dispose() {
    _themeMode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _themeMode,
      builder: (context, _) => widget.builder(context),
    );
  }
}
