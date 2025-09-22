import 'package:challenge_diabetes/core/helpers/constants.dart';
import 'package:challenge_diabetes/core/helpers/spacing.dart';
import 'package:challenge_diabetes/core/theming/colors.dart';
import 'package:challenge_diabetes/core/widget/cutom_app_bar.dart';
import 'package:challenge_diabetes/features/home/ui/widgets/exercise_card.dart';
import 'package:challenge_diabetes/features/home/ui/widgets/medications_card.dart';
import 'package:challenge_diabetes/features/home/ui/widgets/quick_actions_section.dart';
import 'package:challenge_diabetes/features/home/ui/widgets/quick_state_card.dart';
import 'package:challenge_diabetes/features/measurments/logic/pressure/pressure_cubit.dart';
import 'package:challenge_diabetes/features/measurments/logic/suger/suger_cubit.dart';
import 'package:challenge_diabetes/features/measurments/logic/weight/weight_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiabetesHomePage extends StatefulWidget {
  const DiabetesHomePage({super.key});

  @override
  State<DiabetesHomePage> createState() => _DiabetesHomePageState();
}

class _DiabetesHomePageState extends State<DiabetesHomePage>
    with AutomaticKeepAliveClientMixin, WidgetsBindingObserver {
  @override
  bool get wantKeepAlive => true;

  bool _isInitialized = false;
  bool _isRefreshing = false;
  DateTime? _lastRefresh;

  // Cache duration - 5 minutes
  static const Duration _cacheDuration = Duration(minutes: 5);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    // تأخير بسيط لضمان بناء الويدجت أولاً
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _initializeData();
      }
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed && mounted) {
      _refreshIfNeeded();
    }
  }

  // Initialize data only once or when needed
  Future<void> _initializeData() async {
    if (_isInitialized && !_shouldRefresh()) return;

    await _fetchAllData();
    _isInitialized = true;
  }

  bool _shouldRefresh() {
    if (_lastRefresh == null) return true;
    return DateTime.now().difference(_lastRefresh!) > _cacheDuration;
  }

  Future<void> _refreshIfNeeded() async {
    if (_shouldRefresh() && !_isRefreshing) {
      await _fetchAllData();
    }
  }

  Future<void> _fetchAllData() async {
    if (_isRefreshing) return;

    setState(() {
      _isRefreshing = true;
    });

    try {
      final today = DateHelper.formatDate(DateTime.now());

      // Fetch all data concurrently for better performance
      await Future.wait([
        _fetchSugarDataSafely(today),
        _fetchPressureDataSafely(today),
        _fetchWeightDataSafely(today),
      ]);

      _lastRefresh = DateTime.now();
    } catch (e) {
      debugPrint('Error fetching data: $e');
    } finally {
      if (mounted) {
        setState(() {
          _isRefreshing = false;
        });
      }
    }
  }

  Future<void> _fetchSugarDataSafely(String date) async {
    try {
      if (mounted) {
        await context.read<MeasurmentsCubit>().fetchSugarData(date);
      }
    } catch (e) {
      debugPrint('Error fetching sugar data: $e');
    }
  }

  Future<void> _fetchPressureDataSafely(String date) async {
    try {
      if (mounted) {
        await context.read<PressureCubit>().fetchPressureData(date);
      }
    } catch (e) {
      debugPrint('Error fetching pressure data: $e');
    }
  }

  Future<void> _fetchWeightDataSafely(String date) async {
    try {
      if (mounted) {
        await context.read<WeightCubit>().fetchWeightData(date);
      }
    } catch (e) {
      debugPrint('Error fetching weight data: $e');
    }
  }

  // Manual refresh function for pull-to-refresh
  Future<void> _onRefresh() async {
    _lastRefresh = null; // Force refresh
    await _fetchAllData();
  }

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    super.build(context); // Required for AutomaticKeepAliveClientMixin

    return Scaffold(
      backgroundColor: t.colorScheme.onPrimary,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _onRefresh,
          color: ColorsManager.mainBlue,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
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
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     
                      verticalSpace(10),
                  
                      // Quick Stats Card with refresh capability
                      QuickStateCard(
                        isRefreshing: _isRefreshing,
                        onRefresh: _onRefresh,
                      ),
                      verticalSpace(20),
                  
                      // Quick Actions
                      const QuickActionsSection(),
                      verticalSpace(20),
                  
                      // Medications Reminder
                      const MedicationsCard(),
                      verticalSpace(20),
                  
                      // Exercise Section
                      const ExerciseCard(),
                  
                      // Add some bottom padding for better UX
                      verticalSpace(20),
                    ],
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
