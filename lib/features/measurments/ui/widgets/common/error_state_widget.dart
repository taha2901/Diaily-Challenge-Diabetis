import 'package:challenge_diabetes/gen/locale_keys.g.dart';
import 'package:flutter/material.dart';

class ErrorStateWidget extends StatelessWidget {
  const ErrorStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 48, color: Colors.red),
          SizedBox(height: 16),
          Text(LocaleKeys.pressure_error, style: TextStyle(color: Colors.red)),
        ],
      ),
    );
  }
}