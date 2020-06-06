import 'package:flutter/material.dart';
import 'package:weather_app/Widgets/customtextfield.dart';
import 'package:weather_app/blocs/weatherBloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/blocs/weatherEvents.dart';
import 'package:weather_app/blocs/weatherState.dart';
import 'package:weather_app/Widgets/bgimage.dart';
class MyHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

        return Scaffold(
          body: BlocBuilder<WeatherBloc, WeatherState>(
            builder:(context,state){

               if (state is WeatherLoading){
                return Stack(
                  children: <Widget>[
                    CustomImage("bg.jpg"),
                    Center(
                      child:Center(child: CircularProgressIndicator(),),
                    ),
                  ],
                );
              }
              else if (state is WeatherLoaded){
                return Stack(
                  children: <Widget>[
                    CustomImage("${state.weather.formattedCondition}.png"),
                    Center(
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Center(
                                child: Text(
                                  state.weather.temp.toString()+ ' °C',
                                  style: TextStyle(color: Colors.white, fontSize: 60.0),
                                ),
                              ),
                              Center(
                                child: Text(
                                  state.weather.location,
                                  style: TextStyle(color: Colors.white, fontSize: 40.0),
                                ),
                              ),
                            ],
                          ),
                          CustomTextField(Colors.white,(val){search(val,context);})
                        ],
                      ),
                    ),
                  ],
                );
              }
              else if (state is WeatherError){
                return Stack(
                  children: <Widget>[
                    CustomImage("bg.jpg"),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(
                            child:Text('Error , please try again later'),

                          ),Container(height:50 ,),
              CustomTextField(Colors.white,(val){search(val,context);}
              )],
                      ),
                    ),
                  ],
                );
              }else{
                 return Stack(
                   children: <Widget>[
                     CustomImage("bg.jpg"),
                     Center(
                       child: Container(
                           width: 300,
                           child: CustomTextField(Colors.black54,(val){search(val,context);})
                       ),
                     ),
                   ],
                 );
               }
             }
          ),
        );

  }
  void search(String cityname,BuildContext context){
    BlocProvider.of<WeatherBloc>(context)
        .add(FetchWeather(city: cityname));
  }
}


