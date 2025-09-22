import 'package:challenge_diabetes/core/helpers/spacing.dart';
import 'package:challenge_diabetes/core/theming/colors.dart';
import 'package:challenge_diabetes/core/widget/custom_app_bar_doctors.dart';
import 'package:challenge_diabetes/features/medicals/logic/medicine_cubit.dart';
import 'package:challenge_diabetes/features/medicals/logic/medicine_state.dart';
import 'package:challenge_diabetes/features/medicals/model/data/add_medicine_request_body.dart';
import 'package:challenge_diabetes/features/medicals/model/data/medicine_response_body.dart';
import 'package:challenge_diabetes/features/medicals/ui/widgets/cancel_button.dart';
import 'package:challenge_diabetes/features/medicals/ui/widgets/section_title.dart';
import 'package:challenge_diabetes/features/medicals/ui/widgets/text_field_of_medicine.dart';
import 'package:challenge_diabetes/features/medicals/ui/widgets/update_button.dart';
import 'package:challenge_diabetes/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditMedicineScreen extends StatefulWidget {
  final MedicineResponseBody medicine;
  const EditMedicineScreen({super.key, required this.medicine});

  @override
  State<EditMedicineScreen> createState() => _EditMedicineScreenState();
}

class _EditMedicineScreenState extends State<EditMedicineScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _doseController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();
  TimeOfDay? _selectedTime;
  String _selectedFrequency = 'Daily';
  final Map<String, String> _frequencyOptions = {
    "Daily": LocaleKeys.daily.tr(),
    "Every 2 days": LocaleKeys.every_2_days.tr(),
    "Weekly": LocaleKeys.weekly.tr(),
    "As needed": LocaleKeys.as_needed.tr(),
  };

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.medicine.name ?? '';
    _doseController.text = widget.medicine.dosage ?? '';
    _notesController.text = '';
    _selectedTime = _parseTime(widget.medicine.times ?? '8:00');
    _selectedFrequency = widget.medicine.times ?? 'Daily';
  }

  TimeOfDay? _parseTime(String? timeString) {
    if (timeString == null) return null;
    try {
      final parts = timeString.split(":");
      return TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
    } catch (_) {
      return null;
    }
  }

  Future<void> _pickTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(primary: Colors.blue[600]!),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  void _showSuccessMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(LocaleKeys.medicine_updated.tr()),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(LocaleKeys.medicine_error.tr(args: [message])),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.mainBackGround,
      body: BlocListener<MedicineCubit, MedicineState>(
        listener: (context, state) {
          state.when(
            addMedicineLoading: () {},
            error: (apiErrorModel) {
              _showErrorMessage(apiErrorModel.title.toString());
            },
            initial: () {},
            loading: () {},
            success: (medicines) {},
            addMedicineSuccess: () {
              _showSuccessMessage();
              Navigator.pop(context, true);
            },
            addMedicineError: (error) {},
            deleteMedicineLoading: () {},
            deleteMedicineSuccess: () {},
            deleteMedicineError: (_) {},
          );
        },
        child: Column(
          children: [
            CustomAppBarForDoctors(title: LocaleKeys.edit_medicine.tr()),
            Expanded(
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SectionTitle(title: LocaleKeys.medicine_details.tr()),
                      verticalSpace(16),
                      TextFieldOfMedicine(
                        controller: _nameController,
                        label: LocaleKeys.medicine_name.tr(),
                        icon: Icons.medical_services,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return LocaleKeys.medicine_name_required.tr();
                          }
                          return null;
                        },
                        maxLines: 1,
                      ),
                      verticalSpace(20),
                      TextFieldOfMedicine(
                        controller: _doseController,
                        label: LocaleKeys.dose_label.tr(),
                        icon: Icons.scale,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return LocaleKeys.dose_required.tr();
                          }
                          return null;
                        },
                        maxLines: 1,
                      ),
                      const SizedBox(height: 24),
                      SectionTitle(title: LocaleKeys.schedule.tr()),
                      const SizedBox(height: 16),
                      _buildTimeSelector(),
                      const SizedBox(height: 20),
                      _buildFrequencyDropdown(),
                      const SizedBox(height: 24),
                      SectionTitle(title: LocaleKeys.additional_notes.tr()),
                      const SizedBox(height: 16),
                      TextFieldOfMedicine(
                        controller: _notesController,
                        label: LocaleKeys.notes_optional.tr(),
                        icon: Icons.notes,
                        maxLines: 3,
                      ),
                      const SizedBox(height: 40),
                      Row(
                        children: [
                          Expanded(child: CancelButton()),
                          const SizedBox(width: 16),
                          Expanded(
                            flex: 2,
                            child: UpdateButton(
                              onUpdate: () {
                                if (_formKey.currentState!.validate()) {
                                  final cubit = context.read<MedicineCubit>();

                                  final updateData = AddMedicineRequestBody(
                                    name: _nameController.text.trim(),
                                    dosage: _doseController.text.trim(),
                                    time:
                                        _selectedTime?.format(context) ??
                                        "8:00 AM",
                                    times: _selectedFrequency,
                                  );

                                  // استخدام الدالة الجديدة للتعديل
                                  cubit.updateMedicine(
                                    widget.medicine.id!,
                                    updateData,
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeSelector() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: InkWell(
        onTap: _pickTime,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Icon(Icons.access_time, color: Colors.blue[600], size: 24),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  _selectedTime == null
                      ? LocaleKeys.select_time.tr()
                      : LocaleKeys.time_label.tr(
                          args: [_selectedTime!.format(context)],
                        ),
                  style: TextStyle(
                    fontSize: 16,
                    color: _selectedTime == null
                        ? Colors.grey[500]
                        : Colors.black87,
                    fontWeight: _selectedTime == null
                        ? FontWeight.normal
                        : FontWeight.w500,
                  ),
                ),
              ),
              Icon(Icons.chevron_right, color: Colors.grey[400]),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFrequencyDropdown() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: DropdownButtonFormField<String>(
        value: _selectedFrequency,
        decoration: InputDecoration(
          labelText: LocaleKeys.frequency.tr(),
          prefixIcon: Icon(Icons.repeat, color: Colors.blue[600]),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
        ),
        items: _frequencyOptions.entries.map((entry) {
    return DropdownMenuItem(
      value: entry.key,   // ← القيمة الأصلية (ثابتة)
      child: Text(entry.value), // ← النص المترجم
    );
  }).toList(),
        onChanged: (value) {
          setState(() {
            _selectedFrequency = value!;
          });
        },
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _doseController.dispose();
    _notesController.dispose();
    super.dispose();
  }
}
