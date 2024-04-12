import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp/controller/getx_controller.dart';
import 'package:weatherapp/view/splash_screen.dart';


void main() {
  runApp( MyApp());
}
 class MyApp extends StatelessWidget {
   MyApp({super.key});

  Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home:SplashScreen() ,
    );
  }
}