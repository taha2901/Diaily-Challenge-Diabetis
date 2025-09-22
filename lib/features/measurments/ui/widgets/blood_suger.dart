import 'package:challenge_diabetes/features/measurments/model/data/add_measurments_models/blood_suger_request_model.dart';
import 'package:challenge_diabetes/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class BloodSugarForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;

  const BloodSugarForm({super.key, required this.formKey});

  @override
  State<BloodSugarForm> createState() => BloodSugarFormState();
}

class BloodSugarFormState extends State<BloodSugarForm>
    with AutomaticKeepAliveClientMixin {
  final TextEditingController _sugarController = TextEditingController();
  String _selectedMealTime = 'قبل الأكل';

  @override
  bool get wantKeepAlive => true;

  final List<String> _mealTimes = [
    LocaleKeys.before_meal.tr(),
    LocaleKeys.after_meal.tr(),
    LocaleKeys.wake_up.tr(),
    LocaleKeys.before_sleep.tr(),
    LocaleKeys.random.tr(),
  ];

  final List<Map<String, dynamic>> _mealTimeDetails = [
    {
      'title': LocaleKeys.before_meal.tr(),
      'description':LocaleKeys.before_meal_desc.tr(),
      'icon': Icons.restaurant,
      'normalRange': '80-130 mg/dL',
    },
    {
      'title':  LocaleKeys.after_meal.tr(),
      'description': LocaleKeys.after_meal_desc.tr(),
      'icon': Icons.access_time,
      'normalRange': 'أقل من 180 mg/dL',
    },
    {
      'title':  LocaleKeys.wake_up.tr(),
      'description': LocaleKeys.wake_up_desc.tr(),
      'icon': Icons.wb_sunny,
      'normalRange': '80-130 mg/dL',
    },
    {
      'title':  LocaleKeys.before_sleep.tr(),
      'description': LocaleKeys.before_sleep_desc.tr(),
      'icon': Icons.bedtime,
      'normalRange': '100-140 mg/dL',
    },
    {
      'title':  LocaleKeys.random.tr(),
      'description': LocaleKeys.random_desc.tr(),
      'icon': Icons.shuffle,
      'normalRange': 'أقل من 200 mg/dL',
    },
  ];

  BloodSugerRequestBody? read() {
    final v = int.tryParse(_sugarController.text.trim());
    if (v == null) return null;
    return BloodSugerRequestBody(
      sugarReading: v,
      measurementDate: _selectedMealTime,
      dateTime: DateTime.now(),
    );
  }

  @override
  void dispose() {
    _sugarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
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
                mainAxisSize: MainAxisSize.min,
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
                       Text(
                        LocaleKeys.sugar_measurement.tr(),
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
                      labelText: LocaleKeys.sugar_level.tr(),
                      hintText:  LocaleKeys.enter_sugar.tr(),
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
                        return  LocaleKeys.sugar_required.tr();
                      }
                      final sugarLevel = int.tryParse(value);
                      if (sugarLevel == null) {
                        return LocaleKeys.sugar_number.tr();
                      }
                      if (sugarLevel < 50 || sugarLevel > 500) {
                        return  LocaleKeys.sugar_range.tr();
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 16),

                  // Sugar Level Status
                  if (_sugarController.text.isNotEmpty) _buildSugarStatus(),
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
                       Text(
                        LocaleKeys.measurement_time.tr(),
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
                                      '${LocaleKeys.normal_range.tr()} ${mealTime['normalRange']}',
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

            // إضافة مساحة إضافية في النهاية
            const SizedBox(height: 100),
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
      if (_selectedMealTime ==  LocaleKeys.before_meal.tr() ||
          _selectedMealTime ==  LocaleKeys.wake_up.tr()) {
        if (sugarLevel < 80) {
          status =  LocaleKeys.low.tr();
          statusColor = const Color(0xFF3B82F6);
          statusIcon = Icons.keyboard_arrow_down;
        } else if (sugarLevel <= 130) {
          status =  LocaleKeys.normal.tr();
          statusColor = const Color(0xFF10B981);
          statusIcon = Icons.check_circle;
        } else {
          status =  LocaleKeys.high.tr();
          statusColor = const Color(0xFFEF4444);
          statusIcon = Icons.keyboard_arrow_up;
        }
      } else if (_selectedMealTime ==  LocaleKeys.after_meal.tr() || _selectedMealTime ==  LocaleKeys.before_sleep.tr()) {
        if (sugarLevel < 140) {
          status =  LocaleKeys.normal.tr();
          statusColor = const Color(0xFF10B981);
          statusIcon = Icons.check_circle;
        } else if (sugarLevel <= 180) {
          status =  LocaleKeys.acceptable.tr();
          statusColor = const Color(0xFFF59E0B);
          statusIcon = Icons.warning;
        } else {
          status =  LocaleKeys.high.tr();
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
            '${LocaleKeys.status.tr()}: $status',
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
