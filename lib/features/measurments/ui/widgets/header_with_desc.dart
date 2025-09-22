
import 'package:challenge_diabetes/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class HeaderWithDescription extends StatefulWidget {
  const HeaderWithDescription({
    super.key,
  });

  @override
  State<HeaderWithDescription> createState() => _HeaderWithDescriptionState();
}

class _HeaderWithDescriptionState extends State<HeaderWithDescription> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Icon(
            Icons.analytics_outlined,
            size: 48,
            color: const Color(0xFF3B82F6),
          ),
          const SizedBox(height: 12),
          Text(
            LocaleKeys.choose_measurement_type.tr(),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            LocaleKeys.fill_required_data.tr(),
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}