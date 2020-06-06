import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/Models/weatherModel.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();
  @override
  List<Object> get props => [];
}

class WeatherEmpty extends WeatherState {
  @override
  List<Object> get props => null;
}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final Weather weather;  const WeatherLoaded({@required this.weather}) : assert(weather != null);
  @override
  List<Object> get props => [weather];
}

class WeatherError extends WeatherState {}
