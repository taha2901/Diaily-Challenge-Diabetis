import 'package:flutter/material.dart';

class RecentReadingCard extends StatelessWidget {
  const RecentReadingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Recent Readings',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1F2937),
                ),
              ),
              TextButton(
                onPressed: () {
                  // Navigate to full chart
                },
                child: const Text(
                  'View All',
                  style: TextStyle(color: Color(0xFF3B82F6), fontSize: 14),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            height: 120,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0xFF3B82F6).withOpacity(0.1),
                  const Color(0xFF10B981).withOpacity(0.1),
                ],
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.trending_up, color: Color(0xFF3B82F6), size: 24),
                  SizedBox(width: 8),
                  Text(
                    'Readings Chart',
                    style: TextStyle(color: Color(0xFF6B7280), fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}