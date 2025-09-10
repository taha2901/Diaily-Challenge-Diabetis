import 'package:challenge_diabetes/core/helpers/constants.dart';
import 'package:challenge_diabetes/core/helpers/spacing.dart';
import 'package:challenge_diabetes/core/theming/colors.dart';
import 'package:challenge_diabetes/core/theming/styles.dart';
import 'package:challenge_diabetes/features/home/ui/widgets/state_item.dart';
import 'package:challenge_diabetes/features/measurments/logic/pressure/pressure_cubit.dart';
import 'package:challenge_diabetes/features/measurments/logic/pressure/pressure_state.dart';
import 'package:challenge_diabetes/features/measurments/logic/suger/suger_cubit.dart';
import 'package:challenge_diabetes/features/measurments/logic/suger/suger_state.dart';
import 'package:challenge_diabetes/features/measurments/logic/weight/weight_cubit.dart';
import 'package:challenge_diabetes/features/measurments/logic/weight/weight_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class QuickStateCard extends StatefulWidget {
  const QuickStateCard({super.key});

  @override
  State<QuickStateCard> createState() => _QuickStateCardState();
}

class _QuickStateCardState extends State<QuickStateCard>
    with AutomaticKeepAliveClientMixin {
  
  // للحفاظ على الـ state لما نرجع للصفحة
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _fetchAllData();
  }

  void _fetchAllData() {
    final today = DateHelper.formatDate(DateTime.now());
    
    context.read<MeasurmentsCubit>().fetchSugarData(today);
    context.read<PressureCubit>().fetchPressureData(today);
    context.read<WeightCubit>().fetchWeightData(today);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // مهم للـ AutomaticKeepAliveClientMixin
    
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Today\'s Readings', style: TextStyles.font18DarkBlueBold),
              // زر الـ refresh
              IconButton(
                onPressed: _fetchAllData,
                icon: Icon(
                  Icons.refresh,
                  color: ColorsManager.mainBlue,
                  size: 20,
                ),
              ),
            ],
          ),
          verticalSpace(16),
          Row(
            children: [
              // Sugar
              Expanded(
                child: BlocBuilder<MeasurmentsCubit, MeasurmentsState>(
                  builder: (context, state) {
                    return state.when(
                      initial: buildShimmerItem,
                      addBloodSugerLoading: buildShimmerItem,
                      addBloodSugerSuccess: buildShimmerItem,
                      addBloodSugerError: (error) =>
                          _errorBox("Sugar Error: $error"),
                      getBloodSugerLoading: buildShimmerItem,
                      getBloodSugerSuccess: (bloodSugar) {
                        if (bloodSugar.isEmpty) {
                          return _emptyBox("No Sugar Data");
                        }
                        final last = bloodSugar.last;
                        return StateItem(
                          icon: Icons.bloodtype,
                          label: 'Sugar',
                          value: last.sugarReading.toString(),
                          unit: 'mg/dL',
                          color: ColorsManager.red,
                          backgroundColor: ColorsManager.lighterRed,
                        );
                      },
                      getBloodSugerError: (error) =>
                          _errorBox("Sugar Error: $error"),
                    );
                  },
                ),
              ),

              horizontalSpace(12),

              // Pressure
              Expanded(
                child: BlocBuilder<PressureCubit, PressureState>(
                  builder: (context, state) {
                    return state.when(
                      initial: buildShimmerItem,
                      addBloodPressureLoading: buildShimmerItem,
                      addBloodPressureSuccess: buildShimmerItem,
                      addBloodPressureError: () => _errorBox("Pressure Error"),
                      getBloodPressureLoading: buildShimmerItem,
                      getBloodPressureSuccess: (pressures, heartRate) {
                        if (pressures.isEmpty) {
                          return _emptyBox("No Pressure Data");
                        }
                        final last = pressures.last;
                        return StateItem(
                          icon: Icons.favorite,
                          label: 'Pressure',
                          value:
                              "${last.systolicPressure}/${last.diastolicPressure}",
                          unit: 'mmHg',
                          color: ColorsManager.mainBlue,
                          backgroundColor: ColorsManager.lightBlue,
                        );
                      },
                      getBloodPressureError: () => _errorBox("Pressure Error"),
                      getBloodPressureEmpty: () =>
                          _emptyBox("No Pressure Data"),
                    );
                  },
                ),
              ),

              horizontalSpace(12),

              // Weight
              Expanded(
                child: BlocBuilder<WeightCubit, WeightState>(
                  builder: (context, state) {
                    return state.when(
                      initial: buildShimmerItem,
                      addWeightLoading: buildShimmerItem,
                      addWeightSuccess: buildShimmerItem,
                      addWeightError: () => _errorBox("Weight Error"),
                      getWeightLoading: buildShimmerItem,
                      getWeightSuccess: (weights) {
                        if (weights.isEmpty) {
                          return _emptyBox("No Weight Data");
                        }
                        final last = weights.last;
                        return StateItem(
                          icon: Icons.monitor_weight,
                          label: 'Weight',
                          value: last.weight.toString(),
                          unit: 'kg',
                          color: ColorsManager.lightGreen,
                          backgroundColor: ColorsManager.lighterGreen,
                        );
                      },
                      getWeightError: (error) =>
                          _errorBox("Weight Error: $error"),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildShimmerItem() => Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Container(
          height: 80.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      );

  Widget _errorBox(String error) => Container(
        height: 80.h,
        decoration: BoxDecoration(
          color: Colors.red.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            error,
            style: TextStyle(color: Colors.red, fontSize: 10.sp),
            textAlign: TextAlign.center,
          ),
        ),
      );

  Widget _emptyBox(String msg) => Container(
        height: 80.h,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            msg,
            style: TextStyle(color: Colors.grey, fontSize: 10.sp),
            textAlign: TextAlign.center,
          ),
        ),
      );
}