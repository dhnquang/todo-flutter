part of 'weather_bloc.dart';

@immutable
abstract class WeatherState {
  const WeatherState();

  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoad extends WeatherState {}

class WeatherLoadSuccess extends WeatherState {
  final Weather weather;

  const WeatherLoadSuccess({required this.weather});

  @override
  List<Object> get props => [weather];
}

class WeatherLoadFailed extends WeatherState {}