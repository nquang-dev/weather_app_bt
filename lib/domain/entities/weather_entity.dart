class WeatherEntity {
  final String location;
  final double temperature;
  final double feelsLike;
  final int humidity;
  final double pressure;
  final String description;
  final String weatherMain;
  final double windSpeed;
  final int cloudiness;
  final DateTime dateTime;

  WeatherEntity({
    required this.location,
    required this.temperature,
    required this.feelsLike,
    required this.humidity,
    required this.pressure,
    required this.description,
    required this.weatherMain,
    required this.windSpeed,
    required this.cloudiness,
    required this.dateTime,
  });
}
