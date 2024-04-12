import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';
import 'package:weatherapp/model/api/api_const.dart';

class ApiFunction {
  getCurrentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return false;
    }
    return await Geolocator.getCurrentPosition();
  }

  weatherFeching({required Position position}) async {
    WeatherFactory weatherFactory =
        WeatherFactory(ApiConst().apiKey, language: Language.ENGLISH);
    Weather weather = await weatherFactory.currentWeatherByLocation(
        position.latitude, position.longitude);
    return weather;
  }
}
