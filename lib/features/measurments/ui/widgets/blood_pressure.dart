import 'package:flutter/material.dart';

class BloodPressureForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;

  const BloodPressureForm({
    super.key,
    required this.formKey,
  });

  @override
  State<BloodPressureForm> createState() => _BloodPressureFormState();
}

class _BloodPressureFormState extends State<BloodPressureForm> {
  final TextEditingController _systolicController = TextEditingController();
  final TextEditingController _diastolicController = TextEditingController();
  final TextEditingController _heartRateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Listen to changes to update status
    _systolicController.addListener(_updateStatus);
    _diastolicController.addListener(_updateStatus);
  }

  void _updateStatus() {
    setState(() {});
  }

  @override
  void dispose() {
    _systolicController.dispose();
    _diastolicController.dispose();
    _heartRateController.dispose();
    super.dispose();
  }

  Widget _buildPressureStatus() {
    final systolic = int.tryParse(_systolicController.text) ?? 0;
    final diastolic = int.tryParse(_diastolicController.text) ?? 0;

    String status;
    Color statusColor;

    if (systolic < 120 && diastolic < 80) {
      status = "طبيعي";
      statusColor = Colors.green;
    } else if ((systolic >= 120 && systolic <= 139) ||
        (diastolic >= 80 && diastolic <= 89)) {
      status = "مرحلة ما قبل ارتفاع الضغط";
      statusColor = Colors.orange;
    } else if ((systolic >= 140 && systolic <= 180) ||
        (diastolic >= 90 && diastolic <= 120)) {
      status = "ضغط مرتفع";
      statusColor = Colors.red;
    } else if (systolic > 180 || diastolic > 120) {
      status = "أزمة ارتفاع ضغط الدم (طارئ)";
      statusColor = Colors.purple;
    } else {
      status = "غير محدد";
      statusColor = Colors.grey;
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: statusColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: statusColor.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Icon(Icons.favorite, color: statusColor),
          const SizedBox(width: 8),
          Text(
            "الحالة: $status",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: statusColor,
            ),
          ),
        ],
      ),
    );
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
            // Blood Pressure Card
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
                          color: const Color(0xFFEFF6FF),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.favorite,
                          color: Color(0xFF3B82F6),
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        'قياس ضغط الدم',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1F2937),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Systolic and Diastolic in a Row
                  Row(
                    children: [
                      // Systolic Pressure
                      Expanded(
                        child: TextFormField(
                          controller: _systolicController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'الانقباض',
                            hintText: '120',
                            suffixText: 'mmHg',
                            prefixIcon: const Icon(
                              Icons.arrow_upward,
                              color: Color(0xFFEF4444),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Colors.grey[300]!),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Color(0xFF3B82F6)),
                            ),
                            filled: true,
                            fillColor: Colors.grey[50],
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'مطلوب';
                            }
                            final pressure = int.tryParse(value);
                            if (pressure == null || pressure < 80 || pressure > 250) {
                              return '80-250';
                            }
                            return null;
                          },
                        ),
                      ),

                      const SizedBox(width: 16),

                      // Diastolic Pressure
                      Expanded(
                        child: TextFormField(
                          controller: _diastolicController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'الانبساط',
                            hintText: '80',
                            suffixText: 'mmHg',
                            prefixIcon: const Icon(
                              Icons.arrow_downward,
                              color: Color(0xFF10B981),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Colors.grey[300]!),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Color(0xFF3B82F6)),
                            ),
                            filled: true,
                            fillColor: Colors.grey[50],
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'مطلوب';
                            }
                            final pressure = int.tryParse(value);
                            if (pressure == null || pressure < 40 || pressure > 150) {
                              return '40-150';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Heart Rate
                  TextFormField(
                    controller: _heartRateController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'معدل ضربات القلب',
                      hintText: 'أدخل معدل النبض',
                      suffixText: 'BPM',
                      prefixIcon: const Icon(
                        Icons.monitor_heart_outlined,
                        color: Color(0xFFEC4899),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey[300]!),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Color(0xFF3B82F6)),
                      ),
                      filled: true,
                      fillColor: Colors.grey[50],
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'يرجى إدخال معدل ضربات القلب';
                      }
                      final heartRate = int.tryParse(value);
                      if (heartRate == null) {
                        return 'يرجى إدخال رقم صحيح';
                      }
                      if (heartRate < 40 || heartRate > 200) {
                        return 'معدل النبض يجب أن يكون بين 40-200';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 16),

                  // Blood Pressure Status
                  if (_systolicController.text.isNotEmpty &&
                      _diastolicController.text.isNotEmpty)
                    _buildPressureStatus(),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Information Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF3B82F6).withOpacity(0.05),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: const Color(0xFF3B82F6).withOpacity(0.2),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        color: Color(0xFF3B82F6),
                        size: 20,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'معلومات مهمة',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF3B82F6),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    '• المعدل الطبيعي: أقل من 120/80 mmHg\n'
                    '• مرحلة ما قبل ارتفاع الضغط: 120-139 / 80-89 mmHg\n'
                    '• ضغط مرتفع (درجة أولى): 140-159 / 90-99 mmHg\n'
                    '• ضغط مرتفع (درجة ثانية): 160-180 / 100-120 mmHg\n'
                    '• أزمة ارتفاع ضغط الدم: أكثر من 180 / 120 mmHg (طارئ)',
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xFF1F2937),
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
