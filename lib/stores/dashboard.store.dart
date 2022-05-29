import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:splitq/api/dashboard.api.dart';
import 'package:splitq/domain/models/index.dart';
import 'package:splitq/utils/logger.dart';

class DashboardStore extends GetxController with StateMixin<DashboardModel> {
  final DashboardApi dashboardApi = Get.find<DashboardApi>();

  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.empty());
  }

  getDashboardData() async {
    try {
      change(null, status: RxStatus.loading());
      final DashboardModel data = await dashboardApi.getDashboardData();
      change(data, status: RxStatus.success());
    } catch (e) {
      Logger.log(e);
      change(null, status: RxStatus.error('Something went wrong'));
    }
  }
}
