import 'package:flutter/material.dart';

class MedicationItem extends StatelessWidget {
  final String name;
  final String time;
  final String dose;
  final bool taken;
  const MedicationItem({super.key, required this.name, required this.time, required this.dose, required this.taken});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: taken ? const Color(0xFFECFDF5) : const Color(0xFFFEF2F2),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: taken
              ? const Color(0xFF10B981).withOpacity(0.3)
              : const Color(0xFFEF4444).withOpacity(0.3),
        ),
      ),
      child: Row(
        children: [
          Icon(
            taken ? Icons.check_circle : Icons.schedule,
            color: taken ? const Color(0xFF10B981) : const Color(0xFFEF4444),
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1F2937),
                  ),
                ),
                Text(
                  '$time - $dose',
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          if (!taken)
            GestureDetector(
              onTap: () {
                // Mark as taken
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF3B82F6),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Text(
                  'Done',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}