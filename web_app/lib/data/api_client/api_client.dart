import 'package:dio/dio.dart';
import 'package:web_app/data/api_client/profile_service.dart';
import 'package:web_app/domain/entity/command.dart';
import 'package:web_app/domain/entity/connection.dart';
import 'package:flutter_telegram_web_app/flutter_telegram_web_app.dart' as tg;


class ApiClient {
  final ProfileService profileService;

  ApiClient({required this.profileService});


  Future<List<Connection>> getConnections() async {
    // final tgId = tg.isSupported ? tg
    //     .WebAppUser()
    //     .id
    //     .toString() : 'Non telegram user';
    // try {
    //   return await profileService.getConnections(tgUserId: tgId);
    // } on DioException catch (error) {
    //   throw Exception(
    //     error.response?.data['message'],
    //   );
    // }

    // var timestamp = DateTime
    //     .now()
    //     .millisecondsSinceEpoch;
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
      ), Connection(
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
      ), Connection(
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
      ), Connection(
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

  Future<Connection> createApikey({
    required Connection request,
  }) async {
    final tgId = tg.isSupported ? tg
        .WebAppUser()
        .id
        .toString() : 'Non telegram user';
    final newRequest = request.copyWith(tgUserId: tgId);
    try {
      return await profileService.createApikey(request: newRequest);
    } on DioException catch (error) {
      throw Exception(
        error.response?.data['message'],
      );
    }
  }

  Future<Connection> execCommand({
    required Command request,
  }) async {
    try {
      return await profileService.execCommand(request: request);
    } on DioException catch (error) {
      throw Exception(
        error.response?.data['message'],
      );
    }
  }
}
