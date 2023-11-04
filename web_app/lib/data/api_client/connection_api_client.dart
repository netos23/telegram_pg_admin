import 'package:web_app/domain/entity/connection.dart';

class ConnectionApiClient {

  Future<List<Connection>> getConnections() async {
    var timestamp = DateTime.now().millisecondsSinceEpoch;
    return [
      Connection(
        name: 'PG_1',
        url: 'https://service/pg_1.ru',
      ),
      Connection(
        name: 'PG_2',
        url: 'https://service/pg_2.ru',
      ),
      Connection(
        name: 'PG_3',
        url: 'https://service/pg_2.ru',
      ),Connection(
        name: 'PG_1',
        url: 'https://service/pg_1.ru',
      ),
      Connection(
        name: 'PG_2',
        url: 'https://service/pg_2.ru',
      ),
      Connection(
        name: 'PG_3',
        url: 'https://service/pg_2.ru',
      ),Connection(
        name: 'PG_1',
        url: 'https://service/pg_1.ru',
      ),
      Connection(
        name: 'PG_2',
        url: 'https://service/pg_2.ru',
      ),
      Connection(
        name: 'PG_3',
        url: 'https://service/pg_2.ru',
      ),Connection(
        name: 'PG_1',
        url: 'https://service/pg_1.ru',
      ),
      Connection(
        name: 'PG_2',
        url: 'https://service/pg_2.ru',
      ),
      Connection(
        name: 'PG_3',
        url: 'https://service/pg_2.ru',
      ),
    ];
  }
}
