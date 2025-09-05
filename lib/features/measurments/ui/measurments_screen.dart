import 'package:challenge_diabetes/core/helpers/spacing.dart';
import 'package:challenge_diabetes/core/theming/colors.dart';
import 'package:challenge_diabetes/features/measurments/ui/widgets/blood_pressure.dart';
import 'package:challenge_diabetes/features/measurments/ui/widgets/blood_suger.dart';
import 'package:challenge_diabetes/features/measurments/ui/widgets/header_with_desc.dart';
import 'package:challenge_diabetes/features/measurments/ui/widgets/weight.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class MeasurementsScreen extends StatefulWidget {
  const MeasurementsScreen({super.key});

  @override
  State<MeasurementsScreen> createState() => _MeasurementsScreenState();
}

class _MeasurementsScreenState extends State<MeasurementsScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  // Controllers for forms
  final GlobalKey<FormState> _sugarFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _pressureFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _weightFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.mainBackGround,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.grey[800]),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'إضافة قياس',
          style: TextStyle(
            color: Colors.grey[800],
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          HeaderWithDescription(),
          // Tabs
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 10,
                ),
              ],
            ),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color:  ColorsManager.mainBlue,
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              dividerColor: Colors.transparent,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey[600],
              labelStyle: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
              tabs:  [
                Tab(
                  icon: Icon(Icons.bloodtype, size: 20.sp),
                  text: 'السكر',
                ),
                Tab(
                  icon: Icon(Icons.favorite, size: 20.sp),
                  text: 'الضغط',
                ),
                Tab(
                  icon: Icon(Icons.monitor_weight, size: 20.sp),
                  text: 'الوزن',
                ),
              ],
            ),
          ),

          verticalSpace(20),

          // Tab Content
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                BloodSugarForm(formKey: _sugarFormKey),
                BloodPressureForm(formKey: _pressureFormKey),
                WeightForm(formKey: _weightFormKey),
              ],
            ),
          ),

          // Save Button
          Container(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: _saveMeasurement,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3B82F6),
                  foregroundColor: Colors.white,
                  elevation: 2,
                  shadowColor: const Color(0xFF3B82F6).withOpacity(0.3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.save, size: 20),
                    SizedBox(width: 8),
                    Text(
                      'حفظ القياس',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _saveMeasurement() {
    GlobalKey<FormState>? currentFormKey;
    String measurementType = '';

    switch (_tabController.index) {
      case 0:
        currentFormKey = _sugarFormKey;
        measurementType = 'قياس السكر';
        break;
      case 1:
        currentFormKey = _pressureFormKey;
        measurementType = 'قياس الضغط';
        break;
      case 2:
        currentFormKey = _weightFormKey;
        measurementType = 'قياس الوزن';
        break;
    }

    if (currentFormKey?.currentState?.validate() ?? false) {
      // Here you would save to API
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('تم حفظ $measurementType بنجاح'),
          backgroundColor: const Color(0xFF10B981),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
      
      // Navigate back
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('يرجى ملء جميع الحقول المطلوبة'),
          backgroundColor: const Color(0xFFEF4444),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
    }
  }
}
