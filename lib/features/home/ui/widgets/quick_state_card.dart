// import 'package:challenge_diabetes/core/helpers/constants.dart';
// import 'package:challenge_diabetes/core/helpers/spacing.dart';
// import 'package:challenge_diabetes/core/theming/colors.dart';
// import 'package:challenge_diabetes/core/theming/styles.dart';
// import 'package:challenge_diabetes/features/home/ui/widgets/state_item.dart';
// import 'package:challenge_diabetes/features/measurments/logic/pressure/pressure_cubit.dart';
// import 'package:challenge_diabetes/features/measurments/logic/pressure/pressure_state.dart';
// import 'package:challenge_diabetes/features/measurments/logic/suger/suger_cubit.dart';
// import 'package:challenge_diabetes/features/measurments/logic/suger/suger_state.dart';
// import 'package:challenge_diabetes/features/measurments/logic/weight/weight_cubit.dart';
// import 'package:challenge_diabetes/features/measurments/logic/weight/weight_state.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:shimmer/shimmer.dart';

// class QuickStateCard extends StatefulWidget {
//   const QuickStateCard({super.key});

//   @override
//   State<QuickStateCard> createState() => _QuickStateCardState();
// }

// class _QuickStateCardState extends State<QuickStateCard>
//     with AutomaticKeepAliveClientMixin, WidgetsBindingObserver {
//   // للحفاظ على الـ state لما نرجع للصفحة
//   @override
//   bool get wantKeepAlive => true;

//   // هذه الدالة تستدعى عند العودة للصفحة
//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     super.didChangeAppLifecycleState(state);
//     if (state == AppLifecycleState.resumed) {
//       // تحديث البيانات عند العودة للتطبيق
//       _fetchAllData();
//     }
//   }

//   // إضافة دالة للتحديث من الخارج
//   void refreshData() {
//     _fetchAllData();
//   }

//   void _fetchAllData() {
//     final today = DateHelper.formatDate(DateTime.now());

//     // تحديث البيانات للجميع
//     context.read<MeasurmentsCubit>().fetchSugarData(today);
//     context.read<PressureCubit>().fetchPressureData(today);
//     context.read<WeightCubit>().fetchWeightData(today);
//   }

//   @override
//   Widget build(BuildContext context) {
//     super.build(context); // مهم للـ AutomaticKeepAliveClientMixin

//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.1),
//             spreadRadius: 1,
//             blurRadius: 10,
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text('Today\'s Readings', style: TextStyles.font18DarkBlueBold),
//               // زر الـ refresh
//               IconButton(
//                 onPressed: _fetchAllData,
//                 icon: Icon(
//                   Icons.refresh,
//                   color: ColorsManager.mainBlue,
//                   size: 20,
//                 ),
//               ),
//             ],
//           ),
//           verticalSpace(16),
//           Row(
//             children: [
//               // Sugar
//               Expanded(
//                 child: BlocBuilder<MeasurmentsCubit, MeasurmentsState>(
//                   builder: (context, state) {
//                     return state.when(
//                       initial: buildShimmerItem,
//                       addBloodSugerLoading: buildShimmerItem,
//                       addBloodSugerSuccess: buildShimmerItem,
//                       addBloodSugerError: (error) =>
//                           _errorBox("Sugar Error: $error"),
//                       getBloodSugerLoading: buildShimmerItem,
//                       getBloodSugerSuccess: (bloodSugar) {
//                         if (bloodSugar.isEmpty) {
//                           return _emptySugerBox();
//                         }
//                         final last = bloodSugar.last;
//                         return StateItem(
//                           icon: Icons.bloodtype,
//                           label: 'Sugar',
//                           value: last.sugarReading.toString(),
//                           unit: 'mg/dL',
//                           color: ColorsManager.red,
//                           backgroundColor: ColorsManager.lighterRed,
//                         );
//                       },
//                       getBloodSugerError: (error) =>
//                           _errorBox("Sugar Error: $error"),
//                     );
//                   },
//                 ),
//               ),

//               horizontalSpace(12),

//               // Pressure
//               Expanded(
//                 child: BlocBuilder<PressureCubit, PressureState>(
//                   builder: (context, state) {
//                     return state.when(
//                       initial: buildShimmerItem,
//                       addBloodPressureLoading: buildShimmerItem,
//                       addBloodPressureSuccess: buildShimmerItem,
//                       addBloodPressureError: () => _errorBox("Pressure Error"),
//                       getBloodPressureLoading: buildShimmerItem,
//                       getBloodPressureSuccess: (pressures, heartRate) {
//                         if (pressures.isEmpty) {
//                           return _emptyPressureBox();
//                         }
//                         final last = pressures.last;
//                         return StateItem(
//                           icon: Icons.favorite,
//                           label: 'Pressure',
//                           value:
//                               "${last.systolicPressure}/${last.diastolicPressure}",
//                           unit: 'mmHg',
//                           color: ColorsManager.mainBlue,
//                           backgroundColor: ColorsManager.lightBlue,
//                         );
//                       },
//                       getBloodPressureError: () => _errorBox("Pressure Error"),
//                       getBloodPressureEmpty: () =>
//                           _emptyPressureBox(),
//                     );
//                   },
//                 ),
//               ),

