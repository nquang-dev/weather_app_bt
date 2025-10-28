import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import '../../data/datasources/location_datasource.dart';
import '../../data/datasources/weather_remote_datasource.dart';
import '../../data/repositories/weather_repository_impl.dart';
import '../../domain/repositories/weather_repository.dart';
import '../../domain/usecases/weather_usecases.dart';

// HTTP Client Provider
final httpClientProvider = Provider((ref) => http.Client());

// Data Sources
final weatherRemoteDataSourceProvider = Provider((ref) => WeatherRemoteDataSourceImpl(client: ref.watch(httpClientProvider)));

final locationDataSourceProvider = Provider((ref) => LocationDataSourceImpl());

// Repository
final weatherRepositoryProvider = Provider<WeatherRepository>(
  (ref) => WeatherRepositoryImpl(
    remoteDataSource: ref.watch(weatherRemoteDataSourceProvider),
    locationDataSource: ref.watch(locationDataSourceProvider),
  ),
);

// Use Cases
final getWeatherByCoordinatesUseCaseProvider = Provider(
  (ref) => GetWeatherByCoordinatesUseCase(repository: ref.watch(weatherRepositoryProvider)),
);

final getUserLocationUseCaseProvider = Provider((ref) => GetUserLocationUseCase(repository: ref.watch(weatherRepositoryProvider)));
