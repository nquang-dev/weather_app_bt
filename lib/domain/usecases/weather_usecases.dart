import 'package:dartz/dartz.dart';
import '../../core/error/failures.dart';
import '../entities/weather_entity.dart';
import '../repositories/weather_repository.dart';

class GetWeatherByCoordinatesUseCase {
  final WeatherRepository repository;

  GetWeatherByCoordinatesUseCase({required this.repository});

  Future<Either<Failure, WeatherEntity>> call({required double latitude, required double longitude}) {
    return repository.getWeatherByCoordinates(latitude: latitude, longitude: longitude);
  }
}

class GetUserLocationUseCase {
  final WeatherRepository repository;

  GetUserLocationUseCase({required this.repository});

  Future<Either<Failure, (double, double)>> call() {
    return repository.getUserLocation();
  }
}
