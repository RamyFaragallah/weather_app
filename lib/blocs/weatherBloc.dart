import 'package:weather_app/Models/weatherModel.dart';
import 'package:weather_app/Reposiraries/weatherRepo.dart';
import 'package:bloc/bloc.dart';
import 'package:weather_app/blocs/weatherEvents.dart';
import 'package:weather_app/blocs/weatherState.dart';
import 'package:meta/meta.dart';

class WeatherBloc extends Bloc<WeatherEvent,WeatherState>{
  @override
  WeatherState get initialState => WeatherEmpty();
  final WeatherRepository weatherRepository;

  WeatherBloc({@required this.weatherRepository})
      : assert(weatherRepository != null);

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event)async* {
    if (event is FetchWeather){
      yield WeatherLoading();
      try{
        final Weather weather = await weatherRepository.getWeather(event.city);
        yield WeatherLoaded(weather: weather);
      }catch(_){
        yield WeatherError();
      }
    }
  }
}