//               horizontalSpace(12),

//               // Weight
//               Expanded(
//                 child: BlocBuilder<WeightCubit, WeightState>(
//                   builder: (context, state) {
//                     return state.when(
//                       initial: buildShimmerItem,
//                       addWeightLoading: buildShimmerItem,
//                       addWeightSuccess: buildShimmerItem,
//                       addWeightError: () => _errorBox("Weight Error"),
//                       getWeightLoading: buildShimmerItem,
//                       getWeightSuccess: (weights) {
//                         if (weights.isEmpty) {
//                           return _emptyWeightBox();
//                         }
//                         final last = weights.last;
//                         return StateItem(
//                           icon: Icons.monitor_weight,
//                           label: 'Weight',
//                           value: last.weight.toString(),
//                           unit: 'kg',
//                           color: ColorsManager.lightGreen,
//                           backgroundColor: ColorsManager.lighterGreen,
//                         );
//                       },
//                       getWeightError: (error) =>
//                           _errorBox("Weight Error: $error"),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildShimmerItem() => Shimmer.fromColors(
//     baseColor: Colors.grey.shade300,
//     highlightColor: Colors.grey.shade100,
//     child: Container(
//       height: 80.h,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//       ),
//     ),
//   );

//   Widget _errorBox(String error) => Container(
//     height: 80.h,
//     decoration: BoxDecoration(
//       color: Colors.red.withOpacity(0.1),
//       borderRadius: BorderRadius.circular(16),
//     ),
//     child: Center(
//       child: Text(
//         error,
//         style: TextStyle(color: Colors.red, fontSize: 10.sp),
//         textAlign: TextAlign.center,
//       ),
//     ),
//   );

//   Widget _emptyWeightBox() => StateItem(
//     icon: Icons.monitor_weight,
//     label: 'Weight',
//     value: "??",
//     unit: 'kg',
//     color: ColorsManager.lightGreen,
//     backgroundColor: ColorsManager.lighterGreen,
//   );

//   Widget _emptySugerBox() => StateItem(
//     icon: Icons.bloodtype,
//     label: 'Sugar',
//     value: '??',
//     unit: 'mg/dL',
//     color: ColorsManager.red,
//     backgroundColor: ColorsManager.lighterRed,
//   );

//   Widget _emptyPressureBox() => StateItem(
//     icon: Icons.favorite,
//     label: 'Pressure',
//     value: "${'??'}/${'??'}",
//     unit: 'mmHg',
//     color: ColorsManager.mainBlue,
//     backgroundColor: ColorsManager.lightBlue,
//   );
// }




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
  final bool isRefreshing;
  final VoidCallback? onRefresh;
  
  const QuickStateCard({
    super.key,
    this.isRefreshing = false,
    this.onRefresh,
  });

  @override
  State<QuickStateCard> createState() => _QuickStateCardState();
}

