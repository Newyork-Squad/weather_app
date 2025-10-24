import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/respository.dart';
import 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherCubit(this.weatherRepository) : super(WeatherInitial());

  Future<void> fetchWeather() async {
    emit(WeatherLoading());
    try {
      final weather = await weatherRepository.getWeatherForCurrentLocation();
      emit(WeatherLoaded(weather));
    } catch (e) {
      emit(WeatherError(e.toString()));
    }
  }
}
