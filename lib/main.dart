import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splitq/ui/index.dart';
import 'package:splitq/ui/pages/dashboard/index.dart';
import 'package:splitq/ui/pages/splash/index.dart';
import 'package:splitq/utils/index.dart';

void main() {
  DependencyInjector().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'SplitQ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kColorPrimary,
        fontFamily: 'SFProText',
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => Splash()),
        GetPage(name: '/login', page: () => Login()),
        GetPage(name: '/dashboard', page: () => Dashboard()),
      ],
    );
  }
}
