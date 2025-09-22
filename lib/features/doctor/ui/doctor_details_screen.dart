import 'package:challenge_diabetes/core/helpers/spacing.dart';
import 'package:challenge_diabetes/core/theming/colors.dart';
import 'package:challenge_diabetes/features/doctor/model/data/doctor_response_body.dart';
import 'package:challenge_diabetes/features/doctor/ui/doc_book_screen.dart';
import 'package:challenge_diabetes/features/doctor/ui/widgets/doctor_details/doc_hero_section.dart';
import 'package:challenge_diabetes/features/doctor/ui/widgets/doctor_details/doc_info_card_section.dart';
import 'package:challenge_diabetes/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class DoctorDetailsScreen extends StatelessWidget {
  final DoctorResponseBody doctor;

  const DoctorDetailsScreen({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFB),
      body: Stack(
        children: [
          // Background Gradient
          Container(
            height: 350.h,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  ColorsManager.mainBlue,
                  ColorsManager.mainBlue.withOpacity(0.8),
                  const Color(0xFF667eea),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          
          // Main Content
          Column(
            children: [
              
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      // Hero Section
                      DoctorHeroSection(doctor: doctor),
                      
                      // Info Cards Section
                      DoctorInfoCardsSection(doctor: doctor),
                      
                      SizedBox(height: 100.h), // Space for floating button
                    ],
                  ),
                ),
              ),
            ],
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
              const Icon(Icons.calendar_month, size: 22),
              horizontalSpace(8),
              Text(
                LocaleKeys.book_appointment.tr(),
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}