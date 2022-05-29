import 'package:get/instance_manager.dart';
import 'package:splitq/domain/models/index.dart';
import 'package:splitq/network/client.dart';
import 'package:splitq/utils/logger.dart';

class DashboardApi {
  final client = Get.find<AppNetworkClient>();

  Future<DashboardModel> getDashboardData() {
    return client.get('/api/v1/py/dashboard').then((value) {
      return DashboardModel.fromJson(value as Map<String, dynamic>);
    });
  }
}
