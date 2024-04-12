import 'dart:async';
import 'dart:developer';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather/weather.dart';
import 'package:weatherapp/model/api/api_function.dart';
import 'package:weatherapp/view/home_page.dart';

class Controller extends GetxController {
  Rx<Weather?> weather = Rx<Weather?>(null);
  Position? position;
  Timer? reloadWeather;
  Timer? reloadPosition;
  var dateTime = DateTime.now().obs;
  splashScreenFunction() async {
    log('$dateTime');
    datetimeFunction();
    position = await ApiFunction().getCurrentPosition();
    positionCalling();
    weather.value = await ApiFunction().weatherFeching(position: position!);
    reloadEveryFiveSeconds(position: position!);
    Get.offAll(const HomePage());
  }

  reloadEveryFiveSeconds({required Position position}) async {
    log('recalling the re wether function');
    weather.value = await ApiFunction().weatherFeching(position: position);
    log('${weather.value}');
    reloadWeather = Timer(const Duration(seconds: 10), () {
      reloadEveryFiveSeconds(position: position);
    });
  }

  positionCalling() async {
    reloadPosition = Timer(const Duration(seconds: 20), () async {
      log('Postion canging called');
       position = await ApiFunction().getCurrentPosition();
      positionCalling();
    });
  }

  datetimeFunction() {
    Timer(const Duration(seconds: 60), () {
      dateTime.value = DateTime.now();
      datetimeFunction();
    });
  }
}
