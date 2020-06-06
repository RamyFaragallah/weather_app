import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'DataProviders/WeatherApiClient.dart';
import 'Reposiraries/weatherRepo.dart';
import 'Screens/home.dart';
import 'package:http/http.dart'as http;

import 'blocs/weatherBloc.dart';

void main(){

final WeatherRepository weatherRepository = WeatherRepository(
  weatherApiClient: WeatherApiClient(
    httpClient: http.Client(),
  ),
);

runApp(MyApp(weatherRepository: weatherRepository));}

class MyApp extends StatelessWidget {
  final WeatherRepository weatherRepository;
MyApp({Key key, @required this.weatherRepository})
    : assert(weatherRepository != null),
      super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'weather app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:BlocProvider(create: (context)=>WeatherBloc(weatherRepository: weatherRepository),
      child: MyHomePage(),),
    );
  }
}


