import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:todoapp/app/bloc/weather_data.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<WeatherEvent>((event, emit) async {
      try {
        emit(WeatherLoad());
        final response = await Dio().get('https://goweather.herokuapp.com/weather/Curitiba');
        emit(WeatherLoadSuccess(weather: Weather.fromJson(jsonDecode(response.toString()))));
      } catch (e) {
        emit(WeatherLoadFailed());
      }
    });
  }
}
