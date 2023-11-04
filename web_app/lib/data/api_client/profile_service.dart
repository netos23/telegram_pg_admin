import 'dart:async';

import 'package:auto_route/annotations.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:web_app/domain/entity/command.dart';
import 'package:web_app/domain/entity/connection.dart';

part 'profile_service.g.dart';

@RestApi()
abstract class ProfileService {
  factory ProfileService(Dio dio, {String baseUrl}) = _ProfileService;

  @POST('/create/')
  Future<Connection> createApikey({
    @Body() required Connection request,
  });

  @POST('/exec/')
  Future<Connection> execCommand({
    @Body() required Command request,
  });

  @GET('/list_keys/')
  Future<List<Connection>> getConnections({
    @QueryParam('tg_user_id') required String tgUserId,
  });
}
