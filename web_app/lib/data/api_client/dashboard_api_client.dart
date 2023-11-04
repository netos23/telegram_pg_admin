import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:web_app/domain/entity/dashboard.dart';
import 'package:web_app/domain/entity/dashboard_filter.dart';

part 'dashboard_api_client.g.dart';

@RestApi()
abstract class DashBoardApiClient {

  factory DashBoardApiClient(Dio dio, {String baseUrl}) = _DashBoardApiClient;

  @POST('/dashboard/')
  Future<List<Dashboard>> getDashboards(@Body() DashboardFilter filter);
}
