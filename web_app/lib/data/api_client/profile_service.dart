import 'dart:async';

import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:web_app/domain/entity/api_key_model.dart';
import 'package:web_app/domain/entity/command.dart';
import 'package:web_app/domain/entity/connection.dart';
import 'package:web_app/domain/entity/dump.dart';
import 'package:web_app/domain/entity/dump_response.dart';
import 'package:web_app/domain/entity/long_transaction.dart';
import 'package:web_app/domain/entity/top_transaction.dart';

part 'profile_service.g.dart';

@RestApi()
abstract class ProfileService {
  factory ProfileService(Dio dio, {String baseUrl}) = _ProfileService;

  @POST('/create/')
  Future<ApiKeyModel> createApikey({
    @Body() required Connection request,
  });

  @POST('/exec/')
  Future<Connection> execCommand({
    @Body() required Command request,
  });

  @GET('/list_keys/')
  Future<List<Connection>> getConnections({
    @Query('tg_user_id') required String tgUserId,
  });

  @PATCH('/create/')
  Future<Connection> patchConnection({
    @Body() required Connection request,
  });

  @POST('/long_transactions/')
  Future<List<LongTransaction>> getLongTransactions({
    @Body() required ApiKeyModel request,
  });

  @POST('/top_transactions/')
  Future<List<TopTransaction>> getTopTransactions({
    @Body() required ApiKeyModel request,
  });

  @GET('/dumps/')
  Future<List<Dump>> postDumps({
    @Body() required DumpResponce request,
  });


}
