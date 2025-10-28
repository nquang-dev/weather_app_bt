import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.blue)),
        const SizedBox(height: 16),
        Text('Đang tải dữ liệu thời tiết...', style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey[600])),
      ],
    );
  }
}
