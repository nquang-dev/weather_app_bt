import 'package:dartz/dartz.dart';
import '../../core/error/failures.dart';
import '../entities/weather_entity.dart';

abstract class WeatherRepository {
  Future<Either<Failure, WeatherEntity>> getWeatherByCoordinates({required double latitude, required double longitude});

  Future<Either<Failure, (double, double)>> getUserLocation();
}
