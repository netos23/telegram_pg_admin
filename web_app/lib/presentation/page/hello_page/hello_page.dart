import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_telegram_web_app/flutter_telegram_web_app.dart' as tg;
import 'package:rxdart/rxdart.dart';
import 'package:web_app/domain/entity/connection.dart';
import 'package:web_app/internal/app_components.dart';

@RoutePage()
class HelloPage extends StatefulWidget {
  const HelloPage({super.key});

  @override
  State<HelloPage> createState() => _HelloPageState();
}

class _HelloPageState extends State<HelloPage> {
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


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return const Scaffold(
        body: Placeholder(),
    );
  }
}
