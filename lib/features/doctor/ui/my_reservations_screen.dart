import 'package:challenge_diabetes/core/di/dependency_injection.dart';
import 'package:challenge_diabetes/features/doctor/logic/doctors_cubit.dart';
import 'package:challenge_diabetes/features/doctor/logic/doctors_state.dart';
import 'package:challenge_diabetes/features/doctor/model/data/reservation_response_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyReservationsScreen extends StatefulWidget {
  const MyReservationsScreen({super.key});

  @override
  State<MyReservationsScreen> createState() => _MyReservationsScreenState();
}

class _MyReservationsScreenState extends State<MyReservationsScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getit<DoctorsCubit>()..getUserReservation(),
      child: Scaffold(
        body: Column(
          children: [
            // Custom App Bar
            Container(
              padding: const EdgeInsets.only(
                top: 50,
                left: 20,
                right: 20,
                bottom: 20,
              ),
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
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                  ),
                  const Expanded(
                    child: Text(
                      'حجوزاتي',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 48), // To balance the back button
                ],
              ),
            ),

            // Reservations List
            Expanded(
              child: BlocBuilder<DoctorsCubit, DoctorsState>(
                builder: (context, state) {
                  return state.when(
                    availableTimeError: (apiErrorModel) => SizedBox(),
                    availableTimeLoading: () => SizedBox(),
                    availableTimeSuccess: (availableTimeResponse) => SizedBox(),
                    reservationError: (apiErrorModel) => SizedBox(),
                    reservationLoading: () => SizedBox(),
                    reservationSuccess: (reservationResponse) => SizedBox(),
                    initial: () => const SizedBox(),
                    doctorError: (apiErrorModel) => SizedBox(),
                    doctorLoading: () => SizedBox(),
                    doctorSuccess: (doctor) => SizedBox(),

                    // User reservations loading
                    userReservationLoading: () => const Center(
                      child: CircularProgressIndicator(
                        color: ColorsManager.mainBlue,
                      ),
                    ),

                    // User reservations success
                    userReservationSuccess: (reservations) {
                      if (reservations.isEmpty) {
                        return _buildEmptyState();
                      }
                      return _buildReservationsList(reservations);
                    },

                    // User reservations error
                    userReservationError: (error) =>
                        _buildErrorState(error.getAllErrorMessages()),

                    // Delete reservation success - refresh list
                    deleteReservationSuccess: (response) {
                      // Refresh reservations after successful deletion
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        context.read<DoctorsCubit>().getUserReservation();
                      });
                      return const Center(
                        child: CircularProgressIndicator(
                          color: ColorsManager.mainBlue,
                        ),
                      );
                    },

                    // Delete reservation loading
                    deleteReservationLoading: () => const Center(
                      child: CircularProgressIndicator(
                        color: ColorsManager.mainBlue,
                      ),
                    ),

                    // Delete reservation error
                    deleteReservationError: (error) =>
                        _buildErrorState(error.getAllErrorMessages()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.event_busy, size: 60, color: Colors.grey[400]),
          ),
          verticalSpace(20),
          Text(
            'لا توجد حجوزات',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey[600],
            ),
          ),
          verticalSpace(8),
          Text(
            'لم تقم بحجز أي مواعيد بعد',
            style: TextStyle(fontSize: 14, color: Colors.grey[500]),
          ),
          verticalSpace(30),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorsManager.mainBlue,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            child: const Text('احجز موعد جديد'),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(String errorMessage) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 60, color: Colors.red[300]),
          verticalSpace(16),
          Text(
            'حدث خطأ',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.red[600],
            ),
          ),
          verticalSpace(8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              errorMessage,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
          ),
          verticalSpace(20),
          ElevatedButton(
            onPressed: () {
              // context.read<DoctorsCubit>().getUserReservation();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorsManager.mainBlue,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            child: const Text('إعادة المحاولة'),
          ),
        ],
      ),
    );
  }

  Widget _buildReservationsList(List<ReservationResponseBody> reservations) {
    return RefreshIndicator(
      color: ColorsManager.mainBlue,
      onRefresh: () async {
        context.read<DoctorsCubit>().getUserReservation();
      },
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: reservations.length,
        itemBuilder: (context, index) {
          final reservation = reservations[index];
          return _buildReservationCard(reservation, index);
        },
      ),
    );
  }

  Widget _buildReservationCard(ReservationResponseBody reservation, int index) {
    // Extract data from reservation model
    final reservationData = reservation.data;
    if (reservationData == null) return const SizedBox();

    // You'll need to get doctor info - either from the reservation or make another API call
    final doctorName =
        "الطبيب"; // You might need to add doctor name to the reservation model or fetch it
    final specialty = "طبيب عام"; // Same here
    final date = _formatDate(reservationData.date ?? '');
    final time = _formatTime(reservationData.time ?? '');
    final status =
        _getReservationStatus(); // You might need to add status to your model
    final price = "200"; // You might need to add price to your model
    final reservationId = reservationData.id ?? 0;
    // final patientName = reservationData.username ?? '';
    // final phone = reservationData.phone ?? '';
    // final age = reservationData.age?.toString() ?? '';
    // final sex = reservationData.sex ?? '';

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(
          color: _getStatusColor(status).withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          // Header with status
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: _getStatusColor(status).withOpacity(0.1),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: _getStatusColor(status),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    status,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  'حجز #$reservationId',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          // Main content
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // Doctor info
                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: ColorsManager.mainBlue.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: ColorsManager.mainBlue.withOpacity(0.3),
                        ),
                      ),
                      child: const Icon(
                        Icons.person,
                        color: ColorsManager.mainBlue,
                        size: 24,
                      ),
                    ),
                    horizontalSpace(12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            doctorName,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          verticalSpace(4),
                          Text(
                            specialty,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                verticalSpace(16),

                // Appointment details
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      _buildDetailRow(Icons.calendar_today, 'التاريخ', date),
                      verticalSpace(8),
                      _buildDetailRow(Icons.access_time, 'الوقت', time),
                      verticalSpace(8),
                      _buildDetailRow(
                        Icons.attach_money,
                        'السعر',
                        '$price جنيه',
                      ),
                    ],
                  ),
                ),

                verticalSpace(16),

                // Action buttons
                Row(
                  children: [
                    if (status == "في الانتظار" || status == "مؤكد")
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () =>
                              _showCancelConfirmationDialog(reservationId),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.red,
                            side: const BorderSide(color: Colors.red),
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'إلغاء الحجز',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ),
                    if (status == "في الانتظار" || status == "مؤكد")
                      horizontalSpace(12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => _showReservationDetails(
                          reservationData,
                          doctorName,
                          specialty,
                          status,
                          price,
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorsManager.mainBlue,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'التفاصيل',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 18, color: ColorsManager.mainBlue),
        horizontalSpace(8),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
            fontWeight: FontWeight.w500,
          ),
        ),
        const Spacer(),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black87,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case "مؤكد":
        return Colors.green;
      case "في الانتظار":
        return Colors.orange;
      case "مكتمل":
        return Colors.blue;
      case "ملغى":
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  String _getReservationStatus() {
    // Since status is not in your model, you might want to add it
    // For now, return a default status
    return "مؤكد";
  }

  String _formatDate(String date) {
    if (date.isEmpty) return '';
    try {
      final dateTime = DateTime.parse(date);
      return '${_getWeekDay(dateTime.weekday)} ${dateTime.day}/${dateTime.month}/${dateTime.year}';
    } catch (e) {
      return date;
    }
  }

  String _formatTime(String time) {
    if (time.isEmpty) return '';
    // Assuming time format is like "10:00"
    return time;
  }

  String _getWeekDay(int weekday) {
    switch (weekday) {
      case 1:
        return 'الإثنين';
      case 2:
        return 'الثلاثاء';
      case 3:
        return 'الأربعاء';
      case 4:
        return 'الخميس';
      case 5:
        return 'الجمعة';
      case 6:
        return 'السبت';
      case 7:
        return 'الأحد';
      default:
        return '';
    }
  }

  void _showCancelConfirmationDialog(int reservationId) {
    showDialog(
      context: context,
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
                  color: Colors.red.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.warning_amber,
                  color: Colors.red,
                  size: 40,
                ),
              ),
              verticalSpace(16),
              const Text(
                'تأكيد إلغاء الحجز',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              verticalSpace(12),
              const Text(
                'هل أنت متأكد من رغبتك في إلغاء هذا الحجز؟ لا يمكن التراجع عن هذا الإجراء.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              verticalSpace(24),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text('تراجع'),
                    ),
                  ),
                  horizontalSpace(12),
                  Expanded(
                    child: BlocBuilder<DoctorsCubit, DoctorsState>(
                      builder: (context, state) {
                        return ElevatedButton(
                          onPressed: state.maybeWhen(
                            deleteReservationLoading: () => null,
                            orElse: () => () {
                              context.read<DoctorsCubit>().deleteReservation(
                                reservationId,
                                context,
                              );
                              Navigator.pop(context);
                            },
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: state.maybeWhen(
                            deleteReservationLoading: () => const SizedBox(
                              height: 16,
                              width: 16,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            ),
                            orElse: () => const Text('إلغاء الحجز'),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showReservationDetails(
    ReservationModelDetails reservationData,
    String doctorName,
    String specialty,
    String status,
    String price,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.7,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: Column(
          children: [
            // Handle bar
            Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),

            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  const Text(
                    'تفاصيل الحجز',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: ColorsManager.mainBlue,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
            ),

            const Divider(),

            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Doctor information
                    _buildDetailSection('معلومات الطبيب', [
                      _buildDetailItem('اسم الطبيب', doctorName),
                      _buildDetailItem('التخصص', specialty),
                      _buildDetailItem(
                        'معرف الطبيب',
                        reservationData.doctorId?.toString() ?? '',
                      ),
                    ]),

                    verticalSpace(20),

                    _buildDetailSection('معلومات الموعد', [
                      _buildDetailItem(
                        'التاريخ',
                        _formatDate(reservationData.date ?? ''),
                      ),
                      _buildDetailItem(
                        'الوقت',
                        _formatTime(reservationData.time ?? ''),
                      ),
                      _buildDetailItem('الحالة', status),
                      _buildDetailItem('سعر الكشف', '$price جنيه'),
                    ]),

                    verticalSpace(20),

                    _buildDetailSection('معلومات المريض', [
                      _buildDetailItem('الاسم', reservationData.username ?? ''),
                      _buildDetailItem(
                        'رقم الهاتف',
                        reservationData.phone ?? '',
                      ),
                      _buildDetailItem(
                        'العمر',
                        '${reservationData.age ?? ''} سنة',
                      ),
                      _buildDetailItem('النوع', reservationData.sex ?? ''),
                    ]),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailSection(String title, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: ColorsManager.mainBlue,
          ),
        ),
        verticalSpace(12),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey[200]!),
          ),
          child: Column(children: items),
        ),
      ],
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(': ', style: TextStyle(color: Colors.grey[600])),
          Expanded(
            child: Text(
              value.isEmpty ? 'غير محدد' : value,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Helper functions (add these if they don't exist)
Widget verticalSpace(double height) => SizedBox(height: height);
Widget horizontalSpace(double width) => SizedBox(width: width);

// Mock ColorsManager class (replace with your actual colors)
class ColorsManager {
  static const Color mainBlue = Color(0xFF247CFF);
}
