import 'package:challenge_diabetes/core/helpers/spacing.dart';
import 'package:challenge_diabetes/core/theming/colors.dart';
import 'package:challenge_diabetes/core/widget/custom_app_bar_doctors.dart';
import 'package:challenge_diabetes/features/doctor/ui/widgets/image_name_special_of_doctor.dart';
import 'package:challenge_diabetes/features/doctor/model/data/doctor_response_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorDetailsScreen extends StatelessWidget {
  final DoctorResponseBody doctor;
  
  const DoctorDetailsScreen({
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
        return doctor.doctorspecialization;
    }
  }

  String _getWorkingDaysText() {
    if (doctor.workingDays.isEmpty) return 'غير محدد';
    
    final dayNames = ['الأحد', 'الاثنين', 'الثلاثاء', 'الأربعاء', 'الخميس', 'الجمعة', 'السبت'];
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomAppBarForDoctors(title: 'تفاصيل الطبيب'),
            // Header with doctor image and basic info
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    ColorsManager.mainBlue,
                    ColorsManager.mainBlue.withOpacity(0.6),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: ImageAndNameAndSpecialityOfDoctor(doctor: doctor),
            ),
            // Details cards
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Column(
                children: [
                  InfoOfCommunicationCard(
                    title: 'معلومات الاتصال',
                    children: [
                      InfoRow(
                        icon: Icons.location_on,
                        label: 'العنوان',
                        value: doctor.address,
                        onTap: () {},
                      ),
                      InfoRow(
                        icon: Icons.phone,
                        label: 'رقم الهاتف',
                        value: doctor.phone,
                        onTap: () {
                          Clipboard.setData(
                            ClipboardData(text: doctor.phone),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('تم نسخ رقم الهاتف'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        },
                      ),
                      InfoRow(
                        icon: Icons.email,
                        label: 'البريد الإلكتروني',
                        value: doctor.email,
                        onTap: () {
                          Clipboard.setData(
                            ClipboardData(text: doctor.email),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('تم نسخ البريد الإلكتروني'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  verticalSpace(16),
                  InfoOfCommunicationCard(
                    title: 'المعلومات المهنية',
                    children: [
                      InfoRow(
                        icon: Icons.medical_services,
                        label: 'التخصص',
                        value: _getArabicSpecialty(doctor.doctorspecialization),
                      ),
                      InfoRow(
                        icon: Icons.star_rate,
                        label: 'التقييم',
                        value: '${doctor.rate ?? 0} من 5 (${doctor.rateCount ?? 0} تقييم)',
                      ),
                      InfoRow(
                        icon: Icons.attach_money,
                        label: 'سعر الكشف',
                        value: '${doctor.detectionPrice} جنيه',
                      ),
                      InfoRow(
                        icon: Icons.access_time,
                        label: 'وقت الانتظار المتوقع',
                        value: doctor.waitingTime,
                      ),
                    ],
                  ),
                  verticalSpace(16),
                  InfoOfCommunicationCard(
                    title: 'أوقات العمل',
                    children: [
                      InfoRow(
                        icon: Icons.calendar_today,
                        label: 'أيام العمل',
                        value: _getWorkingDaysText(),
                      ),
                      InfoRow(
                        icon: Icons.schedule,
                        label: 'ساعات العمل',
                        value: _getWorkingHoursText(),
                      ),
                    ],
                  ),
                  if (doctor.about.isNotEmpty) ...[
                    verticalSpace(16),
                    InfoOfCommunicationCard(
                      title: 'نبذة عن الطبيب',
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Text(
                            doctor.about,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black87,
                              height: 1.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// ويدجت الكارت
class InfoOfCommunicationCard extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const InfoOfCommunicationCard({
    super.key,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: ColorsManager.mainBlue,
              ),
            ),
            verticalSpace(16),
            ...children,
          ],
        ),
      ),
    );
  }
}

/// ويدجت الرو
class InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final VoidCallback? onTap;

  const InfoRow({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Icon(icon, color: ColorsManager.mainBlue, size: 24),
            const SizedBox(width: 16),
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
                    style: const TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                ],
              ),
            ),
            if (onTap != null)
              Icon(Icons.copy, color: Colors.grey[400], size: 20),
          ],
        ),
      ),
    );
  }
}