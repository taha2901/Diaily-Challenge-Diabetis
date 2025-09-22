import 'package:challenge_diabetes/features/measurments/model/data/add_measurments_models/blood_pressure_request_model.dart';
import 'package:challenge_diabetes/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class BloodPressureForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;

  const BloodPressureForm({super.key, required this.formKey});

  @override
  State<BloodPressureForm> createState() => BloodPressureFormState();
}

class BloodPressureFormState extends State<BloodPressureForm>
    with AutomaticKeepAliveClientMixin {
  final TextEditingController _systolicController = TextEditingController();
  final TextEditingController _diastolicController = TextEditingController();
  final TextEditingController _heartRateController = TextEditingController();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _systolicController.addListener(_updateStatus);
    _diastolicController.addListener(_updateStatus);
  }

  void _updateStatus() => setState(() {});

  @override
  void dispose() {
    _systolicController.dispose();
    _diastolicController.dispose();
    _heartRateController.dispose();
    super.dispose();
  }

  BloodPressureRequestBody? read() {
    final s = int.tryParse(_systolicController.text.trim());
    final d = int.tryParse(_diastolicController.text.trim());
    final h = int.tryParse(_heartRateController.text.trim());

    if (s == null || d == null || h == null) return null;
    return BloodPressureRequestBody(
      dateTime: DateTime.now(),
      systolicPressure: s,
      diastolicPressure: d,
      heartRate: h,
    );
  }

  Widget _buildPressureStatus() {
    final systolic = int.tryParse(_systolicController.text) ?? 0;
    final diastolic = int.tryParse(_diastolicController.text) ?? 0;

    String status;
    Color statusColor;

    if (systolic < 120 && diastolic < 80) {
      status = LocaleKeys.normal.tr();
      statusColor = Colors.green;
    } else if ((systolic >= 120 && systolic <= 139) ||
        (diastolic >= 80 && diastolic <= 89)) {
      status = LocaleKeys.pre_hypertension.tr();
      statusColor = Colors.orange;
    } else if ((systolic >= 140 && systolic <= 180) ||
        (diastolic >= 90 && diastolic <= 120)) {
      status = LocaleKeys.high_pressure.tr();
      statusColor = Colors.red;
    } else if (systolic > 180 || diastolic > 120) {
      status = LocaleKeys.hypertensive_crisis.tr();
      statusColor = Colors.purple;
    } else {
      status = LocaleKeys.undefined.tr();
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
            "${LocaleKeys.status.tr()}: $status",
            style: TextStyle(fontWeight: FontWeight.bold, color: statusColor),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Form(
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
                    Text(
                      LocaleKeys.blood_pressure_measurement.tr(),
                      style: const TextStyle(
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
                    Expanded(
                      child: TextFormField(
                        controller: _systolicController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: LocaleKeys.systolic.tr(),
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
                            borderSide: const BorderSide(
                              color: Color(0xFF3B82F6),
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.grey[50],
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return LocaleKeys.required.tr();
                          }
                          final pressure = int.tryParse(value);
                          if (pressure == null ||
                              pressure < 80 ||
                              pressure > 250) {
                            return LocaleKeys.systolic_range.tr();
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextFormField(
                        controller: _diastolicController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: LocaleKeys.diastolic.tr(),
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
                            borderSide: const BorderSide(
                              color: Color(0xFF3B82F6),
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.grey[50],
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return LocaleKeys.required.tr();
                          }
                          final pressure = int.tryParse(value);
                          if (pressure == null ||
                              pressure < 40 ||
                              pressure > 150) {
                            return LocaleKeys.diastolic_range.tr();
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
                    labelText: LocaleKeys.heart_rate.tr(),
                    hintText: LocaleKeys.enter_heart_rate.tr(),
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
                      return LocaleKeys.heart_rate_required.tr();
                    }
                    final heartRate = int.tryParse(value);
                    if (heartRate == null) {
                      return LocaleKeys.heart_rate_number.tr();
                    }
                    if (heartRate < 40 || heartRate > 200) {
                      return LocaleKeys.heart_rate_range.tr();
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 16),

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
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.info_outline,
                      color: Color(0xFF3B82F6),
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      LocaleKeys.important_info.tr(),
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF3B82F6),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  LocaleKeys.bp_info.tr(),
                  style: const TextStyle(
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
    );
  }
}
