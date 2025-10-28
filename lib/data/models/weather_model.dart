import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/weather_entity.dart';

part 'weather_model.g.dart';

@JsonSerializable()
class WeatherModel {
  @JsonKey(name: 'name')
  final String location;

  @JsonKey(name: 'main')
  final MainData main;

  @JsonKey(name: 'weather')
  final List<WeatherData> weather;

  @JsonKey(name: 'wind')
  final WindData wind;

  @JsonKey(name: 'clouds')
  final CloudsData clouds;

  @JsonKey(name: 'dt')
  final int dateTime;

  WeatherModel({
    required this.location,
    required this.main,
    required this.weather,
    required this.wind,
    required this.clouds,
    required this.dateTime,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) => _$WeatherModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);

  WeatherEntity toEntity() {
    return WeatherEntity(
      location: location,
      temperature: main.temp,
      feelsLike: main.feelsLike,
      humidity: main.humidity,
      pressure: main.pressure,
      description: weather.isNotEmpty ? weather.first.description : 'N/A',
      weatherMain: weather.isNotEmpty ? weather.first.main : 'N/A',
      windSpeed: wind.speed,
      cloudiness: clouds.cloudiness,
      dateTime: DateTime.fromMillisecondsSinceEpoch(dateTime * 1000),
    );
  }
}

@JsonSerializable()
class MainData {
  @JsonKey(name: 'temp')
  final double temp;

  @JsonKey(name: 'feels_like')
  final double feelsLike;

  @JsonKey(name: 'humidity')
  final int humidity;

  @JsonKey(name: 'pressure')
  final double pressure;

  MainData({required this.temp, required this.feelsLike, required this.humidity, required this.pressure});

  factory MainData.fromJson(Map<String, dynamic> json) => _$MainDataFromJson(json);

  Map<String, dynamic> toJson() => _$MainDataToJson(this);
}

@JsonSerializable()
class WeatherData {
  @JsonKey(name: 'main')
  final String main;

  @JsonKey(name: 'description')
  final String description;

  WeatherData({required this.main, required this.description});

  factory WeatherData.fromJson(Map<String, dynamic> json) => _$WeatherDataFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherDataToJson(this);
}

@JsonSerializable()
class WindData {
  @JsonKey(name: 'speed')
  final double speed;

  WindData({required this.speed});

  factory WindData.fromJson(Map<String, dynamic> json) => _$WindDataFromJson(json);

  Map<String, dynamic> toJson() => _$WindDataToJson(this);
}

@JsonSerializable()
class CloudsData {
  @JsonKey(name: 'all')
  final int cloudiness;

  CloudsData({required this.cloudiness});

  factory CloudsData.fromJson(Map<String, dynamic> json) => _$CloudsDataFromJson(json);

  Map<String, dynamic> toJson() => _$CloudsDataToJson(this);
}
