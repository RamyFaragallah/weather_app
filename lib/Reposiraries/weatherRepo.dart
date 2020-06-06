import 'package:weather_app/Models/weatherModel.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/DataProviders/WeatherApiClient.dart';
class WeatherRepository {
  final WeatherApiClient weatherApiClient;

  WeatherRepository({@required this.weatherApiClient})
      : assert(weatherApiClient != null);

  Future<Weather> getWeather(String city) async {
    final int locationId = await weatherApiClient.getLocationId(city);
    return weatherApiClient.fetchWeather(locationId);
  }
}