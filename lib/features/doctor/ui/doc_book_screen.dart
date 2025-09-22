import 'package:challenge_diabetes/features/checkout_payment/views/widgets/payment_methods_bottom_sheet.dart';
import 'package:challenge_diabetes/features/doctor/model/data/doctor_response_body.dart';
import 'package:challenge_diabetes/features/doctor/logic/doctors_cubit.dart';
import 'package:challenge_diabetes/features/doctor/ui/widgets/booking/booking_bottom_widget.dart';
import 'package:challenge_diabetes/features/doctor/ui/widgets/booking/booking_tabs_widgets.dart';
import 'package:challenge_diabetes/features/doctor/ui/widgets/booking/doc_header_widget.dart';
import 'package:challenge_diabetes/features/doctor/ui/widgets/booking/modern_user_date_widget.dart';
import 'package:challenge_diabetes/features/doctor/ui/widgets/booking/notes_and_summary_widget.dart';
import 'package:challenge_diabetes/features/doctor/ui/widgets/booking/date_time_selection.dart';
import 'package:challenge_diabetes/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorBookingScreen extends StatefulWidget {
  final DoctorResponseBody doctor;

  const DoctorBookingScreen({super.key, required this.doctor});

  @override
  State<DoctorBookingScreen> createState() => _DoctorBookingScreenState();
}

class _DoctorBookingScreenState extends State<DoctorBookingScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  DateTime selectedDate = DateTime.now();
  String? selectedTimeSlot;

  // Controllers
  final TextEditingController notesController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  String selectedGender = LocaleKeys.male_male.tr();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    notesController.dispose();
    nameController.dispose();
    phoneController.dispose();
    ageController.dispose();
    super.dispose();
  }

  List<DateTime> _getAvailableDates() {
    List<DateTime> dates = [];
    for (int i = 0; i < 30; i++) {
      DateTime date = DateTime.now().add(Duration(days: i));
      if (widget.doctor.workingDays.contains(date.weekday % 7)) {
        dates.add(date);
      }
    }
    return dates;
  }

  List<String> _getAvailableTimeSlots() {
    return widget.doctor.workingHours.isNotEmpty
        ? widget.doctor.workingHours
        : [];
  }

  String _formatDateForAPI(DateTime date) {
    return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }

  // void _handleBooking(BuildContext context) {
  //   if (!_validateBookingData()) return;

  //   final doctorsCubit = context.read<DoctorsCubit>();
  //   doctorsCubit.emitReservationStates(
  //     username: nameController.text.trim(),
  //     phone: phoneController.text.trim(),
  //     age: int.parse(ageController.text.trim()),
  //     sex: selectedGender,
  //     date: _formatDateForAPI(selectedDate),
  //     time: selectedTimeSlot!,
  //     doctorId: widget.doctor.id,
  //     context: context,
  //   );
  // }

void _handleBooking(BuildContext context) {
  if (!_validateBookingData()) return;

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (_) => BlocProvider.value(
      value: context.read<DoctorsCubit>(), // تمرير الCubit للBottomSheet
      child: PaymentMethodsBottomSheet(
        total: widget.doctor.detectionPrice.toDouble(),
        doctorId: widget.doctor.id,
        startTime: selectedTimeSlot!,
        // تمرير بيانات الحجز
        bookingData: {
          'username': nameController.text.trim(),
          'phone': phoneController.text.trim(),
          'age': int.parse(ageController.text.trim()),
          'sex': selectedGender,
          'date': _formatDateForAPI(selectedDate),
          'time': selectedTimeSlot!,
          'doctorId': widget.doctor.id,
        },
        onPaymentSuccess: () {
          // إغلاق الBottomSheet أولاً
          Navigator.of(context).pop();
        },
      ),
    ),
  );
}
  bool _validateBookingData() {
    if (nameController.text.trim().isEmpty) {
      _showErrorSnackBar(LocaleKeys.booking_enter_name.tr());
      _tabController.animateTo(0);
      return false;
    }
    if (phoneController.text.trim().isEmpty) {
      _showErrorSnackBar(LocaleKeys.booking_enter_phone.tr());
      _tabController.animateTo(0);
      return false;
    }
    if (ageController.text.trim().isEmpty) {
      _showErrorSnackBar(LocaleKeys.booking_enter_age.tr());
      _tabController.animateTo(0);
      return false;
    }
    if (selectedTimeSlot == null) {
      _showErrorSnackBar(LocaleKeys.booking_select_time.tr());
      _tabController.animateTo(1);
      return false;
    }
    return true;
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final availableDates = _getAvailableDates();
    final availableTimeSlots = _getAvailableTimeSlots();

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        body: Column(
          children: [
            // Header محسن
            DoctorHeaderWidget(doctor: widget.doctor),

            // Tabs محسنة
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: BookingTabsWidget(tabController: _tabController),
            ),

            // Tab Content
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  UserDataWidget(
                    nameController: nameController,
                    phoneController: phoneController,
                    ageController: ageController,
                    selectedGender: selectedGender,
                    onGenderChanged: (value) =>
                        setState(() => selectedGender = value),
                  ),

                  DateTimeSelectionWidget(
                    availableDates: availableDates,
                    availableTimeSlots: availableTimeSlots,
                    selectedDate: selectedDate,
                    selectedTimeSlot: selectedTimeSlot,
                    onDateSelected: (date) => setState(() {
                      selectedDate = date;
                      selectedTimeSlot = null;
                    }),
                    onTimeSelected: (time) =>
                        setState(() => selectedTimeSlot = time),
                  ),

                  NotesAndSummaryWidget(
                    notesController: notesController,
                    doctor: widget.doctor,
                    nameController: nameController,
                    phoneController: phoneController,
                    ageController: ageController,
                    selectedGender: selectedGender,
                    selectedDate: selectedDate,
                    selectedTimeSlot: selectedTimeSlot,
                  ),
                ],
              ),
            ),

            BookingButtonWidget(onBooking: () => _handleBooking(context)),
          ],
        ),
      ),
    );
  }
}
