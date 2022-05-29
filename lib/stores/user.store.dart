import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:splitq/api/index.dart';
import 'package:splitq/domain/models/index.dart';
import 'package:splitq/network/client.dart';
import 'package:splitq/utils/index.dart';

class UserStore extends GetxController with StateMixin<User> {
  final AuthApi _authApi = Get.find<AuthApi>();
  final AppSharedPreferences _preferences = Get.find<AppSharedPreferences>();
  final AppNetworkClient _client = Get.find<AppNetworkClient>();

  @override
  void onInit() {
    super.onInit();
    _checkLogin();
  }

  _checkLogin() async {
    final String? accessToken = await _preferences.getAccessToken();
    final String? refreshToken = await _preferences.getRefreshToken();

    if (accessToken != null &&
        accessToken.trim().isNotEmpty &&
        refreshToken != null &&
        refreshToken.trim().isNotEmpty) {
      change(User(accessToken: accessToken, refreshToken: refreshToken),
          status: RxStatus.success());
      Get.offAndToNamed('/dashboard');
    } else {
      change(null, status: RxStatus.empty());
      Get.offAndToNamed('/login');
    }
  }

  login(String email, String password) async {
    try {
      change(null, status: RxStatus.loading());

      final User user = await _authApi.login(email, password);
      if (user.accessToken != null && user.refreshToken != null) {
        _preferences.setAccessToken(user.accessToken!);
        _preferences.setRefreshToken(user.refreshToken!);
      }

      change(user, status: RxStatus.success());
      Get.offAndToNamed('/dashboard');
    } catch (e) {
      Logger.log(e);
      if (e is DioError &&
          e.response != null &&
          e.response?.statusCode == 400) {
        change(null, status: RxStatus.error('Invalid credentials'));
        Get.snackbar('Login unsuccessful', 'Invalid credentials');
        return;
      }
      change(null, status: RxStatus.error('Something went wrong'));
      Get.snackbar('Login unsuccessful', 'Unexpected error occured');
    }
  }

  void logout() async {
    try {
      _preferences.clear();
      _client.cancelAllRequests();
    } catch (e) {
      Logger.log(e);
    } finally {
      change(null, status: RxStatus.empty());
      Get.offAndToNamed('/login');
    }
  }
}
