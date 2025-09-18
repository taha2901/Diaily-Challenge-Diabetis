import 'package:challenge_diabetes/core/helpers/spacing.dart';
import 'package:challenge_diabetes/core/theming/colors.dart';
import 'package:challenge_diabetes/core/widget/custom_app_bar_doctors.dart';
import 'package:challenge_diabetes/features/doctor/model/data/doctor_response_body.dart';
import 'package:challenge_diabetes/features/doctor/ui/doc_book_screen.dart';
import 'package:challenge_diabetes/features/doctor/ui/widgets/doctor_details/contact_dialouge.dart';
import 'package:challenge_diabetes/features/doctor/ui/widgets/doctor_details/image_name_speciality_of_doctor.dart';
import 'package:challenge_diabetes/features/doctor/ui/widgets/doctor_details/section_card.dart';
import 'package:challenge_diabetes/features/doctor/ui/widgets/doctor_details/info_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorDetailsScreen extends StatelessWidget {
  final DoctorResponseBody doctor;

  const DoctorDetailsScreen({super.key, required this.doctor});

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
                  // header with doctor image and info
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
                    child: ImageAndNameAndSpecialityOfDoctor(doctor: doctor),
                  ),
                  // Details cards
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 20.h,
                    ),
                    child: Column(
                      children: [
                        // Communication Info Card
                        SectionCard(
                          title: 'معلومات الاتصال',
                          icon: Icons.contact_phone,
                          children: [
                            InfoRow(
                              icon: Icons.location_on,
                              iconColor: Colors.red,
                              label: 'العنوان',
                              value: doctor.address.isNotEmpty
                                  ? doctor.address
                                  : 'غير محدد',
                              showAction: false,
                            ),
                            const Divider(height: 24),
                            InfoRow(
                              icon: Icons.phone,
                              iconColor: Colors.green,
                              label: 'رقم الهاتف',
                              value: doctor.phone.isNotEmpty
                                  ? doctor.phone
                                  : 'غير محدد',
                              showAction: doctor.phone.isNotEmpty,
                              onTap: doctor.phone.isNotEmpty
                                  ? () {
                                      showDialog(
                                        context: context,
                                        builder: (context) => ContactDialog(
                                          title: "اتصال بالطبيب",
                                          content: doctor.phone,
                                          type: "phone", // أو "email"
                                        ),
                                      );
                                    }
                                  : null,
                            ),
                            const Divider(height: 24),
                            InfoRow(
                              icon: Icons.email,
                              iconColor: Colors.blue,
                              label: 'البريد الإلكتروني',
                              value: doctor.email.isNotEmpty
                                  ? doctor.email
                                  : 'غير محدد',
                              showAction: doctor.email.isNotEmpty,
                              onTap: doctor.email.isNotEmpty
                                  ? () {
                                      showDialog(
                                        context: context,
                                        builder: (context) => ContactDialog(
                                          title: "اتصال بالطبيب",
                                          content: doctor.phone,
                                          type: "phone", // أو "email"
                                        ),
                                      );
                                    }
                                  : null,
                            ),
                          ],
                        ),
                        verticalSpace(16),

                        // Professional Info Card
                        SectionCard(
                          title: 'المعلومات المهنية',
                          icon: Icons.medical_services,
                          children: [
                            InfoRow(
                              icon: Icons.medical_services,
                              iconColor: ColorsManager.mainBlue,
                              label: 'التخصص',
                              value: doctor.doctorspecialization,
                              showAction: false,
                            ),
                            const Divider(height: 24),
                            InfoRow(
                              icon: Icons.star_rate,
                              iconColor: Colors.amber,
                              label: 'التقييم',
                              value:
                                  '${doctor.rate ?? 0} من 5 (${doctor.rateCount ?? 0} تقييم)',
                              showAction: false,
                            ),
                            const Divider(height: 24),
                            InfoRow(
                              icon: Icons.attach_money,
                              iconColor: Colors.green,
                              label: 'سعر الكشف',
                              value: '${doctor.detectionPrice} جنيه',
                              showAction: false,
                            ),
                            const Divider(height: 24),
                            InfoRow(
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
                        SectionCard(
                          title: 'أوقات العمل',
                          icon: Icons.schedule,
                          children: [
                            InfoRow(
                              icon: Icons.calendar_today,
                              iconColor: ColorsManager.mainBlue,
                              label: 'أيام العمل',
                              value: _getWorkingDaysText(),
                              showAction: false,
                            ),
                            const Divider(height: 24),
                            InfoRow(
                              icon: Icons.schedule,
                              iconColor: Colors.purple,
                              label: 'ساعات العمل',
                              value: _getWorkingHoursText(),
                              showAction: false,
                            ),
                          ],
                        ),

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
