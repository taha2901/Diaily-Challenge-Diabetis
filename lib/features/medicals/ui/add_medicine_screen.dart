import 'package:challenge_diabetes/core/helpers/spacing.dart';
import 'package:challenge_diabetes/core/theming/colors.dart';
import 'package:challenge_diabetes/core/widget/custom_app_bar_doctors.dart';
import 'package:challenge_diabetes/features/medicals/logic/medicine_cubit.dart';
import 'package:challenge_diabetes/features/medicals/logic/medicine_state.dart';
import 'package:challenge_diabetes/features/medicals/ui/widgets/save_medicine_button.dart';
import 'package:challenge_diabetes/features/medicals/ui/widgets/section_title.dart';
import 'package:challenge_diabetes/features/medicals/ui/widgets/text_field_of_medicine.dart';
import 'package:challenge_diabetes/gen/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';

class AddMedicineScreen extends StatefulWidget {
  const AddMedicineScreen({super.key});

  @override
  State<AddMedicineScreen> createState() => _AddMedicineScreenState();
}

class _AddMedicineScreenState extends State<AddMedicineScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _doseController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();
  TimeOfDay? _selectedTime;
  String _selectedFrequency = LocaleKeys.daily.tr();

  final List<String> _frequencies = [
    LocaleKeys.daily.tr(),
    LocaleKeys.every_2_days.tr(),
    LocaleKeys.weekly.tr(),
    LocaleKeys.as_needed.tr(),
  ];

  Future<void> _pickTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
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
        content: Text(LocaleKeys.medicine_added.tr()),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(LocaleKeys.error_prefix.tr(args: [message])),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 3),
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBarForDoctors(title: LocaleKeys.add_medicine.tr()),
              Form(
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
                            return LocaleKeys.medicine_name_error.tr();
                          }
                          return null;
                        },
                        maxLines: 1,
                      ),
                      verticalSpace(20),
                      TextFieldOfMedicine(
                        controller: _doseController,
                        label: LocaleKeys.dose.tr(),
                        icon: Icons.scale,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return LocaleKeys.dose_error.tr();
                          }
                          return null;
                        },
                        maxLines: 1,
                      ),
                      verticalSpace(24),
                      SectionTitle(title: LocaleKeys.schedule.tr()),
                      verticalSpace(16),
                      _buildTimeSelector(),
                      verticalSpace(20),
                      _buildFrequencyDropdown(),
                      verticalSpace(24),
                      SectionTitle(title: LocaleKeys.additional_notes.tr()),
                      verticalSpace(16),
                      TextFieldOfMedicine(
                        controller: _notesController,
                        label: LocaleKeys.notes_optional.tr(),
                        icon: Icons.notes,
                        maxLines: 3,
                      ),
                      verticalSpace(40),
                      SaveMedicineButton(
                        onSave: () {
                          if (_formKey.currentState!.validate()) {
                            final cubit = context.read<MedicineCubit>();

                            cubit.clearControllers();
                            cubit.nameController.text =
                                _nameController.text.trim();
                            cubit.dosageController.text =
                                _doseController.text.trim();
                            cubit.countController.text = _selectedFrequency;
                            cubit.timeController.text =
                                _selectedTime?.format(context) ??
                                    "8:00 AM";

                            cubit.emitAddMedicine();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
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
                      : LocaleKeys.time.tr(args: [
                          _selectedTime!.format(context),
                        ]),
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
        items: _frequencies.map((frequency) {
          return DropdownMenuItem(value: frequency, child: Text(frequency));
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
