import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/weather_entity.dart';
import 'weather_providers.dart';

// State for weather data
class WeatherState {
  final WeatherEntity? data;
  final bool isLoading;
  final String? error;

  WeatherState({this.data, this.isLoading = false, this.error});

  WeatherState copyWith({WeatherEntity? data, bool? isLoading, String? error}) {
    return WeatherState(data: data ?? this.data, isLoading: isLoading ?? this.isLoading, error: error ?? this.error);
  }
}

// Weather notifier
class WeatherNotifier extends StateNotifier<WeatherState> {
  final ref;

  WeatherNotifier(this.ref) : super(WeatherState());

  Future<void> fetchWeatherByLocation() async {
    state = state.copyWith(isLoading: true, error: null);

    // Get user location
    final locationResult = await ref.read(getUserLocationUseCaseProvider).call();

    locationResult.fold(
      (failure) {
        state = state.copyWith(isLoading: false, error: failure.message);
      },
      (location) async {
        // Get weather data
        final weatherResult = await ref.read(getWeatherByCoordinatesUseCaseProvider).call(latitude: location.$1, longitude: location.$2);

        weatherResult.fold(
          (failure) {
            state = state.copyWith(isLoading: false, error: failure.message);
          },
          (weather) {
            state = state.copyWith(isLoading: false, data: weather, error: null);
          },
        );
      },
    );
  }

  Future<void> fetchWeatherByCoordinates(double latitude, double longitude) async {
    state = state.copyWith(isLoading: true, error: null);

    final result = await ref.read(getWeatherByCoordinatesUseCaseProvider).call(latitude: latitude, longitude: longitude);

    result.fold(
      (failure) {
        state = state.copyWith(isLoading: false, error: failure.message);
      },
      (weather) {
        state = state.copyWith(isLoading: false, data: weather, error: null);
      },
    );
  }
}

// Weather state provider
final weatherNotifierProvider = StateNotifierProvider<WeatherNotifier, WeatherState>((ref) {
  return WeatherNotifier(ref);
});
