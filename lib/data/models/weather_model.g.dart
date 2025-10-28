// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherModel _$WeatherModelFromJson(Map<String, dynamic> json) => WeatherModel(
  location: json['name'] as String,
  main: MainData.fromJson(json['main'] as Map<String, dynamic>),
  weather: (json['weather'] as List<dynamic>)
      .map((e) => WeatherData.fromJson(e as Map<String, dynamic>))
      .toList(),
  wind: WindData.fromJson(json['wind'] as Map<String, dynamic>),
  clouds: CloudsData.fromJson(json['clouds'] as Map<String, dynamic>),
  dateTime: (json['dt'] as num).toInt(),
);

Map<String, dynamic> _$WeatherModelToJson(WeatherModel instance) =>
    <String, dynamic>{
      'name': instance.location,
      'main': instance.main,
      'weather': instance.weather,
      'wind': instance.wind,
      'clouds': instance.clouds,
      'dt': instance.dateTime,
    };

MainData _$MainDataFromJson(Map<String, dynamic> json) => MainData(
  temp: (json['temp'] as num).toDouble(),
  feelsLike: (json['feels_like'] as num).toDouble(),
  humidity: (json['humidity'] as num).toInt(),
  pressure: (json['pressure'] as num).toDouble(),
);

Map<String, dynamic> _$MainDataToJson(MainData instance) => <String, dynamic>{
  'temp': instance.temp,
  'feels_like': instance.feelsLike,
  'humidity': instance.humidity,
  'pressure': instance.pressure,
};

WeatherData _$WeatherDataFromJson(Map<String, dynamic> json) => WeatherData(
  main: json['main'] as String,
  description: json['description'] as String,
);

Map<String, dynamic> _$WeatherDataToJson(WeatherData instance) =>
    <String, dynamic>{
      'main': instance.main,
      'description': instance.description,
    };

WindData _$WindDataFromJson(Map<String, dynamic> json) =>
    WindData(speed: (json['speed'] as num).toDouble());

Map<String, dynamic> _$WindDataToJson(WindData instance) => <String, dynamic>{
  'speed': instance.speed,
};

CloudsData _$CloudsDataFromJson(Map<String, dynamic> json) =>
    CloudsData(cloudiness: (json['all'] as num).toInt());

Map<String, dynamic> _$CloudsDataToJson(CloudsData instance) =>
    <String, dynamic>{'all': instance.cloudiness};
