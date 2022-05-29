import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:splitq/domain/models/index.dart';
import 'package:splitq/domain/models/response.model.dart';
import 'package:splitq/network/client.dart';

class AuthApi {
  final client = Get.find<AppNetworkClient>();

  Future<User> login(String email, String password) {
    Map<String, dynamic> body = {};
    body.putIfAbsent('username', () => email);
    body.putIfAbsent('password', () => password);

    return client
        .post('/login', body: body)
        .then((value) => User.fromJson(value as Map<String, dynamic>));
  }
}
