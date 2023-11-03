import 'dart:async';

import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:web_app/domain/entity/connection.dart';

part 'profile_service.g.dart';

@RestApi()
abstract class ProfileService {
  factory ProfileService(Dio dio, {String baseUrl}) = _ProfileService;

  @POST('/create/')
  Future<Connection> createApikey({
    @Body() required Connection request,
  });

  @POST('/patch/')
  Future<Connection> patchConnection({
    @Body() required Connection request,
  });
}
