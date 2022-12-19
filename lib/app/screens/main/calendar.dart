import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/app/bloc/weather_bloc.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherBloc(),
      child: const Content(),
    );
  }
}

class Content extends StatelessWidget {
  const Content({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Api Test"),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<WeatherBloc>().add(WeatherApiCall());
        },
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if (state is WeatherInitial) {
              return const Center(
                child: Text("Press Button to get Weather Data"),
              );
            } else if (state is WeatherLoad) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is WeatherLoadSuccess) {
              return ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  return _card(
                    state.weather.temperature,
                    state.weather.description,
                    state.weather.wind,
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      color: Colors.black,
                      child: const Text(
                        "Curitiba",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Lato-Regular',
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                },
                itemCount: 5,
              );
            } else {
              return const Center(
                child: Text("Error getting data"),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          context.read<WeatherBloc>().add(WeatherApiCall());
        },
        child: const Icon(Icons.downloading),
      ),
    );
  }

  Card _card(String? temperature, String? description, String? wind) {
    return Card(
      child: ListTile(
        title: Text(temperature ?? "Temperature Here"),
        subtitle: Text(description ?? "Weather Condition Here"),
        leading: description == "Partly cloudy"
            ? const Icon(Icons.cloud)
            : const Icon(Icons.sunny),
        trailing: Text(wind ?? "Wind Speed Here"),
      ),
    );
  }
}
