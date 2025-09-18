import 'package:challenge_diabetes/core/widget/custom_app_bar_doctors.dart';
import 'package:challenge_diabetes/features/doctor/ui/widgets/booking/booking_bottom_widget.dart';
import 'package:challenge_diabetes/features/doctor/ui/widgets/booking/booking_tabs_widgets.dart';
import 'package:challenge_diabetes/features/doctor/ui/widgets/booking/date_selection_widget.dart';
import 'package:challenge_diabetes/features/doctor/ui/widgets/booking/doc_header_widget.dart';
import 'package:challenge_diabetes/features/doctor/ui/widgets/booking/notes_and_summary_widget.dart';
import 'package:challenge_diabetes/features/doctor/ui/widgets/booking/time_selection_widget.dart';
import 'package:challenge_diabetes/features/doctor/ui/widgets/booking/user_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:challenge_diabetes/features/doctor/logic/doctors_cubit.dart';
import 'package:challenge_diabetes/features/doctor/model/data/doctor_response_body.dart';

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
  final TextEditingController notesController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  String selectedGender = 'ذكر';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
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

  void _handleBooking(BuildContext context) {
    if (!_validateBookingData()) return;

    final doctorsCubit = context.read<DoctorsCubit>();
    doctorsCubit.emitReservationStates(
      username: nameController.text.trim(),
      phone: phoneController.text.trim(),
      age: int.parse(ageController.text.trim()),
      sex: selectedGender,
      date: _formatDateForAPI(selectedDate),
      time: selectedTimeSlot!,
      doctorId: widget.doctor.id,
      context: context,
    );
  }

  bool _validateBookingData() {
    if (nameController.text.trim().isEmpty) {
      _showErrorSnackBar('يرجى إدخال الاسم');
      _tabController.animateTo(0);
      return false;
    }
    if (phoneController.text.trim().isEmpty) {
      _showErrorSnackBar('يرجى إدخال رقم الهاتف');
      _tabController.animateTo(0);
      return false;
    }
    if (ageController.text.trim().isEmpty) {
      _showErrorSnackBar('يرجى إدخال العمر');
      _tabController.animateTo(0);
      return false;
    }
    if (selectedTimeSlot == null) {
      _showErrorSnackBar('يرجى اختيار وقت الموعد');
      _tabController.animateTo(2);
      return false;
    }
    return true;
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }

  @override
  Widget build(BuildContext context) {
    final availableDates = _getAvailableDates();
    final availableTimeSlots = _getAvailableTimeSlots();

    return Scaffold(
      body: Column(
        children: [
          const CustomAppBarForDoctors(title: 'حجز موعد'),
          DoctorHeaderWidget(doctor: widget.doctor),
          Expanded(
            child: Column(
              children: [
                BookingTabsWidget(tabController: _tabController),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      UserDataWidget(
                        nameController: nameController,
                        phoneController: phoneController,
                        ageController: ageController,
                        selectedGender: selectedGender,
                        onGenderChanged: (value) => setState(() => selectedGender = value),
                      ),
                      DateSelectionWidget(
                        availableDates: availableDates,
                        selectedDate: selectedDate,
                        onDateSelected: (date) => setState(() {
                          selectedDate = date;
                          selectedTimeSlot = null;
                        }),
                      ),
                      TimeSelectionWidget(
                        availableTimeSlots: availableTimeSlots,
                        selectedDate: selectedDate,
                        selectedTimeSlot: selectedTimeSlot,
                        onTimeSelected: (time) => setState(() => selectedTimeSlot = time),
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
              ],
            ),
          ),
          BookingButtonWidget(onBooking: () => _handleBooking(context)),
        ],
      ),
    );
  }
}
