import 'package:flutter/material.dart';

class BloodSugarForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;

  const BloodSugarForm({
    super.key,
    required this.formKey,
  });

  @override
  State<BloodSugarForm> createState() => _BloodSugarFormState();
}

class _BloodSugarFormState extends State<BloodSugarForm> {
  final TextEditingController _sugarController = TextEditingController();
  String _selectedMealTime = 'قبل الأكل';

  final List<String> _mealTimes = [
    'قبل الأكل',
    'بعد الأكل بساعتين',
    'عند الاستيقاظ',
    'قبل النوم',
    'عشوائي',
  ];

  final List<Map<String, dynamic>> _mealTimeDetails = [
    {
      'title': 'قبل الأكل',
      'description': 'القياس قبل تناول الوجبة',
      'icon': Icons.restaurant,
      'normalRange': '80-130 mg/dL'
    },
    {
      'title': 'بعد الأكل بساعتين',
      'description': 'القياس بعد ساعتين من الوجبة',
      'icon': Icons.access_time,
      'normalRange': 'أقل من 180 mg/dL'
    },
    {
      'title': 'عند الاستيقاظ',
      'description': 'القياس الصباحي على معدة فارغة',
      'icon': Icons.wb_sunny,
      'normalRange': '80-130 mg/dL'
    },
    {
      'title': 'قبل النوم',
      'description': 'القياس قبل النوم',
      'icon': Icons.bedtime,
      'normalRange': '100-140 mg/dL'
    },
    {
      'title': 'عشوائي',
      'description': 'قياس في أي وقت',
      'icon': Icons.shuffle,
      'normalRange': 'أقل من 200 mg/dL'
    },
  ];

  @override
  void dispose() {
    _sugarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: widget.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Blood Sugar Reading Card
            Container(
              width: double.infinity,
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
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFEF2F2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.bloodtype,
                          color: Color(0xFFEF4444),
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        'قياس السكر',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1F2937),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  
                  // Sugar Level Input
                  TextFormField(
                    controller: _sugarController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'مستوى السكر',
                      hintText: 'أدخل القياس',
                      suffixText: 'mg/dL',
                      prefixIcon: const Icon(
                        Icons.straighten,
                        color: Color(0xFFEF4444),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey[300]!),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Color(0xFFEF4444)),
                      ),
                      filled: true,
                      fillColor: Colors.grey[50],
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'يرجى إدخال قياس السكر';
                      }
                      final sugarLevel = int.tryParse(value);
                      if (sugarLevel == null) {
                        return 'يرجى إدخال رقم صحيح';
                      }
                      if (sugarLevel < 50 || sugarLevel > 500) {
                        return 'القياس يجب أن يكون بين 50-500';
                      }
                      return null;
                    },
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Sugar Level Status
                  if (_sugarController.text.isNotEmpty)
                    _buildSugarStatus(),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Meal Time Selection Card
            Container(
              width: double.infinity,
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
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF0F9FF),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.schedule,
                          color: Color(0xFF3B82F6),
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        'توقيت القياس',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1F2937),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  
                  // Meal Time Options
                  ...List.generate(_mealTimeDetails.length, (index) {
                    final mealTime = _mealTimeDetails[index];
                    final isSelected = _selectedMealTime == mealTime['title'];
                    
                    return Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            _selectedMealTime = mealTime['title'];
                          });
                        },
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: isSelected 
                                ? const Color(0xFF3B82F6).withOpacity(0.1)
                                : Colors.grey[50],
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: isSelected 
                                  ? const Color(0xFF3B82F6)
                                  : Colors.grey[300]!,
                              width: isSelected ? 2 : 1,
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: isSelected 
                                      ? const Color(0xFF3B82F6)
                                      : Colors.grey[400],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Icon(
                                  mealTime['icon'],
                                  color: Colors.white,
                                  size: 16,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      mealTime['title'],
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: isSelected 
                                            ? const Color(0xFF3B82F6)
                                            : const Color(0xFF1F2937),
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      mealTime['description'],
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                    Text(
                                      'المعدل الطبيعي: ${mealTime['normalRange']}',
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.grey[500],
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (isSelected)
                                const Icon(
                                  Icons.check_circle,
                                  color: Color(0xFF3B82F6),
                                  size: 20,
                                ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSugarStatus() {
    final sugarLevel = int.tryParse(_sugarController.text) ?? 0;
    String status = '';
    Color statusColor = Colors.grey;
    IconData statusIcon = Icons.help;

    if (sugarLevel > 0) {
      if (_selectedMealTime == 'قبل الأكل' || _selectedMealTime == 'عند الاستيقاظ') {
        if (sugarLevel < 80) {
          status = 'منخفض';
          statusColor = const Color(0xFF3B82F6);
          statusIcon = Icons.keyboard_arrow_down;
        } else if (sugarLevel <= 130) {
          status = 'طبيعي';
          statusColor = const Color(0xFF10B981);
          statusIcon = Icons.check_circle;
        } else {
          status = 'مرتفع';
          statusColor = const Color(0xFFEF4444);
          statusIcon = Icons.keyboard_arrow_up;
        }
      } else if (_selectedMealTime == 'بعد الأكل بساعتين') {
        if (sugarLevel < 140) {
          status = 'طبيعي';
          statusColor = const Color(0xFF10B981);
          statusIcon = Icons.check_circle;
        } else if (sugarLevel <= 180) {
          status = 'مقبول';
          statusColor = const Color(0xFFF59E0B);
          statusIcon = Icons.warning;
        } else {
          status = 'مرتفع';
          statusColor = const Color(0xFFEF4444);
          statusIcon = Icons.keyboard_arrow_up;
        }
      }
    }

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: statusColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: statusColor.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Icon(statusIcon, color: statusColor, size: 20),
          const SizedBox(width: 8),
          Text(
            'الحالة: $status',
            style: TextStyle(
              color: statusColor,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}