import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:web_app/data/api_client/profile_service.dart';

const timeout = Duration(seconds: 30);

class AppComponents {
  static final AppComponents _instance = AppComponents._internal();

  factory AppComponents() => _instance;

  AppComponents._internal();

  final Dio dio = Dio();

  late final ProfileService profileService = ProfileService(dio);

  Future<void> init() async {
    dio.options
      ..baseUrl = 'https://it-profession.fbtw.ru/'
      ..connectTimeout = timeout
      ..receiveTimeout = timeout
      ..sendTimeout = timeout;
    dio.interceptors.add(PrettyDioLogger());
  }
}
