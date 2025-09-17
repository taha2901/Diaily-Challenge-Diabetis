import 'package:challenge_diabetes/core/widget/custom_app_bar_doctors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:challenge_diabetes/features/doctor/logic/doctors_cubit.dart';
import 'package:challenge_diabetes/features/doctor/logic/doctors_state.dart';
import 'package:challenge_diabetes/features/doctor/model/data/doctor_response_body.dart';
import 'package:challenge_diabetes/core/theming/colors.dart';
import 'package:challenge_diabetes/core/helpers/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

  // User info controllers - you might get these from user session/storage
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  String selectedGender = 'ذكر'; // Default gender

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this); // Changed to 4 tabs
    
    // Initialize user info - you should get this from user session/storage
    _initializeUserData();
  }

  void _initializeUserData() {
    // TODO: Get user data from shared preferences or user session
    // For now, using placeholder data
    nameController.text = "أحمد محمد"; // Get from user session
    phoneController.text = "01234567890"; // Get from user session
    ageController.text = "30"; // Get from user session
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
      // Skip if not a working day
      if (widget.doctor.workingDays.contains(date.weekday % 7)) {
        dates.add(date);
      }
    }
    return dates;
  }

  List<String> _getAvailableTimeSlots() {
    // You can make this dynamic based on doctor's working hours
    if (widget.doctor.workingHours.isNotEmpty) {
      return widget.doctor.workingHours;
    }
    
    // Default time slots
    return [
      '9:00 ص',
      '9:30 ص',
      '10:00 ص',
      '10:30 ص',
      '11:00 ص',
      '11:30 ص',
      '12:00 م',
      '12:30 م',
      '1:00 م',
      '1:30 م',
      '2:00 م',
      '2:30 م',
      '3:00 م',
      '3:30 م',
      '4:00 م',
      '4:30 م',
      '5:00 م',
      '5:30 م',
      '6:00 م',
      '6:30 م',
      '7:00 م',
      '7:30 م',
      '8:00 م',
    ];
  }

  String _getArabicDayName(int weekday) {
    const days = [
      'الأحد',
      'الاثنين',
      'الثلاثاء',
      'الأربعاء',
      'الخميس',
      'الجمعة',
      'السبت',
    ];
    return days[weekday % 7];
  }

  String _getArabicMonth(int month) {
    const months = [
      'يناير',
      'فبراير',
      'مارس',
      'أبريل',
      'مايو',
      'يونيو',
      'يوليو',
      'أغسطس',
      'سبتمبر',
      'أكتوبر',
      'نوفمبر',
      'ديسمبر',
    ];
    return months[month - 1];
  }

  String _formatDateForAPI(DateTime date) {
    return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }

  void _handleBooking(BuildContext context) {
    if (!_validateBookingData()) {
      return;
    }

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
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 50,
                ),
              ),
              verticalSpace(16),
              const Text(
                'تم تأكيد الحجز!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              verticalSpace(12),
              const Text(
                'تم إرسال تفاصيل الحجز إليك. سيتم التواصل معك قريباً لتأكيد الموعد.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              verticalSpace(24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close dialog
                    Navigator.pop(context); // Go back to details screen
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('موافق'),
                ),
              ),
            ],
          ),
        ),
      ),
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
    
          // Doctor Info Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  ColorsManager.mainBlue,
                  ColorsManager.mainBlue.withOpacity(0.8),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(28),
                    child: widget.doctor.photo.isNotEmpty
                        ? Image.network(
                            widget.doctor.photo,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: Colors.white,
                                child: const Icon(
                                  Icons.person,
                                  color: ColorsManager.mainBlue,
                                  size: 30,
                                ),
                              );
                            },
                          )
                        : Container(
                            color: Colors.white,
                            child: const Icon(
                              Icons.person,
                              color: ColorsManager.mainBlue,
                              size: 30,
                            ),
                          ),
                  ),
                ),
                horizontalSpace(16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'د. ${widget.doctor.userName}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      verticalSpace(4),
                      Row(
                        children: [
                          const Icon(
                            Icons.attach_money,
                            color: Colors.white,
                            size: 16,
                          ),
                          horizontalSpace(4),
                          Text(
                            '${widget.doctor.detectionPrice} جنيه',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white70,
                            ),
                          ),
                          horizontalSpace(16),
                          const Icon(Icons.star, color: Colors.amber, size: 16),
                          horizontalSpace(4),
                          Text(
                            '${widget.doctor.rate ?? 0}',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
    
          // Booking Steps
          Expanded(
            child: Column(
              children: [
                // Tab Bar
                Container(
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TabBar(
                    controller: _tabController,
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.grey[600],
                    indicator: BoxDecoration(
                      color: ColorsManager.mainBlue,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabs: const [
                      Tab(
                        child: Text('البيانات', style: TextStyle(fontSize: 12)),
                      ),
                      Tab(
                        child: Text('التاريخ', style: TextStyle(fontSize: 12)),
                      ),
                      Tab(
                        child: Text('الوقت', style: TextStyle(fontSize: 12)),
                      ),
                      Tab(
                        child: Text('ملاحظات', style: TextStyle(fontSize: 12)),
                      ),
                    ],
                  ),
                ),
    
                // Tab Bar View
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      // User Data
                      _buildUserDataSection(),
                      
                      // Date Selection
                      _buildDateSelection(availableDates),
    
                      // Time Selection
                      _buildTimeSelection(availableTimeSlots),
    
                      // Notes and Summary
                      _buildNotesAndSummarySection(),
                    ],
                  ),
                ),
              ],
            ),
          ),
    
          // Book Button with BlocListener
          BlocListener<DoctorsCubit, DoctorsState>(
            listener: (context, state) {
              state.whenOrNull(
                reservationSuccess: (reservationResponse) {
                  _showSuccessDialog();
                },
                reservationError: (error) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(error.getAllErrorMessages()),
                      backgroundColor: Colors.red,
                    ),
                  );
                },
              );
            },
            child: Container(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: BlocBuilder<DoctorsCubit, DoctorsState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: state.maybeWhen(
                        reservationLoading: () => null,
                        orElse: () => () => _handleBooking(context),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorsManager.mainBlue,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 2,
                      ),
                      child: state.maybeWhen(
                        reservationLoading: () => const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        ),
                        orElse: () => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.calendar_month, size: 20),
                            horizontalSpace(8),
                            const Text(
                              'تأكيد الحجز',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserDataSection() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'البيانات الشخصية',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: ColorsManager.mainBlue,
            ),
          ),
          verticalSpace(20),
          
          // Name Field
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              labelText: 'الاسم الكامل',
              prefixIcon: const Icon(Icons.person),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            textAlign: TextAlign.right,
          ),
          verticalSpace(16),
          
          // Phone Field
          TextField(
            controller: phoneController,
            decoration: InputDecoration(
              labelText: 'رقم الهاتف',
              prefixIcon: const Icon(Icons.phone),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            keyboardType: TextInputType.phone,
            textAlign: TextAlign.right,
          ),
          verticalSpace(16),
          
          // Age Field
          TextField(
            controller: ageController,
            decoration: InputDecoration(
              labelText: 'العمر',
              prefixIcon: const Icon(Icons.cake),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            keyboardType: TextInputType.number,
            textAlign: TextAlign.right,
          ),
          verticalSpace(16),
          
          // Gender Selection
          const Text(
            'الجنس',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          verticalSpace(8),
          Row(
            children: [
              Expanded(
                child: RadioListTile<String>(
                  title: const Text('ذكر'),
                  value: 'ذكر',
                  groupValue: selectedGender,
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value!;
                    });
                  },
                ),
              ),
              Expanded(
                child: RadioListTile<String>(
                  title: const Text('أنثى'),
                  value: 'أنثى',
                  groupValue: selectedGender,
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value!;
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDateSelection(List<DateTime> availableDates) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'اختر التاريخ المناسب',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: ColorsManager.mainBlue,
            ),
          ),
          verticalSpace(16),
          Expanded(
            child: GridView.builder(
              gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2.1.h,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: availableDates.length,
              itemBuilder: (context, index) {
                final date = availableDates[index];
                final isSelected =
                    date.day == selectedDate.day &&
                    date.month == selectedDate.month &&
                    date.year == selectedDate.year;
                final isToday =
                    date.day == DateTime.now().day &&
                    date.month == DateTime.now().month &&
                    date.year == DateTime.now().year;

                return InkWell(
                  onTap: () {
                    setState(() {
                      selectedDate = date;
                      selectedTimeSlot = null; // Reset time selection
                    });
                  },
                  child: Container(
                    height: 200.h,
                    decoration: BoxDecoration(
                      color: isSelected ? ColorsManager.mainBlue : Colors.white,
                      border: Border.all(
                        color: isSelected
                            ? ColorsManager.mainBlue
                            : Colors.grey[300]!,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: isSelected
                          ? [
                              BoxShadow(
                                color: ColorsManager.mainBlue.withOpacity(0.3),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ]
                          : [],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _getArabicDayName(date.weekday),
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: isSelected ? Colors.white : Colors.grey[600],
                          ),
                        ),
                        verticalSpace(4),
                        Text(
                          '${date.day}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: isSelected
                                ? Colors.white
                                : ColorsManager.mainBlue,
                          ),
                        ),
                        Text(
                          _getArabicMonth(date.month),
                          style: TextStyle(
                            fontSize: 12,
                            color: isSelected
                                ? Colors.white70
                                : Colors.grey[500],
                          ),
                        ),
                        if (isToday)
                          Container(
                            margin: const EdgeInsets.only(top: 2),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 1,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Colors.white.withOpacity(0.2)
                                  : ColorsManager.mainBlue.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              'اليوم',
                              style: TextStyle(
                                fontSize: 10,
                                color: isSelected
                                    ? Colors.white
                                    : ColorsManager.mainBlue,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeSelection(List<String> availableTimeSlots) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'اختر الوقت المناسب',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: ColorsManager.mainBlue,
            ),
          ),
          verticalSpace(8),
          Text(
            '${_getArabicDayName(selectedDate.weekday)} ${selectedDate.day} ${_getArabicMonth(selectedDate.month)}',
            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
          ),
          verticalSpace(16),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: availableTimeSlots.length,
              itemBuilder: (context, index) {
                final timeSlot = availableTimeSlots[index];
                final isSelected = selectedTimeSlot == timeSlot;

                return InkWell(
                  onTap: () {
                    setState(() {
                      selectedTimeSlot = timeSlot;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: isSelected ? ColorsManager.mainBlue : Colors.white,
                      border: Border.all(
                        color: isSelected
                            ? ColorsManager.mainBlue
                            : Colors.grey[300]!,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: isSelected
                          ? [
                              BoxShadow(
                                color: ColorsManager.mainBlue.withOpacity(0.3),
                                blurRadius: 6,
                                offset: const Offset(0, 2),
                              ),
                            ]
                          : [],
                    ),
                    child: Center(
                      child: Text(
                        timeSlot,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: isSelected ? Colors.white : Colors.black87,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotesAndSummarySection() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'ملاحظات إضافية (اختياري)',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: ColorsManager.mainBlue,
              ),
            ),
            verticalSpace(8),
            const Text(
              'أضف أي ملاحظات أو تفاصيل تريد أن يعرفها الطبيب',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            verticalSpace(20),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: TextField(
                controller: notesController,
                maxLines: 4,
                decoration: const InputDecoration(
                  hintText: 'اكتب ملاحظاتك هنا...',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(16),
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                textAlign: TextAlign.right,
              ),
            ),
            verticalSpace(20),
        
            // Booking Summary
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: ColorsManager.mainBlue.withOpacity(0.05),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: ColorsManager.mainBlue.withOpacity(0.2),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'ملخص الحجز',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: ColorsManager.mainBlue,
                    ),
                  ),
                  verticalSpace(12),
                  _buildSummaryRow('الطبيب:', 'د. ${widget.doctor.userName}'),
                  _buildSummaryRow('الاسم:', nameController.text.isNotEmpty ? nameController.text : 'لم يتم الإدخال'),
                  _buildSummaryRow('رقم الهاتف:', phoneController.text.isNotEmpty ? phoneController.text : 'لم يتم الإدخال'),
                  _buildSummaryRow('العمر:', ageController.text.isNotEmpty ? '${ageController.text} سنة' : 'لم يتم الإدخال'),
                  _buildSummaryRow('الجنس:', selectedGender),
                  _buildSummaryRow(
                    'التاريخ:',
                    '${_getArabicDayName(selectedDate.weekday)} ${selectedDate.day} ${_getArabicMonth(selectedDate.month)}',
                  ),
                  _buildSummaryRow(
                    'الوقت:',
                    selectedTimeSlot ?? 'لم يتم الاختيار',
                  ),
                  _buildSummaryRow(
                    'السعر:',
                    '${widget.doctor.detectionPrice} جنيه',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: value.contains('لم يتم') ? Colors.red : Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}