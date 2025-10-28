import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../core/constants/api_constants.dart';
import '../models/weather_model.dart';

abstract class WeatherRemoteDataSource {
  Future<WeatherModel> getWeatherByCoordinates({required double latitude, required double longitude});
}

class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  final http.Client client;

  WeatherRemoteDataSourceImpl({required this.client});

  @override
  Future<WeatherModel> getWeatherByCoordinates({required double latitude, required double longitude}) async {
    final String url =
        '${ApiConstants.openWeatherMapBaseUrl}?lat=$latitude&lon=$longitude&appid=${ApiConstants.openWeatherMapApiKey}&units=${ApiConstants.units}';

    final response = await client.get(Uri.parse(url)).timeout(ApiConstants.apiTimeout, onTimeout: () => throw Exception('Request timeout'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      return WeatherModel.fromJson(json);
    } else if (response.statusCode == 401) {
      throw Exception('API Key không hợp lệ. Vui lòng kiểm tra cấu hình.');
    } else {
      throw Exception('Không thể tải dữ liệu thời tiết');
    }
  }
}
