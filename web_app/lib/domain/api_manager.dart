import 'package:rxdart/rxdart.dart';
import 'package:web_app/data/api_client/api_client.dart';
import 'package:web_app/domain/entity/connection.dart';

class ApiManager{
  late final ApiClient apiClient;


  ApiManager({required this.apiClient});

  final BehaviorSubject<List<Connection>> connectionController = BehaviorSubject.seeded([]);

  Future<void> updateConnections() async {
   final result = await apiClient.getConnections();
   connectionController.add(result);
  }

}