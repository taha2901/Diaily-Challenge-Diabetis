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
  bool _isLoading = false;

  final List<String> _frequencies = [
    'Daily',
    'Every 2 days',
    'Weekly',
    'As needed',
  ];

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.medicine.name ?? '';
    _doseController.text = widget.medicine.dosage ?? '';
    _notesController.text = ''; // لو مفيش notes في الـ model
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
        content: Text('Medicine updated successfully!'),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Error: $message'),
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
            initial: () => setState(() => _isLoading = false),
            loading: () => setState(() => _isLoading = false),
            success: (_) => setState(() => _isLoading = false),
            error: (_) => setState(() => _isLoading = false),
            addMedicineLoading: () => setState(() => _isLoading = true),
            addMedicineSuccess: () {
              setState(() => _isLoading = false);
              _showSuccessMessage();
              Navigator.pop(context, true); // العودة مع إشارة النجاح
            },
            addMedicineError: (error) {
              setState(() => _isLoading = false);
              _showErrorMessage(error.title ?? 'Unknown error');
            },
            deleteMedicineLoading: () => setState(() => _isLoading = true),
            deleteMedicineSuccess: () => setState(() => _isLoading = false),
            deleteMedicineError: (error) {
              setState(() => _isLoading = false);
              _showErrorMessage(error.title ?? 'Delete error');
            },
          );
        },
        child: Column(
          children: [
            CustomAppBarForDoctors(title: 'Edit Medicine'),
            Expanded(
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SectionTitle(title: "Medicine Details"),
                      verticalSpace(16),
                      TextFieldOfMedicine(
                        controller: _nameController,
                        label: "Medicine Name",
                        icon: Icons.medical_services,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter medicine name';
                          }
                          return null;
                        },
                        maxLines: 1,
                      ),
                      verticalSpace(20),
                      TextFieldOfMedicine(
                        controller: _doseController,
                        label: "Dose (e.g., 1 pill, 5ml)",
                        icon: Icons.scale,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter dose';
                          }
                          return null;
                        },
                        maxLines: 1,
                      ),
                      const SizedBox(height: 24),
                      SectionTitle(title: "Schedule"),
                      const SizedBox(height: 16),
                      _buildTimeSelector(),
                      const SizedBox(height: 20),
                      _buildFrequencyDropdown(),
                      const SizedBox(height: 24),
                      SectionTitle(title: "Additional Notes"),
                      const SizedBox(height: 16),
                      TextFieldOfMedicine(
                        controller: _notesController,
                        label: "Notes (optional)",
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
                              isLoading: _isLoading,
                              onUpdate: () {
                                if (_formKey.currentState!.validate() && !_isLoading) {
                                  final cubit = context.read<MedicineCubit>();

                                  final updateData = AddMedicineRequestBody(
                                    name: _nameController.text.trim(),
                                    dosage: _doseController.text.trim(),
                                    time: _selectedTime?.format(context) ?? "8:00 AM",
                                    times: _selectedFrequency,
                                  );

                                  // استخدام الدالة الجديدة للتعديل
                                  cubit.updateMedicine(widget.medicine.id!, updateData);
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
                      ? "Select Time"
                      : "Time: ${_selectedTime!.format(context)}",
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
          labelText: "Frequency",
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