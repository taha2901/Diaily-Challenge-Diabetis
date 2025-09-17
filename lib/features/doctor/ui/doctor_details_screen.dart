import 'package:challenge_diabetes/core/di/dependency_injection.dart';
import 'package:challenge_diabetes/core/helpers/spacing.dart';
import 'package:challenge_diabetes/core/theming/colors.dart';
import 'package:challenge_diabetes/core/widget/custom_app_bar_doctors.dart';
import 'package:challenge_diabetes/features/doctor/logic/doctors_cubit.dart';
import 'package:challenge_diabetes/features/doctor/model/data/doctor_response_body.dart';
import 'package:challenge_diabetes/features/doctor/ui/widgets/doc_book_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorDetailsScreen extends StatelessWidget {
  final DoctorResponseBody doctor;

  const DoctorDetailsScreen({super.key, required this.doctor});

  String _getArabicSpecialty(String englishSpecialty) {
    switch (englishSpecialty.toLowerCase()) {
      case 'diabetologist':
      case 'diabetes specialist':
        return 'طبيب السكري';
      case 'endocrinologist':
        return 'طبيب غدد صماء';
      case 'internist':
      case 'internal medicine':
        return 'طبيب باطنة';
      case 'nutritionist':
        return 'طبيب تغذية';
      default:
        return doctor.doctorspecialization;
    }
  }

  String _getWorkingDaysText() {
    if (doctor.workingDays.isEmpty) return 'غير محدد';

    final dayNames = [
      'الأحد',
      'الاثنين',
      'الثلاثاء',
      'الأربعاء',
      'الخميس',
      'الجمعة',
      'السبت',
    ];
    final workingDayNames = doctor.workingDays
        .where((day) => day >= 0 && day < 7)
        .map((day) => dayNames[day])
        .toList();

    return workingDayNames.join(', ');
  }

  String _getWorkingHoursText() {
    if (doctor.workingHours.isEmpty) {
      if (doctor.startTime != null && doctor.endTime != null) {
        return '${doctor.startTime} - ${doctor.endTime}';
      }
      return 'غير محدد';
    }
    return doctor.workingHours.join(', ');
  }

  void _showContactDialog(
    BuildContext context,
    String title,
    String content,
    String type,
  ) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                type == 'phone' ? Icons.phone : Icons.email,
                color: ColorsManager.mainBlue,
                size: 48,
              ),
              verticalSpace(16),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              verticalSpace(12),
              Text(
                content,
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              verticalSpace(24),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('إلغاء'),
                    ),
                  ),
                  horizontalSpace(12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Clipboard.setData(ClipboardData(text: content));
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'تم نسخ ${type == 'phone' ? 'رقم الهاتف' : 'البريد الإلكتروني'}',
                            ),
                            duration: const Duration(seconds: 2),
                            backgroundColor: ColorsManager.mainBlue,
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorsManager.mainBlue,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('نسخ'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const CustomAppBarForDoctors(title: 'تفاصيل الطبيب'),
                  // Enhanced header with doctor image and info
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          ColorsManager.mainBlue,
                          ColorsManager.mainBlue.withOpacity(0.8),
                          ColorsManager.mainBlue.withOpacity(0.6),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: EnhancedImageAndNameAndSpecialityOfDoctor(
                      doctor: doctor,
                    ),
                  ),
                  // Details cards with improved design
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 20.h,
                    ),
                    child: Column(
                      children: [
                        // Communication Info Card
                        EnhancedInfoCard(
                          title: 'معلومات الاتصال',
                          icon: Icons.contact_phone,
                          children: [
                            EnhancedInfoRow(
                              icon: Icons.location_on,
                              iconColor: Colors.red,
                              label: 'العنوان',
                              value: doctor.address.isNotEmpty
                                  ? doctor.address
                                  : 'غير محدد',
                              showAction: false,
                            ),
                            const Divider(height: 24),
                            EnhancedInfoRow(
                              icon: Icons.phone,
                              iconColor: Colors.green,
                              label: 'رقم الهاتف',
                              value: doctor.phone.isNotEmpty
                                  ? doctor.phone
                                  : 'غير محدد',
                              showAction: doctor.phone.isNotEmpty,
                              onTap: doctor.phone.isNotEmpty
                                  ? () {
                                      _showContactDialog(
                                        context,
                                        'رقم الهاتف',
                                        doctor.phone,
                                        'phone',
                                      );
                                    }
                                  : null,
                            ),
                            const Divider(height: 24),
                            EnhancedInfoRow(
                              icon: Icons.email,
                              iconColor: Colors.blue,
                              label: 'البريد الإلكتروني',
                              value: doctor.email.isNotEmpty
                                  ? doctor.email
                                  : 'غير محدد',
                              showAction: doctor.email.isNotEmpty,
                              onTap: doctor.email.isNotEmpty
                                  ? () {
                                      _showContactDialog(
                                        context,
                                        'البريد الإلكتروني',
                                        doctor.email,
                                        'email',
                                      );
                                    }
                                  : null,
                            ),
                          ],
                        ),
                        verticalSpace(16),

                        // Professional Info Card
                        EnhancedInfoCard(
                          title: 'المعلومات المهنية',
                          icon: Icons.medical_services,
                          children: [
                            EnhancedInfoRow(
                              icon: Icons.medical_services,
                              iconColor: ColorsManager.mainBlue,
                              label: 'التخصص',
                              value: _getArabicSpecialty(
                                doctor.doctorspecialization,
                              ),
                              showAction: false,
                            ),
                            const Divider(height: 24),
                            EnhancedInfoRow(
                              icon: Icons.star_rate,
                              iconColor: Colors.amber,
                              label: 'التقييم',
                              value:
                                  '${doctor.rate ?? 0} من 5 (${doctor.rateCount ?? 0} تقييم)',
                              showAction: false,
                            ),
                            const Divider(height: 24),
                            EnhancedInfoRow(
                              icon: Icons.attach_money,
                              iconColor: Colors.green,
                              label: 'سعر الكشف',
                              value: '${doctor.detectionPrice} جنيه',
                              showAction: false,
                            ),
                            const Divider(height: 24),
                            EnhancedInfoRow(
                              icon: Icons.access_time,
                              iconColor: Colors.orange,
                              label: 'وقت الانتظار المتوقع',
                              value: doctor.waitingTime.isNotEmpty
                                  ? doctor.waitingTime
                                  : 'غير محدد',
                              showAction: false,
                            ),
                          ],
                        ),
                        verticalSpace(16),

                        // Working Hours Card
                        EnhancedInfoCard(
                          title: 'أوقات العمل',
                          icon: Icons.schedule,
                          children: [
                            EnhancedInfoRow(
                              icon: Icons.calendar_today,
                              iconColor: ColorsManager.mainBlue,
                              label: 'أيام العمل',
                              value: _getWorkingDaysText(),
                              showAction: false,
                            ),
                            const Divider(height: 24),
                            EnhancedInfoRow(
                              icon: Icons.schedule,
                              iconColor: Colors.purple,
                              label: 'ساعات العمل',
                              value: _getWorkingHoursText(),
                              showAction: false,
                            ),
                          ],
                        ),

                        // About Doctor Card
                        if (doctor.about.isNotEmpty) ...[
                          verticalSpace(16),
                          EnhancedInfoCard(
                            title: 'نبذة عن الطبيب',
                            icon: Icons.info,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Colors.grey[50],
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: Colors.grey[200]!),
                                ),
                                child: Text(
                                  doctor.about,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.black87,
                                    height: 1.6,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            ],
                          ),
                        ],

                        verticalSpace(100), // Space for floating button
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        child: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DoctorBookingScreen(doctor: doctor),
              ),
            );
          },
          backgroundColor: ColorsManager.mainBlue,
          foregroundColor: Colors.white,
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          label: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.calendar_month, size: 24),
              horizontalSpace(8),
              Text(
                'احجز موعد',
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

// Enhanced Info Card Widget
class EnhancedInfoCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<Widget> children;

  const EnhancedInfoCard({
    super.key,
    required this.title,
    required this.icon,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shadowColor: ColorsManager.mainBlue.withOpacity(0.2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [Colors.white, Colors.grey[50]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: ColorsManager.mainBlue.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(icon, color: ColorsManager.mainBlue, size: 24),
                  ),
                  horizontalSpace(12),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: ColorsManager.mainBlue,
                    ),
                  ),
                ],
              ),
              verticalSpace(20),
              ...children,
            ],
          ),
        ),
      ),
    );
  }
}

