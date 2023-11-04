import 'package:rxdart/rxdart.dart';
import 'package:web_app/data/api_client/api_client.dart';
import 'package:web_app/domain/entity/command.dart';
import 'package:web_app/domain/entity/connection.dart';

class ApiManager {
  late final ApiClient apiClient;

  ApiManager({required this.apiClient});

  final BehaviorSubject<List<Connection>> connectionController =
      BehaviorSubject.seeded([]);

  Future<void> updateConnections() async {
    final result = await apiClient.getConnections();
    connectionController.add(result);
  }

  Future<void> patchConnections(Connection request) async {
    final result = await apiClient.patchConnections(request: request);
    final value = (connectionController.valueOrNull ?? [])
        .where((element) => element.id != request.id).toList();
    value.add(result);
    connectionController.add(value);
  }

  Future<void> create(Connection request) async {
    final result = await apiClient.createApikey(request: request);
    final value = connectionController.valueOrNull ?? [];
    value.add(result);
    connectionController.add(value);
  }

  Future<void> backup() async {
    await apiClient.execCommand(
      request: Command(command: 'backup'),
    );
  }

  Future<void> restore() async {
    await apiClient.execCommand(
      request: Command(command: 'restore'),
    );
  }

  Future<void> restart() async {
    await apiClient.execCommand(
      request: Command(command: 'restart'),
    );
  }
}