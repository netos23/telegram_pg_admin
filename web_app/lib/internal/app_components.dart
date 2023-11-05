import 'package:dio/dio.dart';
import 'package:flutter_telegram_web_app/flutter_telegram_web_app.dart' as tg;
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:web_app/data/api_client/api_client.dart';
import 'package:web_app/data/api_client/dashboard_api_client.dart';
import 'package:web_app/data/api_client/profile_service.dart';
import 'package:web_app/domain/api_manager.dart';
import 'package:web_app/domain/telegram_token_interceptor.dart';
import 'package:web_app/presentation/router/app_router.dart';

const timeout = Duration(seconds: 30);

class AppComponents {
  static final AppComponents _instance = AppComponents._internal();

  factory AppComponents() => _instance;

  AppComponents._internal();

  final tg.TelegramBackButton backButton = tg.BackButton;
  final Dio dio = Dio();

  AppRouter appRouter = AppRouter();

  late final ApiClient apiClient =
      ApiClient(profileService: ProfileService(dio));
  late final dashboardApiClient = DashBoardApiClient(dio);
  late final ApiManager apiManager = ApiManager(apiClient: apiClient);

  Future<void> init() async {
    dio.options
      ..baseUrl = 'https://pg-admin-app.fbtw.ru/'
      ..connectTimeout = timeout
      ..receiveTimeout = timeout
      ..sendTimeout = timeout;
    dio.interceptors.add(PrettyDioLogger());
    dio.interceptors.add(
      TelegramTokenInterceptor(),
    );
  }
}
