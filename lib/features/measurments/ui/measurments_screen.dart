import 'package:challenge_diabetes/core/helpers/constants.dart';
import 'package:challenge_diabetes/core/widget/cutom_app_bar.dart';
import 'package:challenge_diabetes/features/measurments/logic/pressure/pressure_cubit.dart';
import 'package:challenge_diabetes/features/measurments/logic/suger/suger_cubit.dart';
import 'package:challenge_diabetes/features/measurments/logic/weight/weight_cubit.dart';
import 'package:challenge_diabetes/features/measurments/ui/widgets/tabs/pressure_tabs.dart';
import 'package:challenge_diabetes/features/measurments/ui/widgets/tabs/weight_tabs.dart';
import 'package:challenge_diabetes/features/measurments/ui/widgets/tabs/suger_tap.dart';
import 'package:challenge_diabetes/features/measurments/ui/widgets/measurments_tabpar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/date_picker_widget.dart';

enum MeasurementType { bloodPressure, bloodSugar, weight }

class MeasurementsScreen extends StatefulWidget {
  const MeasurementsScreen({super.key});

  @override
  State<MeasurementsScreen> createState() => _MeasurementsScreenState();
}

class _MeasurementsScreenState extends State<MeasurementsScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  String _selectedDate = DateHelper.formatDate(DateTime.now());
  MeasurementType _currentType = MeasurementType.bloodPressure;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _fetchCurrentData();
    _tabController.addListener(_handleTabChange);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _fetchCurrentData() {
    switch (_currentType) {
      case MeasurementType.bloodPressure:
        context.read<PressureCubit>().fetchPressureData(_selectedDate);
        break;
      case MeasurementType.bloodSugar:
        context.read<MeasurmentsCubit>().fetchSugarData(_selectedDate);
        break;
      case MeasurementType.weight:
        context.read<WeightCubit>().fetchWeightData(_selectedDate);
        break;
    }
  }

  void _handleTabChange() {
    if (_tabController.indexIsChanging) {
      setState(() {
        _currentType = MeasurementType.values[_tabController.index];
      });
      _fetchCurrentData();
    }
  }

  void _onDateChanged(String newDate) {
    setState(() => _selectedDate = newDate);
    _fetchCurrentData();
  }

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: t.colorScheme.onPrimary,
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    t.colorScheme.primary.withOpacity(0.1),
                    t.colorScheme.primary.withOpacity(0.05),
                  ],
                ),
              ),
              child: const CustomAppBar(),
            ),
            DatePickerWidget(
              selectedDate: _selectedDate,
              onDateChanged: _onDateChanged,
            ),
            MeasurementsTabBar(controller: _tabController),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  PressureTab(selectedDate: _selectedDate),
                  SugarTab(selectedDate: _selectedDate),
                  WeightTab(selectedDate: _selectedDate),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
