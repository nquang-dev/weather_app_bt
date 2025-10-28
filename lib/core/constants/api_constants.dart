class ApiConstants {
  // OpenWeatherMap API Configuration
  static const String openWeatherMapApiKey = '';
  static const String openWeatherMapBaseUrl = 'https://api.openweathermap.org/data/2.5/weather';

  // API Settings
  static const String units = 'metric'; // Use Celsius
  static const Duration apiTimeout = Duration(seconds: 30);
}

class AppConstants {
  static const String appName = 'WeatherNow';
  static const String version = '1.0.0';
}
