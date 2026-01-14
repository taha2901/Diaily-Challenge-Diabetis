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
import 'package:challenge_diabetes/gen/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class QuickStateCard extends StatefulWidget {
  final bool isRefreshing;
  final VoidCallback? onRefresh;

  const QuickStateCard({super.key, this.isRefreshing = false, this.onRefresh});

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
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.withOpacity(0.2)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.05),
              spreadRadius: 1,
              blurRadius: 5,
            ),
          ],
        ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LocaleKeys.todays_readings.tr(),
                style: TextStyles.font18DarkBlueBold,
              ),

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
                label: LocaleKeys.sugar.tr(),
                value: last.sugarReading.toString(),
                unit: 'mg/dL',
                color: ColorsManager.red,
                backgroundColor: ColorsManager.lighterRed,
              );
            }
            _cachedSugarWidget = widget;
            return widget;
          },
          getBloodSugerError: (error) =>
              _buildErrorBox(LocaleKeys.sugar_error.tr()),
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
          addBloodPressureLoading: () =>
              _cachedPressureWidget ?? _buildShimmerItem(),
          addBloodPressureSuccess: () =>
              _cachedPressureWidget ?? _buildShimmerItem(),
          addBloodPressureError: () =>
              _buildErrorBox(LocaleKeys.pressure_error.tr()),
          getBloodPressureLoading: () =>
              _cachedPressureWidget ?? _buildShimmerItem(),
          getBloodPressureSuccess: (pressures, heartRate) {
            Widget widget;
            if (pressures.isEmpty) {
              widget = _buildEmptyPressureBox();
            } else {
              final last = pressures.last;
              widget = StateItem(
                icon: Icons.favorite,
                label: LocaleKeys.pressure.tr(),
                value: "${last.systolicPressure}/${last.diastolicPressure}",
                unit: 'mmHg',
                color: ColorsManager.mainBlue,
                backgroundColor: ColorsManager.lightBlue,
              );
            }
            _cachedPressureWidget = widget;
            return widget;
          },
          getBloodPressureError: () =>
              _buildErrorBox(LocaleKeys.pressure_error.tr()),
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
          addWeightError: () => _buildErrorBox(LocaleKeys.weight_error.tr()),
          getWeightLoading: () => _cachedWeightWidget ?? _buildShimmerItem(),
          getWeightSuccess: (weights) {
            Widget widget;
            if (weights.isEmpty) {
              widget = _buildEmptyWeightBox();
            } else {
              final last = weights.last;
              widget = StateItem(
                icon: Icons.monitor_weight,
                label: LocaleKeys.weight.tr(),
                value: last.weight.toString(),
                unit: 'kg',
                color: ColorsManager.lightGreen,
                backgroundColor: ColorsManager.lighterGreen,
              );
            }
            _cachedWeightWidget = widget;
            return widget;
          },
          getWeightError: (error) =>
              _buildErrorBox(LocaleKeys.weight_error.tr()),
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
      label: LocaleKeys.weight.tr(),
      value: "--",
      unit: 'kg',
      color: ColorsManager.lightGreen.withOpacity(0.6),
      backgroundColor: ColorsManager.lighterGreen,
    );
  }

  Widget _buildEmptySugarBox() {
    return StateItem(
      icon: Icons.bloodtype,
      label: LocaleKeys.sugar.tr(),
      value: '--',
      unit: 'mg/dL',
      color: ColorsManager.red.withOpacity(0.6),
      backgroundColor: ColorsManager.lighterRed,
    );
  }

  Widget _buildEmptyPressureBox() {
    return StateItem(
      icon: Icons.favorite,
      label: LocaleKeys.pressure.tr(),
      value: "--/--",
      unit: 'mmHg',
      color: ColorsManager.mainBlue.withOpacity(0.6),
      backgroundColor: ColorsManager.lightBlue,
    );
  }
}