// Enhanced Info Row Widget
class EnhancedInfoRow extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String label;
  final String value;
  final VoidCallback? onTap;
  final bool showAction;

  const EnhancedInfoRow({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.value,
    this.onTap,
    this.showAction = true,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: onTap != null ? Colors.grey[50] : Colors.transparent,
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: iconColor, size: 20),
            ),
            horizontalSpace(12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            if (showAction && onTap != null)
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: ColorsManager.mainBlue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Icon(
                  Icons.copy,
                  color: ColorsManager.mainBlue,
                  size: 16,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class EnhancedImageAndNameAndSpecialityOfDoctor extends StatelessWidget {
  final DoctorResponseBody doctor;

  const EnhancedImageAndNameAndSpecialityOfDoctor({
    super.key,
    required this.doctor,
  });

  String _getArabicSpecialty(String englishSpecialty) {
    switch (englishSpecialty.toLowerCase()) {
      case 'diabetologist':
      case 'diabetes specialist':
        return 'طبيب السكري';
      case 'endocrinologist':
        return 'طبيب غدد صماء';
      case 'internist':
      case 'internal medicine':
        return 'طبيب باطنة';
      case 'nutritionist':
        return 'طبيب تغذية';
      default:
        return englishSpecialty;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Column(
        children: [
          // Doctor Image with enhanced design
          Stack(
            children: [
              Container(
                width: 140.w,
                height: 140.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(70),
                  border: Border.all(color: Colors.white, width: 5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(65),
                  child: doctor.photo.isNotEmpty
                      ? Image.network(
                          doctor.photo,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [Colors.white, Colors.grey[100]!],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                              ),
                              child: const Icon(
                                Icons.person,
                                color: ColorsManager.mainBlue,
                                size: 70,
                              ),
                            );
                          },
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [Colors.white, Colors.grey[100]!],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                              ),
                              child: const Center(
                                child: CircularProgressIndicator(
                                  color: ColorsManager.mainBlue,
                                  strokeWidth: 3,
                                ),
                              ),
                            );
                          },
                        )
                      : Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.white, Colors.grey[100]!],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: const Icon(
                            Icons.person,
                            color: ColorsManager.mainBlue,
                            size: 70,
                          ),
                        ),
                ),
              ),
              // Online indicator (you can make this dynamic)
              Positioned(
                bottom: 10,
                right: 10,
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 3),
                  ),
                ),
              ),
            ],
          ),

          verticalSpace(20),

          // Doctor Name
          Text(
            'د. ${doctor.userName}',
            style: TextStyle(
              fontSize: 26.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: [
                Shadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),

          verticalSpace(8),

          // Specialty
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white.withOpacity(0.3)),
            ),
            child: Text(
              _getArabicSpecialty(doctor.doctorspecialization),
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          verticalSpace(20),

          // Rating and Price Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Rating
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Colors.white.withOpacity(0.3)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.star, color: Colors.amber[300], size: 20),
                    horizontalSpace(6),
                    Text(
                      doctor.rate?.toStringAsFixed(1) ?? '0.0',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    if (doctor.rateCount != null && doctor.rateCount! > 0) ...[
                      horizontalSpace(4),
                      Text(
                        '(${doctor.rateCount})',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ],
                ),
              ),

              // Price
              if (doctor.detectionPrice > 0)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Colors.white.withOpacity(0.3)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.attach_money, color: Colors.white, size: 18),
                      horizontalSpace(4),
                      Text(
                        '${doctor.detectionPrice} جنيه',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),

          // Experience/Working time indicator
          if (doctor.waitingTime.isNotEmpty) ...[
            verticalSpace(16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.orange.withOpacity(0.2),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.orange.withOpacity(0.3)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.access_time, color: Colors.white, size: 16),
                  horizontalSpace(6),
                  Text(
                    'وقت الانتظار: ${doctor.waitingTime}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
