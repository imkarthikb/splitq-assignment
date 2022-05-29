import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:splitq/stores/index.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final UserStore userStore = Get.find<UserStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
