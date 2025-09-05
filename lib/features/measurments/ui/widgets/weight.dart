import 'package:challenge_diabetes/core/helpers/spacing.dart';
import 'package:challenge_diabetes/features/measurments/model/data/add_measurments_models/weight_request_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeightForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;

  const WeightForm({super.key, required this.formKey});

  @override
  State<WeightForm> createState() => WeightFormState();
}

class WeightFormState extends State<WeightForm>
    with AutomaticKeepAliveClientMixin {
  final TextEditingController _weightController = TextEditingController();
  String _selectedActivity = 'مشي';

  @override
  bool get wantKeepAlive => true;
  final List<Map<String, dynamic>> _activities = [
    {
      'title': 'مشي',
      'description': 'المشي العادي أو السريع',
      'icon': Icons.directions_walk,
      'color': const Color(0xFF10B981),
      'calories': '3-5 سعرات/دقيقة',
    },
    {
      'title': 'جري',
      'description': 'الجري أو الهرولة',
      'icon': Icons.directions_run,
      'color': const Color(0xFFEF4444),
      'calories': '8-12 سعرات/دقيقة',
    },
    {
      'title': 'سباحة',
      'description': 'السباحة أو التمارين المائية',
      'icon': Icons.pool,
      'color': const Color(0xFF3B82F6),
      'calories': '6-10 سعرات/دقيقة',
    },
    {
      'title': 'ركوب الدراجة',
      'description': 'ركوب الدراجة الهوائية',
      'icon': Icons.directions_bike,
      'color': const Color(0xFF8B5CF6),
      'calories': '5-8 سعرات/دقيقة',
    },
    {
      'title': 'تمارين رياضية',
      'description': 'تمارين اللياقة البدنية',
      'icon': Icons.fitness_center,
      'color': const Color(0xFFF59E0B),
      'calories': '4-7 سعرات/دقيقة',
    },
    {
      'title': 'يوجا',
      'description': 'تمارين اليوجا والاسترخاء',
      'icon': Icons.self_improvement,
      'color': const Color(0xFFEC4899),
      'calories': '2-4 سعرات/دقيقة',
    },
  ];

  @override
  void initState() {
    super.initState();
    _weightController.addListener(_updateStatus);
  }

  void _updateStatus() {
    setState(() {});
  }

  WeightRequestBody? read() {
    final w = double.tryParse(_weightController.text.trim());
    if (w == null) return null;
    return WeightRequestBody(
      weight: w.toInt(),
      sport: _selectedActivity.trim() == 'مشي',
    );
  }

  @override
  void dispose() {
    _weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: widget.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Weight Input Card
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
                          color: const Color(0xFFECFDF5),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.monitor_weight,
                          color: Color(0xFF10B981),
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        'قياس الوزن',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1F2937),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Weight Input
                  TextFormField(
                    controller: _weightController,
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    decoration: InputDecoration(
                      labelText: 'الوزن الحالي',
                      hintText: 'أدخل وزنك',
                      suffixText: 'كجم',
                      prefixIcon: const Icon(
                        Icons.straighten,
                        color: Color(0xFF10B981),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey[300]!),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Color(0xFF10B981)),
                      ),
                      filled: true,
                      fillColor: Colors.grey[50],
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'يرجى إدخال الوزن';
                      }
                      final weight = double.tryParse(value);
                      if (weight == null) {
                        return 'يرجى إدخال رقم صحيح';
                      }
                      if (weight < 30 || weight > 300) {
                        return 'الوزن يجب أن يكون بين 30-300 كجم';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 16),

                  // Weight Status
                  if (_weightController.text.isNotEmpty) _buildWeightStatus(),
                ],
              ),
            ),

            verticalSpace(20),

            // Activity Selection Card
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
                          Icons.directions_run,
                          color: Color(0xFF3B82F6),
                          size: 24,
                        ),
                      ),
                      horizontalSpace(12),
                      const Text(
                        'النشاط البدني المفضل',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1F2937),
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(16),

                  // Activity Grid
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 1.1,
                        ),
                    itemCount: _activities.length,
                    itemBuilder: (context, index) {
                      final activity = _activities[index];
                      final isSelected = _selectedActivity == activity['title'];

                      return InkWell(
                        onTap: () {
                          setState(() {
                            _selectedActivity = activity['title'];
                          });
                        },
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? activity['color'].withOpacity(0.1)
                                : Colors.grey[50],
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: isSelected
                                  ? activity['color']
                                  : Colors.grey[300]!,
                              width: isSelected ? 2 : 1,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? activity['color']
                                      : Colors.grey[400],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Icon(
                                  activity['icon'],
                                  color: Colors.white,
                                  size: 19.sp,
                                ),
                              ),
                              verticalSpace(8),
                              Text(
                                activity['title'],
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.bold,
                                  color: isSelected
                                      ? activity['color']
                                      : const Color(0xFF1F2937),
                                ),
                                textAlign: TextAlign.center,
                              ),
                              verticalSpace(4),
                              Text(
                                activity['calories'],
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  color: Colors.grey[600],
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // BMI Information Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    const Color(0xFF10B981).withOpacity(0.1),
                    const Color(0xFF3B82F6).withOpacity(0.1),
                  ],
                ),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: const Color(0xFF10B981).withOpacity(0.3),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.calculate,
                        color: const Color(0xFF10B981),
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'مؤشر كتلة الجسم (BMI)',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF10B981),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '• أقل من 18.5: نقص في الوزن\n'
                    '• 18.5-24.9: وزن طبيعي\n'
                    '• 25-29.9: زيادة في الوزن\n'
                    '• 30 أو أكثر: سمنة',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[700],
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF3B82F6).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: const Color(0xFF3B82F6),
                          size: 16,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'لحساب BMI تحتاج أيضاً لإدخال الطول في الملف الشخصي',
                            style: TextStyle(
                              fontSize: 11,
                              color: const Color(0xFF3B82F6),
                            ),
                          ),
                        ),
                      ],
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

  Widget _buildWeightStatus() {
    final weight = double.tryParse(_weightController.text) ?? 0;

    if (weight <= 0) return const SizedBox.shrink();

    // This is a simplified status - in real app, you'd need height for BMI
    String status = 'تم تسجيل الوزن';
    Color statusColor = const Color(0xFF10B981);
    IconData statusIcon = Icons.check_circle;

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
            status,
            style: TextStyle(
              color: statusColor,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          const Spacer(),
          Text(
            '${weight.toStringAsFixed(1)} كجم',
            style: TextStyle(
              color: statusColor,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
