import 'package:challenge_diabetes/core/theming/colors.dart';
import 'package:challenge_diabetes/features/measurments/logic/pressure/pressure_cubit.dart';
import 'package:challenge_diabetes/features/measurments/logic/pressure/pressure_state.dart';
import 'package:challenge_diabetes/features/measurments/logic/suger/suger_cubit.dart';
import 'package:challenge_diabetes/features/measurments/logic/suger/suger_state.dart';
import 'package:challenge_diabetes/features/measurments/logic/weight/weight_cubit.dart';
import 'package:challenge_diabetes/features/measurments/logic/weight/weight_state.dart';
import 'package:challenge_diabetes/features/measurments/ui/widgets/blood_pressure.dart';
import 'package:challenge_diabetes/features/measurments/ui/widgets/blood_suger.dart';
import 'package:challenge_diabetes/features/measurments/ui/widgets/header_with_desc.dart';
import 'package:challenge_diabetes/features/measurments/ui/widgets/weight.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddingMeasurementsScreen extends StatefulWidget {
  final VoidCallback? onMeasurementAdded;
  const AddingMeasurementsScreen({super.key, this.onMeasurementAdded});

  @override
  State<AddingMeasurementsScreen> createState() =>
      _AddingMeasurementsScreenState();
}

class _AddingMeasurementsScreenState extends State<AddingMeasurementsScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  final sugarFormKey = GlobalKey<FormState>();
  final pressureFormKey = GlobalKey<FormState>();
  final weightFormKey = GlobalKey<FormState>();

  final sugarWidgetKey = GlobalKey<BloodSugarFormState>();
  final pressureWidgetKey = GlobalKey<BloodPressureFormState>();
  final weightWidgetKey = GlobalKey<WeightFormState>();

  final sugarKey = TextEditingController();
  final pressureKey = TextEditingController();
  final weightKey = TextEditingController();

  DateTime _selectedDateTime = DateTime.now();
  bool _isDisposed = false;

  // Overlay loader flag
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _isDisposed = true;
    _tabController.dispose();
    super.dispose();
  }

  void _safeSetState(VoidCallback callback) {
    if (!_isDisposed && mounted) {
      setState(callback);
    }
  }

  Future<void> _pickDateTime() async {
    // Prevent interaction during saving
    if (_isSaving) return;

    final date = await showDatePicker(
      context: context,
      initialDate: _selectedDateTime,
      firstDate: DateTime(2020),
      lastDate: DateTime.now().add(const Duration(days: 1)),
      locale: const Locale('ar'),
    );
    if (date == null || _isDisposed) return;

    if (!mounted) return;

    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_selectedDateTime),
      builder: (ctx, child) => Directionality(
        textDirection: TextDirection.rtl,
        child: child ?? const SizedBox.shrink(),
      ),
    );
    if (time == null || _isDisposed) return;

    _safeSetState(() {
      _selectedDateTime = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      );
    });
  }

  void _handleSuccessfulSave() {
    if (widget.onMeasurementAdded != null) {
      widget.onMeasurementAdded!();
    }

    Future.delayed(const Duration(seconds: 1), () {
      if (mounted && !_isDisposed) {
        Navigator.of(context).pop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        // Sugar listeners
        BlocListener<MeasurmentsCubit, MeasurmentsState>(
          listenWhen: (p, c) =>
              c.maybeWhen(
                addBloodSugerLoading: () => true,
                addBloodSugerSuccess: () => true,
                addBloodSugerError: (_) => true,
                orElse: () => false,
              ) ||
              p != c,
          listener: (context, state) {
            state.maybeWhen(
              addBloodSugerLoading: () => _toggleSaving(true),
              addBloodSugerSuccess: () {
                _toggleSaving(false);
                _showSnack('تم حفظ قياس السكر بنجاح', success: true);
                _handleSuccessfulSave();
              },
              addBloodSugerError: (err) {
                _toggleSaving(false);
                _showSnack(err ?? 'فشل حفظ قياس السكر', success: false);
              },
              orElse: () {},
            );
          },
        ),
        // Pressure listeners
        BlocListener<PressureCubit, PressureState>(
          listenWhen: (p, c) =>
              c.maybeWhen(
                addBloodPressureLoading: () => true,
                addBloodPressureSuccess: () => true,
                addBloodPressureError: () => true,
                orElse: () => false,
              ) ||
              p != c,
          listener: (context, state) {
            state.maybeWhen(
              addBloodPressureLoading: () => _toggleSaving(true),
              addBloodPressureSuccess: () {
                _toggleSaving(false);
                _showSnack('تم حفظ قياس الضغط بنجاح', success: true);
                _handleSuccessfulSave();
              },
              addBloodPressureError: () {
                _toggleSaving(false);
                _showSnack('فشل حفظ قياس الضغط', success: false);
              },
              orElse: () {},
            );
          },
        ),
        // Weight listeners
        BlocListener<WeightCubit, WeightState>(
          listenWhen: (p, c) =>
              c.maybeWhen(
                addWeightLoading: () => true,
                addWeightSuccess: () => true,
                addWeightError: () => true,
                orElse: () => false,
              ) ||
              p != c,
          listener: (context, state) {
            state.maybeWhen(
              addWeightLoading: () => _toggleSaving(true),
              addWeightSuccess: () {
                _toggleSaving(false);
                _showSnack('تم حفظ الوزن بنجاح', success: true);
                _handleSuccessfulSave();
              },
              addWeightError: () {
                _toggleSaving(false);
                _showSnack('فشل حفظ الوزن', success: false);
              },
              orElse: () {},
            );
          },
        ),
      ],
      child: Stack(
        children: [
          Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: ColorsManager.mainBackGround,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Colors.grey[800]),
                onPressed: () => Navigator.pop(context),
              ),
              title: Text(
                'إضافة قياس',
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: true,
            ),
            // الحل الجذري: تغليف كل body في SingleChildScrollView
            body: SingleChildScrollView(
              child: Column(
                children: [
                  HeaderWithDescription(),
                  // Date/Time picker row
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: InkWell(
                      onTap: _pickDateTime,
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
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
                          border: Border.all(color: Colors.grey[200]!),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.schedule, color: Color(0xFF3B82F6)),
                            const SizedBox(width: 8),
                            Text(
                              'وقت القياس: '
                              '${_selectedDateTime.year}/${_selectedDateTime.month.toString().padLeft(2, '0')}/${_selectedDateTime.day.toString().padLeft(2, '0')} '
                              '${_selectedDateTime.hour.toString().padLeft(2, '0')}:${_selectedDateTime.minute.toString().padLeft(2, '0')}',
                              style: const TextStyle(fontWeight: FontWeight.w600),
                            ),
                            const Spacer(),
                            const Icon(Icons.edit, size: 18, color: Colors.grey),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Tabs
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
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
                    child: TabBar(
                      controller: _tabController,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: ColorsManager.mainBlue,
                      ),
                      indicatorSize: TabBarIndicatorSize.tab,
                      dividerColor: Colors.transparent,
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.grey[600],
                      labelStyle: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                      tabs: [
                        Tab(
                          icon: Icon(Icons.bloodtype, size: 20.sp),
                          text: 'السكر',
                        ),
                        Tab(
                          icon: Icon(Icons.favorite, size: 20.sp),
                          text: 'الضغط',
                        ),
                        Tab(
                          icon: Icon(Icons.monitor_weight, size: 20.sp),
                          text: 'الوزن',
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Tab Content - استخدام Container بارتفاع محدد بدل Expanded
                  Container(
                    height: MediaQuery.of(context).size.height * 0.6,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        BloodSugarForm(
                          key: sugarWidgetKey,
                          formKey: sugarFormKey,
                        ),
                        BloodPressureForm(
                          key: pressureWidgetKey,
                          formKey: pressureFormKey,
                        ),
                        WeightForm(
                          key: weightWidgetKey,
                          formKey: weightFormKey,
                        ),
                      ],
                    ),
                  ),

                  // Save Button
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: _isSaving ? null : _saveMeasurement,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF3B82F6),
                          foregroundColor: Colors.white,
                          elevation: 2,
                          shadowColor: const Color(0xFF3B82F6).withOpacity(0.3),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          disabledBackgroundColor: Colors.grey[400],
                        ),
                        child: _isSaving
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              )
                            : const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.save, size: 20),
                                  SizedBox(width: 8),
                                  Text(
                                    'حفظ القياس',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                      ),
                    ),
                  ),
                  
                  // مساحة إضافية للـ keyboard
                  SizedBox(height: MediaQuery.of(context).viewInsets.bottom + 50),
                ],
              ),
            ),
          ),

          if (_isSaving)
            Positioned.fill(
              child: Container(
                color: Colors.black.withOpacity(0.15),
                child: const Center(
                  child: CircularProgressIndicator(color: Color(0xFF3B82F6)),
                ),
              ),
            ),
        ],
      ),
    );
  }

  void _toggleSaving(bool v) {
    if (mounted && !_isDisposed) {
      setState(() => _isSaving = v);
    }
  }

  void _showSnack(String msg, {required bool success}) {
    if (!mounted || _isDisposed) return;
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: success
            ? const Color(0xFF10B981)
            : const Color(0xFFEF4444),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _saveMeasurement() {
    if (_isSaving) return;
    
    FocusScope.of(context).unfocus();

    switch (_tabController.index) {
      case 0: // Sugar
        if (sugarFormKey.currentState?.validate() ?? false) {
          final sugarData = sugarWidgetKey.currentState?.read();
          if (sugarData == null) return;
          context.read<MeasurmentsCubit>().emitAddBloodSugar(
            sugarData.measurementDate,
            sugarData.sugarReading,
            _selectedDateTime,
          );
        } else {
          _showSnack('يرجى ملء جميع الحقول المطلوبة', success: false);
        }
        break;

      case 1: // Pressure
        if (pressureFormKey.currentState?.validate() ?? false) {
          final pressureData = pressureWidgetKey.currentState?.read();
          if (pressureData == null) return;
          context.read<PressureCubit>().emitAddBloodPressure(
            systolic: pressureData.systolicPressure,
            diastolic: pressureData.diastolicPressure,
            heartRate: pressureData.heartRate,
            selectedDate: _selectedDateTime,
          );
        } else {
          _showSnack('يرجى ملء جميع الحقول المطلوبة', success: false);
        }
        break;

      case 2: // Weight
        if (weightFormKey.currentState?.validate() ?? false) {
          final weightData = weightWidgetKey.currentState?.read();
          if (weightData == null) return;
          context.read<WeightCubit>().emitAddWeight(
            weightData.weight.round(),
            weightData.sport.toString(),
            _selectedDateTime,
          );
        } else {
          _showSnack('يرجى ملء جميع الحقول المطلوبة', success: false);
        }
        break;
    }
  }
}