
import 'package:flutter/material.dart';

class HeaderWithDescription extends StatelessWidget {
  const HeaderWithDescription({
    super.key,
  });

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
            'اختر نوع القياس المطلوب',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'املأ البيانات المطلوبة لحفظ القياس الجديد',
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