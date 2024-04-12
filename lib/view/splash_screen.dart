import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:weatherapp/controller/getx_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Controller controller=Get.find<Controller>();
    controller.splashScreenFunction();
    return  SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
      body: Center(
        child: Lottie.asset('assets/images/splash.json'),
      ),
    ));
  }
}
