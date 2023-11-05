import 'package:rxdart/rxdart.dart';
import 'package:web_app/data/api_client/api_client.dart';
import 'package:web_app/domain/entity/api_key_model.dart';
import 'package:web_app/domain/entity/command.dart';
import 'package:web_app/domain/entity/connection.dart';
import 'package:web_app/domain/entity/dump.dart';
import 'package:web_app/domain/entity/dump_response.dart';
import 'package:web_app/domain/entity/long_transaction.dart';
import 'package:web_app/domain/entity/top_transaction.dart';

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
    await apiClient.patchConnections(request: request);
    final value = (connectionController.valueOrNull ?? [])
        .where((element) => element.id != request.id)
        .toList();
    connectionController.add(value);
  }

  Future<void> create(Connection request) async {
    await apiClient.createApikey(request: request);
    final value = connectionController.valueOrNull ?? [];
    connectionController.add(value);
  }

  Future<void> backup(String apiKey) async {
    await apiClient.execCommand(
      request: Command(
        command: 'backup',
        apiKey: apiKey,
      ),
    );
  }

  Future<void> restore(String apiKey, Dump dump) async {
    await apiClient.execCommand(
      request: Command(
        command: 'restore',
        parameter: dump.name,
        apiKey: apiKey,
      ),
    );
  }

  Future<void> restart(String apiKey) async {
    await apiClient.execCommand(
      request: Command(
        command: 'restart',
        apiKey: apiKey,
      ),
    );
  }

  Future<List<LongTransaction>> getLongTransactions(String apiKey) async {
    return await apiClient.getLongTransactions(
      request: ApiKeyModel(
        apiKey: apiKey,
      ),
    );
  }

  Future<List<TopTransaction>> getTopTransactions(String apiKey) async {
    return await apiClient.getTopTransactions(
      request: ApiKeyModel(
        apiKey: apiKey,
      ),
    );
  }

  Future<List<Dump>> getDumps(String apiKey) async {
    return await apiClient.getDumps(
      request: DumpResponce(
        apiKey: apiKey,
      ),
    );
  }

  void stopTransaction(String apiKey, String pid) async {
    await apiClient.execCommand(
      request: Command(
        command: 'connection',
        apiKey: apiKey,
        parameter: pid,
      ),
    );
  }
}
