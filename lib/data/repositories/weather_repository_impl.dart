import 'package:dartz/dartz.dart';
import '../../core/error/failures.dart';
import '../../domain/entities/weather_entity.dart';
import '../../domain/repositories/weather_repository.dart';
import '../datasources/location_datasource.dart';
import '../datasources/weather_remote_datasource.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDataSource remoteDataSource;
  final LocationDataSource locationDataSource;

  WeatherRepositoryImpl({required this.remoteDataSource, required this.locationDataSource});

  @override
  Future<Either<Failure, WeatherEntity>> getWeatherByCoordinates({required double latitude, required double longitude}) async {
    try {
      final model = await remoteDataSource.getWeatherByCoordinates(latitude: latitude, longitude: longitude);
      return Right(model.toEntity());
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, (double, double)>> getUserLocation() async {
    try {
      final location = await locationDataSource.getCurrentLocation();
      return Right(location);
    } catch (e) {
      return Left(LocationFailure(message: e.toString()));
    }
  }
}
