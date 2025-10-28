import 'package:geolocator/geolocator.dart';

abstract class LocationDataSource {
  Future<(double latitude, double longitude)> getCurrentLocation();
}

class LocationDataSourceImpl implements LocationDataSource {
  @override
  Future<(double, double)> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Dịch vụ vị trí chưa được bật');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Quyền truy cập vị trí bị từ chối');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception('Quyền truy cập vị trí bị từ chối vĩnh viễn');
    }

    final Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    return (position.latitude, position.longitude);
  }
}