class _QuickStateCardState extends State<QuickStateCard>
    with AutomaticKeepAliveClientMixin {
  
  @override
  bool get wantKeepAlive => true;

  // Cache the last successful states to prevent unnecessary rebuilds
  Widget? _cachedSugarWidget;
  Widget? _cachedPressureWidget;
  Widget? _cachedWeightWidget;

  @override
  Widget build(BuildContext context) {
    super.build(context); // Required for AutomaticKeepAliveClientMixin

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
              
              // Refresh button with loading state
              widget.isRefreshing
                  ? SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          ColorsManager.mainBlue,
                        ),
                      ),
                    )
                  : IconButton(
                      onPressed: widget.onRefresh,
                      icon: Icon(
                        Icons.refresh,
                        color: ColorsManager.mainBlue,
                        size: 20,
                      ),
                      splashRadius: 20,
                      tooltip: 'Refresh readings',
                    ),
            ],
          ),
          verticalSpace(16),
          
          Row(
            children: [
              // Sugar Reading
              Expanded(child: _buildSugarWidget()),
              horizontalSpace(12),
              
              // Pressure Reading  
              Expanded(child: _buildPressureWidget()),
              horizontalSpace(12),
              
              // Weight Reading
              Expanded(child: _buildWeightWidget()),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSugarWidget() {
    return BlocBuilder<MeasurmentsCubit, MeasurmentsState>(
      buildWhen: (previous, current) {
        // Only rebuild when state actually changes
        return current != previous;
      },
      builder: (context, state) {
        return state.when(
          initial: () => _buildShimmerItem(),
          addBloodSugerLoading: () => _cachedSugarWidget ?? _buildShimmerItem(),
          addBloodSugerSuccess: () => _cachedSugarWidget ?? _buildShimmerItem(),
          addBloodSugerError: (error) => _buildErrorBox("خطأ في السكر"),
          getBloodSugerLoading: () => _cachedSugarWidget ?? _buildShimmerItem(),
          getBloodSugerSuccess: (bloodSugar) {
            Widget widget;
            if (bloodSugar.isEmpty) {
              widget = _buildEmptySugarBox();
            } else {
              final last = bloodSugar.last;
              widget = StateItem(
                icon: Icons.bloodtype,
                label: 'Sugar',
                value: last.sugarReading.toString(),
                unit: 'mg/dL',
                color: ColorsManager.red,
                backgroundColor: ColorsManager.lighterRed,
              );
            }
            _cachedSugarWidget = widget;
            return widget;
          },
          getBloodSugerError: (error) => _buildErrorBox("خطأ في السكر"),
        );
      },
    );
  }

  Widget _buildPressureWidget() {
    return BlocBuilder<PressureCubit, PressureState>(
      buildWhen: (previous, current) {
        return current != previous;
      },
      builder: (context, state) {
        return state.when(
          initial: () => _buildShimmerItem(),
          addBloodPressureLoading: () => _cachedPressureWidget ?? _buildShimmerItem(),
          addBloodPressureSuccess: () => _cachedPressureWidget ?? _buildShimmerItem(),
          addBloodPressureError: () => _buildErrorBox("خطأ في الضغط"),
          getBloodPressureLoading: () => _cachedPressureWidget ?? _buildShimmerItem(),
          getBloodPressureSuccess: (pressures, heartRate) {
            Widget widget;
            if (pressures.isEmpty) {
              widget = _buildEmptyPressureBox();
            } else {
              final last = pressures.last;
              widget = StateItem(
                icon: Icons.favorite,
                label: 'Pressure',
                value: "${last.systolicPressure}/${last.diastolicPressure}",
                unit: 'mmHg',
                color: ColorsManager.mainBlue,
                backgroundColor: ColorsManager.lightBlue,
              );
            }
            _cachedPressureWidget = widget;
            return widget;
          },
          getBloodPressureError: () => _buildErrorBox("خطأ في الضغط"),
          getBloodPressureEmpty: () {
            final widget = _buildEmptyPressureBox();
            _cachedPressureWidget = widget;
            return widget;
          },
        );
      },
    );
  }

  Widget _buildWeightWidget() {
    return BlocBuilder<WeightCubit, WeightState>(
      buildWhen: (previous, current) {
        return current != previous;
      },
      builder: (context, state) {
        return state.when(
          initial: () => _buildShimmerItem(),
          addWeightLoading: () => _cachedWeightWidget ?? _buildShimmerItem(),
          addWeightSuccess: () => _cachedWeightWidget ?? _buildShimmerItem(),
          addWeightError: () => _buildErrorBox("خطأ في الوزن"),
          getWeightLoading: () => _cachedWeightWidget ?? _buildShimmerItem(),
          getWeightSuccess: (weights) {
            Widget widget;
            if (weights.isEmpty) {
              widget = _buildEmptyWeightBox();
            } else {
              final last = weights.last;
              widget = StateItem(
                icon: Icons.monitor_weight,
                label: 'Weight',
                value: last.weight.toString(),
                unit: 'kg',
                color: ColorsManager.lightGreen,
                backgroundColor: ColorsManager.lighterGreen,
              );
            }
            _cachedWeightWidget = widget;
            return widget;
          },
          getWeightError: (error) => _buildErrorBox("خطأ في الوزن"),
        );
      },
    );
  }

  Widget _buildShimmerItem() {
    return Shimmer.fromColors(
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
  }

  Widget _buildErrorBox(String error) {
    return Container(
      height: 80.h,
      decoration: BoxDecoration(
        color: Colors.red.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.red.withOpacity(0.3)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, color: Colors.red, size: 16),
          SizedBox(height: 4),
          Text(
            error,
            style: TextStyle(
              color: Colors.red,
              fontSize: 10.sp,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyWeightBox() {
    return StateItem(
      icon: Icons.monitor_weight,
      label: 'Weight',
      value: "--",
      unit: 'kg',
      color: ColorsManager.lightGreen.withOpacity(0.6),
      backgroundColor: ColorsManager.lighterGreen,
    );
  }

  Widget _buildEmptySugarBox() {
    return StateItem(
      icon: Icons.bloodtype,
      label: 'Sugar',
      value: '--',
      unit: 'mg/dL',
      color: ColorsManager.red.withOpacity(0.6),
      backgroundColor: ColorsManager.lighterRed,
    );
  }

  Widget _buildEmptyPressureBox() {
    return StateItem(
      icon: Icons.favorite,
      label: 'Pressure',
      value: "--/--",
      unit: 'mmHg',
      color: ColorsManager.mainBlue.withOpacity(0.6),
      backgroundColor: ColorsManager.lightBlue,
    );
  }
}