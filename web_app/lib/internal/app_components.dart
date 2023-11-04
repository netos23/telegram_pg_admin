import 'package:dio/dio.dart';
import 'package:flutter_telegram_web_app/flutter_telegram_web_app.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:web_app/data/api_client/profile_service.dart';
import 'package:web_app/domain/telegram_token_interceptor.dart';
import 'package:web_app/presentation/router/app_router.dart';

const timeout = Duration(seconds: 30);

class AppComponents {
  static final AppComponents _instance = AppComponents._internal();

  factory AppComponents() => _instance;

  AppComponents._internal();

  final TelegramBackButton backButton = BackButton;

  final Dio dio = Dio();

  AppRouter appRouter = AppRouter();

  late final ProfileService profileService = ProfileService(dio);

  Future<void> init() async {
    dio.options
      ..baseUrl = 'https://it-profession.fbtw.ru/'
      ..connectTimeout = timeout
      ..receiveTimeout = timeout
      ..sendTimeout = timeout;
    dio.interceptors.add(PrettyDioLogger());
    dio.interceptors.add(
      TelegramTokenInterceptor(),
    );

    backButton.onClick(JsVoidCallback(() {
      appRouter.pop();
    }));
  }
}
