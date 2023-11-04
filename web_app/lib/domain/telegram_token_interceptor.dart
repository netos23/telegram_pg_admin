import 'package:dio/dio.dart';


class TelegramTokenInterceptor extends QueuedInterceptor {
  TelegramTokenInterceptor();

  int? _apyKey;

  @override
  void onRequest(options, handler) {
    if (_apyKey != null) {
      options.headers['api_key'] = _apyKey;
    }

    return super.onRequest(options, handler);
  }

  /// Save tokens received after authorization.
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (response.requestOptions.path == '/create') {
      _apyKey = response.data['api_key'];
    }
    super.onResponse(response, handler);
  }

}
