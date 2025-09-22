import 'package:challenge_diabetes/gen/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class EmptyMedicine extends StatefulWidget {
  final VoidCallback? onAddMedicine;

  const EmptyMedicine({super.key, this.onAddMedicine});

  @override
  State<EmptyMedicine> createState() => _EmptyMedicineState();
}

class _EmptyMedicineState extends State<EmptyMedicine>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.elasticOut,
    ));

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return FadeTransition(
            opacity: _fadeAnimation,
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                      gradient: RadialGradient(
                        colors: [
                          Colors.green.shade100,
                          Colors.green.shade50,
                          Colors.white,
                        ],
                      ),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.green.withOpacity(0.2),
                          spreadRadius: 3,
                          blurRadius: 15,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Icon(
                        Icons.medical_services_outlined,
                        size: 70,
                        color: Colors.green.shade600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Text(
                    LocaleKeys.no_medicines_empty.tr(),
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade800,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Text(
                      LocaleKeys.start_journey.tr(),
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade600,
                        height: 1.6,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 40),
                  if (widget.onAddMedicine != null)
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.green.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 12,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: ElevatedButton.icon(
                        onPressed: widget.onAddMedicine,
                        icon: const Icon(Icons.add_box_outlined, color: Colors.white),
                        label: Text(
                          LocaleKeys.start_now.tr(),
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 18,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 0,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
