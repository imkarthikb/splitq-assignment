import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:splitq/api/dashboard.api.dart';
import 'package:splitq/api/index.dart';
import 'package:splitq/network/client.dart';
import 'package:splitq/network/interceptor.dart';
import 'package:splitq/stores/dashboard.store.dart';
import 'package:splitq/stores/index.dart';
import 'package:splitq/utils/index.dart';

class DependencyInjector {
  init() {
    Get.put(AppSharedPreferences(), permanent: true);

    Get.put(Dio(), permanent: true);
    Get.put(NetworkInterceptor(), permanent: true);
    Get.put(AppNetworkClient(), permanent: true);
    Get.put(AuthApi());
    Get.put(DashboardApi());

    Get.put(UserStore(), permanent: true);
    Get.put(DashboardStore(), permanent: true);
  }
}
