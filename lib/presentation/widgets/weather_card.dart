import 'package:flutter/material.dart';
import '../../domain/entities/weather_entity.dart';

class WeatherCard extends StatelessWidget {
  final WeatherEntity weather;

  const WeatherCard({Key? key, required this.weather}) : super(key: key);

  String _getWeatherEmoji(String weatherMain) {
    switch (weatherMain.toLowerCase()) {
      case 'clear':
        return '☀️';
      case 'clouds':
        return '☁️';
      case 'rain':
      case 'drizzle':
        return '🌧️';
      case 'thunderstorm':
        return '⛈️';
      case 'snow':
        return '❄️';
      case 'mist':
      case 'smoke':
      case 'haze':
      case 'dust':
      case 'fog':
      case 'sand':
      case 'ash':
      case 'squall':
      case 'tornado':
        return '🌫️';
      default:
        return '🌤️';
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final emoji = _getWeatherEmoji(weather.weatherMain);

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isDark ? [Colors.blue.shade900, Colors.blue.shade700] : [Colors.blue.shade400, Colors.blue.shade200],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 15, offset: const Offset(0, 8))],
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Location
            Text(
              weather.location,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 16),

            // Weather emoji and temperature
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(emoji, style: const TextStyle(fontSize: 80)),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${weather.temperature.toStringAsFixed(1)}°C',
                      style: const TextStyle(fontSize: 52, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    Text(weather.description, style: TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.9))),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Weather details grid
            Container(
              decoration: BoxDecoration(color: Colors.white.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildDetailRow('Cảm giác như', '${weather.feelsLike.toStringAsFixed(1)}°C'),
                  const SizedBox(height: 12),
                  _buildDetailRow('Độ ẩm', '${weather.humidity}%'),
                  const SizedBox(height: 12),
                  _buildDetailRow('Áp suất', '${weather.pressure.toStringAsFixed(0)} hPa'),
                  const SizedBox(height: 12),
                  _buildDetailRow('Tốc độ gió', '${weather.windSpeed.toStringAsFixed(1)} m/s'),
                  const SizedBox(height: 12),
                  _buildDetailRow('Mây', '${weather.cloudiness}%'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(fontSize: 14, color: Colors.white.withOpacity(0.8))),
        Text(
          value,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ],
    );
  }
}
