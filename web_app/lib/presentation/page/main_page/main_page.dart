import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:web_app/data/api_client/dashboard_api_client.dart';
import 'package:web_app/domain/entity/connection.dart';
import 'package:web_app/domain/entity/dashboard.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: 600,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return const Card(
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Text('Хуяк и лето'),
                      ),
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
