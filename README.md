# WeatherNow - Ứng Dụng Thời Tiết Thực Thời

Ứng dụng điện thoại thông minh để xem thông tin thời tiết hiện tại dựa trên vị trí địa lý của người dùng. Giao diện tinh tế, hiện đại và dễ sử dụng.

## Giới Thiệu

WeatherNow là ứng dụng Flutter cho phép bạn:

- Xem thông tin thời tiết thực thời tại vị trí hiện tại
- Nhận được dữ liệu chính xác từ OpenWeatherMap API
- Giao diện đẹp mắt và trực quan
- Hoạt động trên cả Android và iOS

## Công Nghệ Sử Dụng

- **Flutter 3.9.2+** - Framework phát triển ứng dụng di động
- **Riverpod 2.4.0** - Quản lý trạng thái ứng dụng (State Management)
- **Geolocator 10.1.0** - Lấy vị trí địa lý của người dùng
- **HTTP 1.1.0** - Gọi API để lấy dữ liệu thời tiết
- **JSON Serialization** - Phân tích dữ liệu JSON từ API
- **Google Fonts** - Sử dụng font chữ Google Fonts cho giao diện
- **Dartz 0.10.1** - Lập trình hàm trong Dart

## Clean Architecture

Ứng dụng được phát triển theo kiến trúc Clean Architecture:

- **Domain Layer** - Chứa entities, use cases và repository interfaces
- **Data Layer** - Cài đặt repository, datasources và models
- **Presentation Layer** - UI, widgets, screens và Riverpod providers

## Tính Năng Chính

- Tự động phát hiện vị trí người dùng
- Hiển thị nhiệt độ, độ ẩm, áp suất khí quyển, tốc độ gió
- Cập nhật dữ liệu thời tiết với nút refresh
- Xử lý lỗi thân thiện với người dùng
- Hỗ trợ chế độ tối (Dark Mode)
- Giao diện đa ngôn ngữ (Tiếng Việt)

## Cách Sử Dụng

1. Clone repository
2. Chạy `flutter pub get` để cài đặt dependencies
3. Cấu hình API key của OpenWeatherMap trong file `lib/data/datasources/weather_remote_datasource.dart`
4. Chạy `flutter run` để khởi động ứng dụng

## Yêu Cầu Hệ Thống

- Android 5.0 trở lên hoặc iOS 11.0 trở lên
- Flutter SDK 3.9.2 trở lên
- Dart SDK 3.9.2 trở lên
- Quyền truy cập vị trí trên thiết bị
