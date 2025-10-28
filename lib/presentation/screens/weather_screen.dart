import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/weather_state_provider.dart';
import '../widgets/error_widget.dart' as error_widget;
import '../widgets/loading_widget.dart';
import '../widgets/weather_card.dart';

class WeatherScreen extends ConsumerStatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends ConsumerState<WeatherScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(weatherNotifierProvider.notifier).fetchWeatherByLocation();
    });
  }

  @override
  Widget build(BuildContext context) {
    final weatherState = ref.watch(weatherNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('WeatherNow', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.read(weatherNotifierProvider.notifier).fetchWeatherByLocation();
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: weatherState.isLoading
                ? const LoadingWidget()
                : weatherState.error != null
                ? error_widget.ErrorWidget(
                    message: weatherState.error!,
                    onRetry: () {
                      ref.read(weatherNotifierProvider.notifier).fetchWeatherByLocation();
                    },
                  )
                : weatherState.data != null
                ? WeatherCard(weather: weatherState.data!)
                : Center(child: Text('Không có dữ liệu', style: Theme.of(context).textTheme.bodyLarge)),
          ),
        ),
      ),
    );
  }
}
