import 'package:challenge_diabetes/core/helpers/spacing.dart';
import 'package:challenge_diabetes/core/routings/routers.dart';
import 'package:challenge_diabetes/core/theming/colors.dart';
import 'package:challenge_diabetes/features/doctor/model/data/doctor_response_body.dart';
import 'package:challenge_diabetes/features/doctor/ui/widgets/doctor/arrow_icon_widget.dart';
import 'package:challenge_diabetes/features/doctor/ui/widgets/doctor/doc_avatar.dart';
import 'package:challenge_diabetes/features/doctor/ui/widgets/doctor/doctor_name_widget.dart';
import 'package:challenge_diabetes/features/doctor/ui/widgets/doctor/doctor_rate_widget.dart';
import 'package:challenge_diabetes/features/doctor/ui/widgets/doctor/price_tag_of_doc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorCard extends StatefulWidget {
  final DoctorResponseBody doctor;
  final int index;

  const DoctorCard({
    super.key,
    required this.doctor,
    required this.index,
  });

  @override
  State<DoctorCard> createState() => _DoctorCardState();
}

class _DoctorCardState extends State<DoctorCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails details) {
    setState(() => _isPressed = true);
    _controller.forward();
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() => _isPressed = false);
    _controller.reverse();
  }

  void _handleTapCancel() {
    setState(() => _isPressed = false);
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: GestureDetector(
        onTapDown: _handleTapDown,
        onTapUp: _handleTapUp,
        onTapCancel: _handleTapCancel,
        onTap: () {
          Navigator.of(
            context,
          ).pushNamed(Routers.doctorDetails, arguments: widget.doctor);
        },
        child: Container(
          margin: EdgeInsets.only(bottom: 16.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
              BoxShadow(
                color: ColorsManager.mainBlue.withOpacity(0.1),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                // خلفية متدرجة خفيفة
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.white,
                          const Color.fromARGB(255, 152, 174, 207).withOpacity(0.02),
                        ],
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      //photo of doc
                      DocAvatar(
                        doctor: widget.doctor,
                      ),
                      horizontalSpace(16),

                      // Doc Info
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DoctorNameWidget(
                              doctor:  widget.doctor,
                            ),
                            verticalSpace(8),
                            DoctorRateWidget(
                              doctor: widget.doctor,
                            ),
                            if (widget.doctor.detectionPrice > 0) ...[
                              verticalSpace(8),
                              PriceTagOfDoc(
                                doctor: widget.doctor,
                              ),
                            ],
                          ],
                        ),
                      ),

                      ArrowIconWidget(),
                    ],
                  ),
                ),

                // شريط ملون علوي للتمييز
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 3,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          ColorsManager.mainBlue,
                          ColorsManager.mainBlue.withOpacity(0.5),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
