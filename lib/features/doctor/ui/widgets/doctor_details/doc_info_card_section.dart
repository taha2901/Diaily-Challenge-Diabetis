import 'package:challenge_diabetes/core/theming/colors.dart';
import 'package:challenge_diabetes/features/doctor/model/data/doctor_response_body.dart';
import 'package:challenge_diabetes/features/doctor/ui/widgets/doctor_details/more_info_card.dart';
import 'package:challenge_diabetes/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorInfoCardsSection extends StatelessWidget {
  final DoctorResponseBody doctor;

  const DoctorInfoCardsSection({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, -40.h),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            _buildQuickStatsRow(context),

            SizedBox(height: 20.h),

            // Professional Info Card
            ModernInfoCard(
              title: LocaleKeys.doctor_professional_info.tr(),
              icon: Icons.work_outline_rounded,
              gradient: LinearGradient(
                colors: [
                  ColorsManager.mainBlue.withOpacity(0.8),
                  ColorsManager.mainBlue,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              items: [
                ModernInfoItem(
                  icon: Icons.medical_services_rounded,
                  label: LocaleKeys.doctor_specialization.tr(),
                  value: doctor.doctorspecialization,
                  color: ColorsManager.mainBlue,
                ),
                ModernInfoItem(
                  icon: Icons.attach_money_rounded,
                  label: LocaleKeys.doctor_price.tr(),
                  value:
                      '${doctor.detectionPrice} ${LocaleKeys.doctor_egp.tr()}',
                  color: const Color(0xFF10B981),
                ),
              ],
            ),

            SizedBox(height: 16.h),

            // Contact Info Card
            ModernInfoCard(
              title: LocaleKeys.doctor_contact_info.tr(),
              icon: Icons.contact_phone_rounded,
              gradient: LinearGradient(
                colors: [
                  const Color(0xFF667eea).withOpacity(0.8),
                  const Color(0xFF764ba2),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              items: [
                ModernInfoItem(
                  icon: Icons.phone_rounded,
                  label: LocaleKeys.doctor_phone.tr(),
                  value: doctor.phone.isNotEmpty
                      ? doctor.phone
                      : LocaleKeys.doctor_not_specified.tr(),
                  color: const Color(0xFF10B981),
                  isClickable: doctor.phone.isNotEmpty,
                  onTap: doctor.phone.isNotEmpty
                      ? () => _showContactDialog(context, doctor.phone, "phone")
                      : null,
                ),
                ModernInfoItem(
                  icon: Icons.location_on_rounded,
                  label: LocaleKeys.doctor_address.tr(),
                  value: doctor.address.isNotEmpty
                      ? doctor.address
                      : LocaleKeys.doctor_not_specified.tr(),
                  color: const Color(0xFFEF4444),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

 Widget _buildQuickStatsRow(BuildContext context) {
  return IntrinsicHeight(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.stretch, // مهم
      children: [
        Expanded(
          child: _buildQuickStatCard(
            icon: Icons.star_rounded,
            value: '${doctor.rate ?? 0}',
            label: LocaleKeys.doctor_rating.tr(),
            color: const Color(0xFFFBBF24),
            subtitle: LocaleKeys.doctor_rating_count.tr(
              args: ['${doctor.rateCount ?? 0}'],
            ),
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: _buildQuickStatCard(
            icon: Icons.schedule_rounded,
            value: doctor.waitingTime.isNotEmpty ? doctor.waitingTime : '--',
            label: LocaleKeys.doctor_waiting_time.tr(),
            color: const Color(0xFF8B5CF6),
            subtitle: LocaleKeys.doctor_minutes.tr(),
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: _buildQuickStatCard(
            icon: Icons.payments_rounded,
            value: '${doctor.detectionPrice}',
            label: LocaleKeys.doctor_price.tr(),
            color: const Color(0xFF10B981),
            subtitle: LocaleKeys.doctor_egp.tr(),
          ),
        ),
      ],
    ),
  );
}


  Widget _buildQuickStatCard({
    required IconData icon,
    required String value,
    required String label,
    required Color color,
    String? subtitle,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 8),
            spreadRadius: 0,
          ),
        ],
        border: Border.all(color: color.withOpacity(0.1), width: 1),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 20.sp),
          ),
          SizedBox(height: 12.h),
          Text(
            value,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1F2937),
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            label,
            style: TextStyle(
              fontSize: 11.sp,
              color: const Color(0xFF6B7280),
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          if (subtitle != null) ...[
            SizedBox(height: 2.h),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 9.sp,
                color: const Color(0xFF9CA3AF),
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ],
      ),
    );
  }

  void _showContactDialog(BuildContext context, String contact, String type) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          padding: EdgeInsets.all(24.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: ColorsManager.mainBlue.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.phone_rounded,
                  color: ColorsManager.mainBlue,
                  size: 30.sp,
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                LocaleKeys.doctor_call_title.tr(),
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1F2937),
                ),
              ),
              SizedBox(height: 12.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F4F6),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  contact,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: ColorsManager.mainBlue,
                    letterSpacing: 1,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () => Navigator.pop(context),
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                      ),
                      child: Text(
                        LocaleKeys.doctor_close.tr(),
                        style: TextStyle(
                          color: const Color(0xFF6B7280),
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorsManager.mainBlue,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        LocaleKeys.doctor_call.tr(),
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
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
}
