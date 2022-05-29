import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';

import 'package:splitq/stores/index.dart';
import 'package:splitq/utils/index.dart';

class NetworkInterceptor extends InterceptorsWrapper {
  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    try {
      final String? token =
          await Get.find<AppSharedPreferences>().getAccessToken();
      if (options.path.contains('login')) {
        handler.next(options);
      } else if (token != null && token.trim().isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $token';
        handler.next(options);
      } else {
        throw (Exception('No authorization token found'));
      }
    } catch (error) {
      Logger.log(error);
      handler.reject(DioError(requestOptions: options));
      Get.find<UserStore>().logout();
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    try {
      if (response.statusCode != 401 || response.statusCode != 413) {
        handler.next(response);
      } else {
        throw (Exception('User Unauthorized'));
      }
    } catch (error) {
      Logger.log(error);
      handler.reject(DioError(
        requestOptions: response.requestOptions,
        response: response,
      ));
      Get.find<UserStore>().logout();
    }
  }
}
